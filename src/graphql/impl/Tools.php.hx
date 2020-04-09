package graphql.impl;

import php.*;

@:forward
abstract Struct<T:{}>(NativeStructArray<T>) from NativeStructArray<T> {
  @:op(a.b) inline function get(field: String) {
    return untyped this[field];
  }
}

abstract InputArray<T>(NativeArray) from NativeArray {
  @:from inline static function fromArray<T>(array: Array<T>): InputArray<T>
    return php.Lib.toPhpArray(array);
}

@:forward
abstract Record<T>(Dynamic<T>) {
  @:from inline public static function fromDynamic<T>(obj: Dynamic<T>): Record<T> {
    return cast php.Syntax.array(obj);
  }
}

@:keep
private class ArrayOrObject implements JsonSerializable<Dynamic> {
  var arr = new NativeArray();
  var length: Int = 0;

  public function new(v: NativeArray, once = false)
    Syntax.foreach(v, function(index: Int, item: Dynamic) {
      arr[index] = if (once) item else Tools.haxify(item);
      length++;
    });

  @:keep @:phpMagic
  function __get(name: String)
    return Global.array_key_exists(name, arr) ? arr[name] : null;

  @:keep @:phpMagic
  function __isset(name: String)
    return Global.array_key_exists(name, arr);

  @:keep @:phpMagic
  function __set(name: String, v: Dynamic)
    return arr[name] = v;

  @:keep @:phpMagic
  function __toString()
    return '${arr}';

  @:keep
  function jsonSerialize()
    return arr;
}

class Tools {
  public static function toNativePromise<T>(promise: tink.core.Promise<T>) {
    if (!tink.core.Future.isFuture(promise))
      return cast promise;
    return new graphql.impl.Php.Deferred(() -> {
      var res: Dynamic = null;
      promise.handle(outcome -> switch outcome {
        case Success(v): res = v;
        case Failure(e): throw e;
      });
      return res;
    });
  }

  public static function haxify<T>(value: T, once = false): T {
    if (Global.is_object(value)) {
      var result = new NativeAssocArray();
      Syntax.foreach(value, function(fieldName: String, fieldValue: Dynamic) {
        result[fieldName] = if (once) fieldValue else haxify(fieldValue);
      });
      return Boot.createAnon(result);
    }
    if (Global.is_array(value))
      return cast new ArrayOrObject(cast value, once);
    return value;
  }
}
