package graphql.impl;

import php.*;

typedef Struct<T:{}> = NativeStructArray<T>;

@:forward
abstract Record<T>(Dynamic<T>) {
  @:from public static function fromDynamic<T>(obj: Dynamic<T>): Record<T> {
    return cast php.Syntax.array(obj);
  }
}

abstract Args(Dynamic) {
  @:op(a.b) inline static function get(args: Args, field: String) {
    return untyped args[field];
  }

  @:op(a.b) inline static function set<V>(args: Args, field: String, v: V) {
    return untyped args[field] = v;
  }
}

@:keep
private class ArrayOrObject {
  var arr = new NativeArray();
  var length: Int;

  public function new(v: NativeArray)
    Syntax.foreach(v, function(index: Int, item: Dynamic) {
      arr[index] = Tools.haxify(item);
      length++;
    });

  @:keep @:phpMagic
  function __get(name: String)
    return arr[name];

  @:keep @:phpMagic
  function __set(name: String, v: Dynamic)
    return arr[name] = v;
}

class Tools {
  public static function haxify<T>(value: T): T {
    if (Global.is_object(value)) {
      var result = new NativeAssocArray();
      var data = Syntax.array(value);
      Syntax.foreach(data, function(fieldName: String, fieldValue: Dynamic) {
        result[fieldName] = haxify(fieldValue);
      });

      return Boot.createAnon(result);
    }

    if (Global.is_array(value)) {
      return cast new ArrayOrObject(cast value);
    }

    return value;
  }
}
