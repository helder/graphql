package graphql.macro;

import haxe.macro.Expr;
import haxe.macro.Type;
import haxe.macro.Context;

using haxe.macro.TypeTools;
using tink.MacroApi;

typedef TypeMap = Map<String, {
  pos: Position,
  type: Type
}>;

class GraphQLTypeBuilder {
  static var unique = 0;

  // Todo: Collect referenced types (interface implementations)
  // and mutations (mark with metadata)
  macro public static function schemaOfType(e: Expr) {
    return macro @:pos(e.pos) graphql.Type.schema({
      query: ${fromType(e)}
    });
  }

  static function fromType(e: Expr) {
    final types = new TypeMap();
    final type = Context.resolveType(e.toString().asComplexType(), e.pos);
    return macro @:pos(e.pos) {
      final typeMap = new Map<String, graphql.Type.GraphQLType>();
      function defineType<T>(fullName: String, define: () -> T): T
        return switch typeMap[fullName] {
          case null: cast typeMap[fullName] = cast define();
          case v: cast v;
        }
      ${buildType(types, type, e.pos, false)};
    }
  }

  static function buildType(types: TypeMap, type: Type, pos: Position,
      input: Bool): Expr {
    final createObject = if (input) macro graphql.Type.inputObject else
      macro graphql.Type.object;
    final id = (name: String) -> (input ? 'Input$name' : name);
    function makeNamedType(type: Type, name: String, make: () -> Expr) {
      return switch types[name] {
        case null:
          types[name] = {type: type, pos: pos}
          macro @:pos(pos) defineType($v{name}, () -> ${make()});
        case {type: exists}
          if (exists.toString() == type.toString()):
          macro @:pos(pos) typeMap[$v{name}];
        case {type: other, pos: prev}:
          pos.warning('Two types share the name "$name"');
          type.getPosition()
            .sure().warning('Tried to define (${type.toString()}) ...');
          prev.error('But was already defined here (${other.toString()})');
      }
    }
    return switch type {
      case TFun(_, ret):
        buildType(types, ret, pos, input);
      case TAbstract(_.get() => {name: 'Null', pack: []}, [param]):
        buildType(types, param, pos, input);
      case TAbstract(_.get() => {
        name: 'Future',
        module: 'tink.core.Future'
      }, [param]):
        buildType(types, param, pos, input);
      case TAbstract(_.get() => def = {
        name: 'Promise',
        module: 'tink.core.Promise'
      }, [param]):
        buildType(types, param, pos, input);
      case TAbstract(_.get() => {name: 'Float', pack: []}, _):
        macro @:pos(pos) graphql.Type.float();
      case TAbstract(_.get() => {name: 'Int', pack: []}, _):
        macro @:pos(pos) graphql.Type.int();
      case TAbstract(_.get() => {name: 'Bool', pack: []}, _):
        macro @:pos(pos) graphql.Type.boolean();
      case TInst(_.get() => {name: 'String', pack: []}, _):
        macro @:pos(pos) graphql.Type.string();
      case TInst(_.get() => def = {
        name: 'Array',
        pack: []
      }, [param]) | TInst(_.get() => def = {
          name: 'List',
          pack: ['haxe', 'ds']
        }, [param]):
        macro @:pos(pos) graphql.Type.list(${buildType(types, param, pos, input)});
      case TType(_.get() => {type: t = TType(_, _) | TLazy(_() => TType(_, _))}, _):
        buildType(types, t, pos, input);
      case TAbstract(_.get() => {
        type: inner,
        name: name,
        doc: doc,
        params: p
      }, params) | TType(_.get() => {
          type: inner,
          name: name,
          doc: doc,
          params: p
        }, params):
        switch Context.follow(inner, true) {
          case TAnonymous(_.get() => {fields: fields}):
            makeNamedType(type, id(name), () -> macro $createObject({
              name: $v{id(name)},
              description: $v{doc},
              fields: ${buildFields(types, inner, fields, pos, input)}
            }));
          case t:
            final applied = t.applyTypeParameters(p, params);
            buildType(types, applied, pos, input);
        }
      case TAnonymous(_.get() => {fields: fields}):
        pos.warning('Anonymous objects need to be named.\n' +
          'Provide a name for ${type.toString()} by using typedef');
        final name = 'Anonymous_' + (unique++);
        makeNamedType(type, name, () -> macro $createObject({
          name: $v{name},
          fields: ${buildFields(types, type, fields, pos, input)}
        }));
      case TLazy(f):
        buildType(types, f(), pos, input);
      case TAbstract(_.get() => {name: 'Map', pack: ['haxe', 'ds']}, _):
        pos.error('Cannot create schema for map type ${type.toString()}');
      case TInst(_.get() => def = {fields: _.get() => fields}, params):
        final applied = type.applyTypeParameters(def.params, params);
        makeNamedType(applied, id(def.name), () -> macro $createObject({
          name: $v{id(def.name)},
          description: $v{def.doc},
          fields: ${buildFields(types, applied, fields, pos, input)}
        }));
      default:
        pos.error('Not a valid GraphQLType: ${type.toString()} (${type})');
    }
  }

