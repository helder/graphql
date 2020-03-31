package graphql.impl;

import graphql.impl.Php;

using tink.CoreApi;

class GraphQLImpl {
  inline public static function graphql<T>(schema, documentAST, ?rootValue,
      ?contextValue, ?variableValues, ?operationName) {
    final res = GraphQL.executeQuery(schema, documentAST, rootValue, contextValue, variableValues, operationName);
    return Promise.resolve({
      data: Tools.haxify(res.data),
      errors: res.errors
    });
  }

  inline public static function execute<T>(schema, documentAST, ?rootValue,
      ?contextValue, ?variableValues, ?operationName) {
    final res = GraphQL.executeQuery(schema, documentAST, rootValue, contextValue, variableValues, operationName);
    return Promise.resolve({
      data: Tools.haxify(res.data),
      errors: res.errors
    });
  }
}
