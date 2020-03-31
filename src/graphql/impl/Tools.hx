package graphql.impl;

typedef Struct<T:{}> = T;
typedef Record<T> = Dynamic<T>;

class Tools {
  inline public static function toNativePromise<T>(promise: tink.core.Promise<T>) {
    return promise.toJsPromise();
  }

  inline public static function haxify<T>(value: T): T {
    return value;
  }
}
