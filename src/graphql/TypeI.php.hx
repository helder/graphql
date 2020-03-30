package graphql;

import php.*;
import graphql.impl.Php;
import graphql.Type;

abstract GraphQLSchemaI(Schema) {
  inline public function new(config: GraphQLSchemaConfig)
    this = new Schema((config : NativeStructArray<GraphQLSchemaConfig>));
}

abstract GraphQLObjectTypeI(ObjectType) {
  inline public function new(config: GraphQLObjectTypeConfig)
    this = new ObjectType((config : NativeStructArray<GraphQLObjectTypeConfig>));
}