  static function argsOfType(types: TypeMap, type: Type, pos: Position): Expr {
    return switch type {
      case TFun(args, _) | TLazy(_() => TFun(args, _)):
        EObjectDecl([
          for (arg in args)
            {
              field: arg.name,
              expr: macro @:pos(pos) {
                type:${buildInputTypeOptional(types, arg.t, pos, arg.opt)}
              }
            }
        ]).at(pos);
      default: macro @:pos(pos) null;
    }
  }

  static function buildInputTypeOptional(types: TypeMap, type: Type,
      pos: Position, optional: Bool)
    return if (optional)
      buildType(types, type, pos, true)
    else
      macro @:pos(pos) graphql.Type.nonNull(${buildType(types, type, pos, true)});

  static function buildFields(types: TypeMap, from: Type,
      fields: Array<ClassField>, pos: Position, input: Bool): Expr {
    return EObjectDecl([
      for (field in fields)
        if (field.isPublic && !field.type.match(TFun(_, TAbstract(_.get() => {
          name: 'Void',
          pack: []
        }, _))))
          {
            field: field.name,
            expr: if (input) macro @:pos(field.pos) {
              type:${buildType(types, field.type, field.pos, input)},
              description:$v{field.doc}
            } else macro @:pos(field.pos) {
              type:${
                buildType(types, field.type, field.pos, input)
              }, description:$v{field.doc},
              args:${argsOfType(types, field.type, field.pos)},
              resolve:${resolveField(from, field)}
            }
          }
    ]).at(pos);
  }

  static function resolveField(from: Type, field: ClassField): Expr {
    return switch field {
      case {
        kind: FMethod(_) | FVar(AccNormal, _),
        type: TFun(args, ret) | TLazy(_() => TFun(args, ret))
      }:
        final argsExpr = [
          for (arg in args) {
            final name = arg.name;
            macro args.$name;
          }
        ];
        final name = field.name;
        final resolver = (macro value.$name($a{argsExpr}))
          .func(['value'.toArg(from.toComplex()), 'args'.toArg()]).asExpr();
        final returns = ret.toComplex();
        macro($resolver : graphql.Type.Resolver<$returns>);
      case {kind: FVar(AccNormal, _)}:
        macro null;
      case {kind: FVar(AccCall | AccInline, _)}:
        final name = field.name;
        final resolver = (macro value.$name)
          .func(['value'.toArg(from.toComplex())]).asExpr();
        final returns = field.type.toComplex();
        macro($resolver : graphql.Type.Resolver<$returns>);
      case v:
        field.pos.error('Could not resolve field: ${v}');
    }
  }
}
