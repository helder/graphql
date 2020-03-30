package graphql.impl;

import graphql.impl.Js;

abstract GraphQLSchemaImpl(GraphQLSchema) {
  inline public function new(config: graphql.Type.GraphQLSchemaConfig)
    this = new GraphQLSchema((config : Dynamic));
}

abstract GraphQLObjectTypeImpl(GraphQLObjectType) {
  inline public function new(config: graphql.Type.GraphQLObjectTypeConfig)
    this = new GraphQLObjectType((config : Dynamic));
}

abstract GraphQLScalarTypeImpl<T>(GraphQLScalarType) {
  inline public function new(config: graphql.Type.GraphQLScalarTypeConfig<T>)
    this = new GraphQLScalarType((config : Dynamic));
}

abstract GraphQLInterfaceTypeImpl(GraphQLInterfaceType) {
  inline public function new(config: graphql.Type.GraphQLInterfaceTypeConfig)
    this = new GraphQLInterfaceType((config : Dynamic));
}

abstract GraphQLUnionTypeImpl(GraphQLUnionType) {
  inline public function new(config: graphql.Type.GraphQLUnionTypeConfig)
    this = new GraphQLUnionType((config : Dynamic));
}

abstract GraphQLInputObjectTypeImpl(GraphQLInputObjectType) {
  inline public function new(config: graphql.Type.GraphQLInputObjectTypeConfig)
    this = new GraphQLInputObjectType((config : Dynamic));
}

@:jsRequire('graphql/type')
private extern class GraphQLScalarTypes {
  static var GraphQLInt: GraphQLScalarType;
  static var GraphQLFloat: GraphQLScalarType;
  static var GraphQLString: GraphQLScalarType;
  static var GraphQLBoolean: GraphQLScalarType;
  static var GraphQLID: GraphQLScalarType;
}

class TypeImpl {
  inline public static function int()
    return cast GraphQLScalarTypes.GraphQLInt;

  inline public static function float()
    return cast GraphQLScalarTypes.GraphQLFloat;

  inline public static function string()
    return cast GraphQLScalarTypes.GraphQLString;

  inline public static function boolean()
    return cast GraphQLScalarTypes.GraphQLBoolean;

  inline public static function id()
    return cast GraphQLScalarTypes.GraphQLID;
}
