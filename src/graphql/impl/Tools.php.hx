package graphql.impl;

import php.*;

typedef Struct<T:{}> = NativeStructArray<T>;

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

  @:keep
  function jsonSerialize()
    return arr;
}

class Tools {
  inline public static function toNativePromise<T>(promise: tink.core.Promise<T>) {
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
