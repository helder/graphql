package tests;

import graphql.Language;
import graphql.GraphQL;
import graphql.Type;
import tink.unit.Assert.*;

class TestExecute {
  public function new() {}

  public function testExecute() {
    final query = new GraphQLObjectType({
      name: 'Query',
      fields: {
        hello: {
          type: Type.string(),
          description: 'Greeting',
          args: {
            name: {
              type: Type.string()
            }
          },
          resolve: (value, args) -> args.name
        }
      }
    });
    final schema = new GraphQLSchema({
      query: query
    });
    final document = Language.parse('{greeting:hello(name:"me")}');
    return GraphQL.execute(schema, document, null).next(res -> {
      return assert(res.data.greeting == 'me');
    });
  }
}
