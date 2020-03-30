package tests;

import graphql.Type;
import graphql.type.GraphQLObjectType;
import tink.unit.Assert.*;

class TestExecute {
  public function new() {}

  public function testExecute() {
    var objType = new GraphQLObjectType({
      name: 'query'
    });
    return assert(true);
  }
}
