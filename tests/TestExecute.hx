package tests;

import graphql.Language;
import graphql.GraphQL;
import graphql.Type;
import graphql.Type.*;
import tink.unit.Assert.*;

class TestExecute {
  public function new() {}

  public function testExecute() {
    final query = new GraphQLObjectType({
      name: 'Query',
      fields: {
        hello: {
          type: string(),
          description: 'Greeting',
          args: {
            name: {
              type: string()
            }
          },
          resolve: (value, args: {name: String}) -> {
            return Promise.resolve(args.name);
          }
        }
      }
    });
    final schema = new GraphQLSchema({
      query: query
    });
    return GraphQL.graphql(schema, '{greeting:hello(name:"me")}').next(res -> {
      return assert(res.data.greeting == 'me');
    });
  }
}
