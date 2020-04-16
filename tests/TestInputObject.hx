package tests;

import helder.graphql.Language;
import helder.GraphQL;
import helder.graphql.Type;
import helder.graphql.Type.*;
import tink.unit.Assert.*;
import helder.graphql.macro.GraphQLTypeBuilder;

private typedef Point = {
  x: Int,
  y: Int
}

private typedef Query = {
  input: (point: Point) -> Point
}

@:asserts
class TestInputObject extends TestSuite {
  public function testInputObject() {
    final schema = GraphQLTypeBuilder.schemaOfType(Query);
    final input = '{
      point: input(point: {x: 1, y:2}) {
        x
        y
      }
    }';
    return GraphQL.graphql(schema, input, {
      input: (point: Point) -> {x: point.x + 1, y: point.y + 1}
    }).next(unpack).next(data -> {
      asserts.assert(data.point.x == 2);
      asserts.assert(data.point.y == 3);
      return asserts.done();
    });
  }
}
