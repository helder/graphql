package graphql.macro;

import haxe.macro.Expr;
import haxe.macro.Type;
import haxe.macro.Context;

class BuildTypeInfo {
  static var tmp = 0;

  public static function genTypeInfo(cb: (types: Array<ModuleType>) ->
    Expr): Expr {
    var generated = false;
    final gen = tmp++;
    final implName = 'TypeInfo_' + gen;
    final module = 'gen.$implName';
    Context.onAfterTyping((types) -> {
      if (generated)
        return;
      generated = true;
      final data = cb(types);
      final impl = macro class $implName {
        @:keep public static final get = $data;
      }
      impl.pos = data.pos;
      impl.meta = [{name: ':keep', pos: data.pos}];
      impl.pack = ['gen'];
      Context.defineModule(module, [impl]);
    });
    return macro Reflect.field(std.Type.resolveClass($v{module}), 'get');
  }
}
