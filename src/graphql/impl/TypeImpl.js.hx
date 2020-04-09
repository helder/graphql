package graphql.impl;

import graphql.impl.Js;
import graphql.Type.GraphQLType;

abstract GraphQLSchemaImpl(GraphQLSchema) {
  inline public function new(config: graphql.Type.GraphQLSchemaConfig)
    this = new GraphQLSchema((config : Dynamic));

  public var config(get, never): graphql.Type.GraphQLSchemaConfig;

  function get_config()
    return this.toConfig();
}

abstract GraphQLObjectTypeImpl(GraphQLObjectType) {
  inline public function new(config: graphql.Type.GraphQLObjectTypeConfig)
    this = new GraphQLObjectType((config : Dynamic));

  public var config(get, never): graphql.Type.GraphQLObjectTypeConfig;

  function get_config()
    return this.toConfig();
}

abstract GraphQLScalarTypeImpl<T>(GraphQLScalarType) {
  inline public function new(config: graphql.Type.GraphQLScalarTypeConfig<T>)
    this = new GraphQLScalarType((config : Dynamic));

  public var config(get, never): graphql.Type.GraphQLScalarTypeConfig<T>;

  function get_config()
    return this.toConfig();
}

abstract GraphQLInterfaceTypeImpl(GraphQLInterfaceType) {
  inline public function new(config: graphql.Type.GraphQLInterfaceTypeConfig)
    this = new GraphQLInterfaceType((config : Dynamic));

  public var config(get, never): graphql.Type.GraphQLInterfaceTypeConfig;

  function get_config()
    return this.toConfig();
}

abstract GraphQLUnionTypeImpl(GraphQLUnionType) {
  inline public function new(config: graphql.Type.GraphQLUnionTypeConfig)
    this = new GraphQLUnionType((config : Dynamic));

  public var config(get, never): graphql.Type.GraphQLUnionTypeConfig;

  function get_config()
    return this.toConfig();
}

abstract GraphQLEnumTypeImpl(GraphQLEnumType) {
  inline public function new(config: graphql.Type.GraphQLEnumTypeConfig)
    this = new GraphQLEnumType((config : Dynamic));

  public var config(get, never): graphql.Type.GraphQLEnumTypeConfig;

  function get_config()
    return this.toConfig();
}

abstract GraphQLInputObjectTypeImpl(GraphQLInputObjectType) {
  inline public function new(config: graphql.Type.GraphQLInputObjectTypeConfig)
    this = new GraphQLInputObjectType((config : Dynamic));

  public var config(get, never): graphql.Type.GraphQLInputObjectTypeConfig;

  function get_config()
    return this.toConfig();
}

abstract GraphQLNonNullImpl<T:GraphQLType>(GraphQLNonNull<T>) {
  inline public function new(type: GraphQLType)
    this = cast new GraphQLNonNull(type);
}

abstract GraphQLListImpl<T:GraphQLType>(GraphQLList<T>) {
  inline public function new(type: T)
    this = new GraphQLList(type);
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
