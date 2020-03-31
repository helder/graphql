package graphql.impl;

import graphql.impl.Js;

using tink.CoreApi;

class GraphQLImpl {
  inline public static function graphql<T>(schema, documentAST, ?rootValue,
      ?contextValue, ?variableValues, ?operationName, ?fieldResolver,
      ?typeResolver) {
    return Promise.ofJsPromise(GraphqlTopLevel.graphql(schema, documentAST,
      rootValue, contextValue, variableValues, operationName, fieldResolver,
      typeResolver));
  }

  inline public static function execute<T>(schema, documentAST, ?rootValue,
      ?contextValue, ?variableValues, ?operationName, ?fieldResolver,
      ?typeResolver) {
    return Promise.ofJsPromise(ExecuteTopLevel.execute(schema, documentAST,
      rootValue, contextValue, variableValues, operationName, fieldResolver,
      typeResolver));
  }
}
