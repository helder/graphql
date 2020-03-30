package graphql.impl;

import php.*;

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
