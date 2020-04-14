package graphql.macro;

import haxe.macro.Expr;
import haxe.macro.Type;
import haxe.macro.Context;

using haxe.macro.TypeTools;
using tink.MacroApi;

typedef TypeInfo = {
  type: Type,
  pos: Position,
  expr: Expr
}

class TypeMap {
  var unique = 0;
  var afterTyping = false;
  final types = new Map<String, TypeInfo>();

  public function new() {}

  public function schemaOfType(queryType: Expr, ?mutationType: Expr): Expr {
    final query = defineType(typeFromExpr(queryType), queryType.pos, false);
    final mutation = switch mutationType {
      case null: macro null;
      case e: defineType(typeFromExpr(e), e.pos, false);
    }
    final definitions = [
      for (name => info in types)
        macro @:pos(info.pos) typeMap[$v{name}] = ${info.expr}
    ];
    return macro @:pos(queryType.pos) {
      final typeMap = new Map<String, graphql.Type.GraphQLType>();
      $b{definitions};
      graphql.Type.schema({
        query: ${query},
        mutation: ${mutation},
        types: [for (type in typeMap) type]
      });
    }
  }

  function typeFromExpr(e: Expr): Type
    return Context.resolveType(e.toString().asComplexType(), e.pos);

  function defineNamedType(name: String, type: Type, pos: Position,
      build: () -> Expr) {
    return switch types[name] {
      case null:
        types[name] = {type: type, pos: pos, expr: null}
        final expr = build(); // work around recursive types
        types[name].expr = expr;
        if (!afterTyping) macro @:pos(pos) cast typeMap[$v{name}] else
          macro @:pos(pos) cast typeMap[$v{name}] = $expr;
      case {type: _.toString() == type.toString() => true}:
        macro @:pos(pos) cast typeMap[$v{name}];
      case {type: other, pos: prev}:
        pos.warning('[graphql] Two types share the name "$name"');
        type.getPosition()
          .sure()
          .warning('[graphql] Tried to define (${type.toString()}) ...');
        prev.error('[graphql] But was already defined here (${other.toString()})');
    }
  }

