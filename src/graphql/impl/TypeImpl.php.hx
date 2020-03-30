package graphql.impl;

import php.*;
import graphql.impl.Php;
import graphql.Type;

/*class Tools {
  public static function convert(value: Dynamic): Dynamic {
    if (Std.isOfType(value, Array)) {
      var result = new NativeIndexedArray();
      Syntax.foreach(value.arr, function(index: Int, item: Dynamic) {
        result[index] = convert(item);
      });
      return result;
    }
    if (Boot.isAnon(value)) {
      var result = new NativeAssocArray();
      Syntax.foreach(value, function(fieldName: String, fieldValue: Dynamic) {
        result[fieldName] = convert(fieldValue);
      });
      return result;
    }
    return value;
  }
}*/
abstract GraphQLSchemaImpl(Schema) {
  inline public function new(config: GraphQLSchemaConfig)
    this = new Schema(config);
}

abstract GraphQLObjectTypeImpl(ObjectType) {
  inline public function new(config: GraphQLObjectTypeConfig)
    this = new ObjectType(config);
}

abstract GraphQLScalarTypeImpl<T>(ScalarType) {
  inline public function new(config: GraphQLScalarTypeConfig<T>)
    this = new ScalarType(config);
}

abstract GraphQLInterfaceTypeImpl(InterfaceType) {
  inline public function new(config: GraphQLInterfaceTypeConfig)
    this = new InterfaceType(config);
}

abstract GraphQLUnionTypeImpl(UnionType) {
  inline public function new(config: GraphQLUnionTypeConfig)
    this = new UnionType(config);
}

abstract GraphQLInputObjectTypeImpl(ObjectType) {
  inline public function new(config: GraphQLObjectTypeConfig)
    this = new ObjectType(config);
}

typedef TypeImpl = graphql.impl.Php.Type;
