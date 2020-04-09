package tests;

import graphql.Language;
import graphql.GraphQL;
import graphql.Type;
import graphql.Type.*;
import tink.unit.Assert.*;
import graphql.macro.GraphQLTypeBuilder;

typedef Query = {
  hello: (name: String) -> String
}

typedef Point = {
  x: Int,
  y: Int
}

class SubType {
  var point: Point;

  public function new(point) {
    this.point = point;
  }

  public function getPoint(): Point
    return {x: point.x + 1, y: point.y + 2}
}

class Root {
  public function new() {}

  public function hello(name: String, ?test: Bool) {
    return name + (test == null ? '' : '${test}');
  }

  public function inputPoint(point: Point) {
    return new SubType(point);
  }

  public var test(get, never): Float;

  function get_test()
    return 0.5;
}

class TestExecute {
  public function new() {}

  function unpack<T>(res: ExecutionResult<T>): Promise<T> {
    switch res {
      case {errors: null | [], data: data}:
        return data;
      case {errors: errors}:
        return
          Failure(Error.withData([for (error in errors) error.message].join('\n'), errors));
    }
  }

  public function testExecute() {
    final schema = GraphQLTypeBuilder.schemaOfType(Root);
    final input = '{
      greeting:hello(name:"me")
      test
      point: inputPoint(point: {x: 1, y:2}) {
        p: getPoint {
          x
          y
        }
      }
    }';
    return GraphQL.graphql(schema, input, new Root())
      .next(unpack).next(data -> {
      trace(data.point.p);
      return assert(data.greeting == 'me');
    });
  }
}
