package graphql.impl;

import php.*;
import graphql.impl.Php;
import graphql.Type;
import graphql.Type.GraphQLType;

abstract GraphQLSchemaImpl(Schema) {
  inline public function new(config: GraphQLSchemaConfig)
    this = new Schema(config);

  public var config(get, never): GraphQLSchemaConfig;

  function get_config()
    return untyped this.config;
}

abstract GraphQLObjectTypeImpl(ObjectType) {
  inline public function new(config: GraphQLObjectTypeConfig)
    this = new ObjectType(config);

  public var config(get, never): GraphQLObjectTypeConfig;

  function get_config()
    return untyped this.config;
}

abstract GraphQLScalarTypeImpl<T>(CustomScalarType) {
  inline public function new(config: GraphQLScalarTypeConfig<T>)
    this = new CustomScalarType(config);

  public var config(get, never): GraphQLScalarTypeConfig<T>;

  function get_config()
    return untyped this.config;
}

abstract GraphQLInterfaceTypeImpl(InterfaceType) {
  inline public function new(config: GraphQLInterfaceTypeConfig)
    this = new InterfaceType(config);

  public var config(get, never): GraphQLInterfaceTypeConfig;

  function get_config()
    return untyped this.config;
}

abstract GraphQLUnionTypeImpl(UnionType) {
  inline public function new(config: GraphQLUnionTypeConfig)
    this = new UnionType(config);

  public var config(get, never): GraphQLUnionTypeConfig;

  function get_config()
    return untyped this.config;
}

abstract GraphQLEnumTypeImpl(EnumType) {
  inline public function new(config: GraphQLEnumTypeConfig)
    this = new EnumType(config);

  public var config(get, never): GraphQLEnumTypeConfig;

  function get_config()
    return untyped this.config;
}

abstract GraphQLInputObjectTypeImpl(InputObjectType) {
  inline public function new(config: GraphQLInputObjectTypeConfig)
    this = new InputObjectType(config);

  public var config(get, never): GraphQLInputObjectTypeConfig;

  function get_config()
    return untyped this.config;
}

abstract GraphQLNonNullImpl<T:GraphQLType>(NonNull) {
  inline public function new(type: T)
    this = new NonNull(cast type);
}

abstract GraphQLListImpl<T:GraphQLType>(ListOfType) {
  inline public function new(type: T)
    this = new ListOfType(cast type);
}

typedef TypeImpl = graphql.impl.Php.Type;
