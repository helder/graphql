package helder.graphql.impl;

typedef Struct<T:{}> = T;
typedef Record<T> = Dynamic<T>;
typedef InputArray<T> = Array<T>;

class Tools {
  public static function toNativePromise<T>(promise: tink.core.Promise<T>) {
    if (!tink.core.Future.isFuture(promise))
      return cast promise;
    return js.lib.Promise.resolve().then(_ -> promise.toJsPromise());
  }

  inline public static function haxify<T>(value: T, once = false): T {
    return value;
  }
}
