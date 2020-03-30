package graphql;

import graphql.impl.Js;

abstract GraphQLSchemaI(GraphQLSchema) {
  inline public function new(config: graphql.Type.GraphQLSchemaConfig)
    this = new GraphQLSchema((config : Dynamic));
}

abstract GraphQLObjectTypeI(GraphQLObjectType) {
  inline public function new(config: graphql.Type.GraphQLObjectTypeConfig)
    this = new GraphQLObjectType((config : Dynamic));
}
