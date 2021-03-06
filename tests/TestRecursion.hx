package tests;

import helder.graphql.Language;
import helder.GraphQL;
import helder.graphql.Type;
import helder.graphql.Type.*;
import tink.unit.Assert.*;
import helder.graphql.macro.GraphQLTypeBuilder;

private class Root {
  public function new() {}

  public function rec(): Root
    return new Root();

  public var end = 'done';
}

@:asserts
class TestRecursion extends TestSuite {
  public function testRecursion() {
    final schema = GraphQLTypeBuilder.schemaOfType(Root);
    final input = '{
      rec {
        rec {
          rec {
            end
          }
        }
      }
    }';
    return GraphQL.graphql(schema, input, new Root())
      .next(unpack)
      .next(data -> {
        asserts.assert(data.rec.rec.rec.end == 'done');
        return asserts.done();
      });
  }
}
