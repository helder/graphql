package graphql;

import haxe.ds.ReadOnlyArray;
import graphql.impl.GraphQLImpl;
import graphql.Type;
import graphql.Language;
import graphql.language.AST;

using tink.CoreApi;

typedef ExecutionResult<T> = {
  ?data: T,
  ?errors: ReadOnlyArray<Error>
}

class GraphQL {
  // https://graphql.org/graphql-js/graphql/#entry-point
  inline public static function graphql<T>(schema: GraphQLSchema,
      requestString: String, ?rootValue: Dynamic, ?contextValue: Dynamic,
      ?variableValues: Dynamic<Dynamic>,
      ?operationName: String): Promise<ExecutionResult<T>>
    return
      GraphQLImpl.graphql(cast schema, cast requestString, cast rootValue, cast contextValue, cast variableValues, cast operationName);

  // https://graphql.org/graphql-js/execution/#execute
  inline public static function execute<T>(schema: GraphQLSchema,
      documentAST: DocumentNode, ?rootValue: Dynamic, ?contextValue: Dynamic,
      ?variableValues: Dynamic<Dynamic>,
      ?operationName: String): Promise<ExecutionResult<T>>
    return
      GraphQLImpl.execute(cast schema, cast documentAST, cast rootValue, cast contextValue, cast variableValues, cast operationName);
}
