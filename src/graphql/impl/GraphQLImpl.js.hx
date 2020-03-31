package graphql.impl;

import graphql.impl.Js;

using tink.CoreApi;

class GraphQLImpl {
  inline public static function execute<T>(schema, documentAST, ?rootValue,
      ?contextValue, ?variableValues, ?operationName) {
    final res = ExecuteTopLevel.execute(schema, documentAST, rootValue, contextValue, variableValues, operationName);
    if (Std.is(res, js.lib.Promise))
      return Promise.ofJsPromise(res);
    return Promise.resolve(cast res);
  }
}
