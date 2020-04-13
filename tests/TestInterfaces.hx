package tests;

import graphql.Language;
import graphql.GraphQL;
import graphql.Type;
import graphql.Type.*;
import tink.unit.Assert.*;
import graphql.macro.GraphQLTypeBuilder;

private interface Sub {
  public function field(): Int;
}

class Sub1 implements Sub {
  public function new() {}

  public function field()
    return 1;

  public function custom1()
    return 3;
}

class Sub2 implements Sub {
  public function new() {}

  public function field()
    return 2;

  public function custom2()
    return 4;
}

private class Root {
  public function new() {}

  public function query(which = 1): Sub
    return if (which == 1) new Sub1() else new Sub2();
}

@:asserts
class TestInterfaces extends TestSuite {
  public function testInterface() {
    final schema = GraphQLTypeBuilder.schemaOfType(Root);
    final input = '{
      query {
        field
        ... on Sub1 {
          custom1
        }
      }
      query2: query(which: 2) {
        field
        ... on Sub2 {
          custom2
        }
      }
    }';
    return GraphQL.graphql(schema, input, new Root())
      .next(unpack)
      .next(data -> {
        asserts.assert(data.query.field == 1);
        asserts.assert(data.query.custom1 == 3);
        asserts.assert(data.query2.field == 2);
        asserts.assert(data.query2.custom2 == 4);
        return asserts.done();
      });
  }
}
