package graphql;

import graphql.TypeI;

typedef GraphQLSchemaConfig = {
  query: GraphQLObjectType,
  ?mutation: GraphQLObjectType
}

typedef GraphQLInterfaceType = Dynamic;

typedef GraphQLObjectTypeConfig = {
  name: String,
  ?description: String,
  ?interfaces: Array<GraphQLInterfaceType>,
  ?fields: Dynamic
}

typedef GraphQLSchema = GraphQLSchemaI;
typedef GraphQLObjectType = GraphQLObjectTypeI;
