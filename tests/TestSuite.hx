package tests;

import graphql.GraphQL;

class TestSuite {
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
}
