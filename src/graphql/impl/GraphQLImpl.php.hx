package graphql.impl;

import graphql.impl.Php;

using tink.CoreApi;

class GraphQLImpl {
  public static function graphql<T>(schema, documentAST, ?rootValue,
      ?contextValue, ?variableValues, ?operationName) {
    final res = GraphQL.executeQuery(schema, documentAST, rootValue, contextValue, variableValues, operationName);
    return Promise.resolve({
      data: Tools.haxify(res.data),
      errors: Tools.haxify(res.errors, true)
    });
  }

  public static function execute<T>(schema, documentAST, ?rootValue,
      ?contextValue, ?variableValues, ?operationName) {
    final res = GraphQL.executeQuery(schema, documentAST, rootValue, contextValue, variableValues, operationName);
    return Promise.resolve({
      data: Tools.haxify(res.data),
      errors: Tools.haxify(res.errors, true)
    });
  }
}