  public function defineType(type: Type, pos: Position, input: Bool): Expr {
    final createObject = if (input) macro graphql.Type.inputObject else
      macro graphql.Type.object;
    final id = (name: String) -> (input ? 'Input$name' : name);
    return switch type {
      case TFun(_, ret):
        defineType(ret, pos, input);
      case TAbstract(_.get() => {name: 'Null', pack: []}, [param]):
        defineType(param, pos, input);
      case TAbstract(_.get() => {
        name: 'Future',
        module: 'tink.core.Future'
      }, [param]):
        defineType(param, pos, input);
      case TAbstract(_.get() => def = {
        name: 'Promise',
        module: 'tink.core.Promise'
      }, [param]):
        defineType(param, pos, input);
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
        macro @:pos(pos) graphql.Type.list(${defineType(param, pos, input)});
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
            defineNamedType(id(name), type, pos, () -> macro $createObject({
              name: $v{id(name)},
              description: $v{doc},
              fields: ${buildFields(inner, fields, pos, input)}
            }));
          case t:
            final applied = t.applyTypeParameters(p, params);
            defineType(applied, pos, input);
        }
      case TAnonymous(_.get() => {fields: fields}):
        pos.warning('[graphql] Anonymous objects need to be named.\n'
          + '[graphql] Provide a name for ${type.toString()} by using typedef');
        final name = 'Anonymous_' + (unique++);
        defineNamedType(name, type, pos, () -> macro $createObject({
          name: $v{name},
          fields: ${buildFields(type, fields, pos, input)}
        }));
      case TLazy(f):
        defineType(f(), pos, input);
      case TAbstract(_.get() => {name: 'Map', pack: ['haxe', 'ds']}, _):
        pos.error('[graphql] Cannot create schema for map type ${type.toString()}');
      case TInst(_.get() => def = {
        isInterface: isInterface,
        fields: _.get() => fields
      }, params):
        final applied = type.applyTypeParameters(def.params, params);
        final factory = if (isInterface) macro graphql.Type.interfaceType else
          createObject;
        if (isInterface) {
          // Generate a type for each implementing class
          final implementorDefs = BuildTypeInfo.genTypeInfo((types) -> {
            afterTyping = true;
            final res = [];
            for (type in types) {
              switch type {
                case TClassDecl(ref):
                  for (i in ref.get().interfaces) {
                    final type = i.t.get();
                    if (type.name == def.name && type.module == def.module) {
                      final sub = ref.get();
                      if (sub.isPrivate)
                        sub.pos.error('[graphql] Cannot create subtype "${sub.name}" '
                          + 'of interface "${def.name}" because it is private');
                      res.push(defineType(TInst(ref, []), pos, input));
                    }
                  }
                default:
              }
            }
            return macro(typeMap: Map<String, graphql.Type.GraphQLType>) ->
              $a{res};
          });
          final iName = id(def.name);
          defineNamedType(iName, applied, pos, () -> macro {
            typeMap[$v{iName}] = $factory({
              name: $v{iName},
              description: $v{def.doc},
              fields: ${buildFields(applied, fields, pos, input)}
            });
            $implementorDefs(typeMap);
            typeMap[$v{iName}];
          });
        } else {
          final interfaces = [
            for (i in def.interfaces)
              defineType(TInst(i.t, []), pos, input)
          ];
          final oName = id(def.name);
          final path = def.module.split('.')
            .concat([def.name])
            .join('.')
            .resolve();
          final isTypeOf = if (interfaces.length > 0) macro(v,
            _) -> Std.is(v, $path) else macro null;
          defineNamedType(oName, applied, pos, () -> macro $factory({
            name: $v{oName},
            description: $v{def.doc},
            fields: ${buildFields(applied, fields, pos, input)},
            interfaces: $a{interfaces},
            isTypeOf: $isTypeOf
          }));
        }
      default:
        pos.error('[graphql] Not a valid GraphQLType: ${type.toString()} (${type})');
    }
  }

  function argsOfType(type: Type, pos: Position): Expr {
    return switch type {
      case TFun(args, _) | TLazy(_() => TFun(args, _)):
        EObjectDecl([
          for (arg in args)
            {
              field: arg.name,
              expr: macro @:pos(pos) {
                type:${defineOptionalInputType(arg.t, pos, arg.opt)}
              }
            }
        ]).at(pos);
      default: macro @:pos(pos) null;
    }
  }

  function defineOptionalInputType(type: Type, pos: Position, optional: Bool)
    return if (optional) defineType(type, pos,
      true) else macro @:pos(pos) graphql.Type.nonNull(${
      defineType(type, pos, true)
    });

  function buildFields(from: Type, fields: Array<ClassField>, pos: Position,
      input: Bool): Expr {
    final fieldsExpr = EObjectDecl([
      for (field in fields)
        if (field.isPublic && !field.type.match(TFun(_, TAbstract(_.get() => {
          name: 'Void',
          pack: []
        }, _)))) {
            field: field.name,
            expr: if (input) macro @:pos(field.pos) {
              type:${
                defineType(field.type, field.pos, input)
              }, description:$v{field.doc}
            } else macro @:pos(field.pos) {
              type:${
                defineType(field.type, field.pos, input)
              }, description:$v{field.doc}, args:${
                argsOfType(field.type, field.pos)
              }, resolve:${resolveField(from, field)}
            }
          }
    ]).at(pos);
    final fieldFactory = if (input) macro graphql.Type.inputFields else
      macro graphql.Type.fields;
    return macro @:pos(pos) () -> $fieldFactory($fieldsExpr);
  }

  function resolveField(from: Type, field: ClassField): Expr {
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
          .func(['value'.toArg(from.toComplex()), 'args'.toArg()])
          .asExpr();
        final returns = ret.toComplex();
        macro($resolver : graphql.Type.Resolver<$returns>);
      /*case {kind: FVar(AccNormal, _)}:
        macro null; */
      case {kind: FVar(AccNormal | AccCall | AccInline, _)}:
        final name = field.name;
        final resolver = (macro value.$name)
          .func(['value'.toArg(from.toComplex())])
          .asExpr();
        final returns = field.type.toComplex();
        macro($resolver : graphql.Type.Resolver<$returns>);
      case v:
        field.pos.error('Could not resolve field: ${v}');
    }
  }
}

class GraphQLTypeBuilder {
  // Todo: interfaces (union types?)
  macro public static function schemaOfType(e: Expr) {
    return new TypeMap().schemaOfType(e);
  }
}
