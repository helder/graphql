package graphql;

import haxe.extern.EitherType;
import haxe.DynamicAccess;
import haxe.ds.ReadOnlyArray;
import graphql.impl.TypeImpl;
import graphql.language.AST;

typedef Struct<T:{}> = #if php php.NativeStructArray<T> #else T #end;

@:forward
abstract Record<T>(Dynamic<T>) {
  @:from public static function fromDynamic<T>(obj: Dynamic<T>): Record<T> {
    return #if php cast php.Syntax.array(obj) #else cast obj #end;
  }
}

#if php
abstract Args(Dynamic) {
  @:op(a.b) inline static function get(args: Args, field: String) {
    return untyped args[field];
  }

  @:op(a.b) inline static function set<V>(args: Args, field: String, v: V) {
    return untyped args[field] = v;
  }
}
#else
typedef Args = Dynamic;
#end
typedef GraphQLOutputType = Dynamic;
typedef Thunk<T> = EitherType<(() -> T), T>;
typedef GraphQLFieldConfigArgumentMap = Record<GraphQLArgumentConfig>;

typedef GraphQLResolveInfo = Struct<{
  final fieldName: String;
  final fieldNodes: ReadOnlyArray<FieldNode>;
  final returnType: GraphQLOutputType;
  final parentType: GraphQLObjectType;
  final path: Array<Array<String>>;
  final schema: GraphQLSchema;
  final rootValue: Dynamic;
  final operation: OperationDefinitionNode;
  final variableValues: Dynamic;
}>;

typedef GraphQLFieldResolver<TSource, TContext> = (source: TSource,
  args: DynamicAccess<Dynamic>, ?context: TContext, ?info
  : GraphQLResolveInfo) -> Dynamic;

typedef GraphQLFieldConfig = Struct<{
  type: GraphQLOutputType,
  ?args: Thunk<GraphQLFieldConfigArgumentMap>,
  ?resolve: (value: Dynamic, args: Args) -> Dynamic,
  ?description: String
}>;

typedef GraphQLArgumentConfig = Struct<{
  type: Dynamic,
  ?description: String,
  ?defaultValue: Dynamic
}>;

typedef GraphQLFieldMap = Record<GraphQLFieldConfig>;

// https://graphql.org/graphql-js/type/#graphqlschema

typedef GraphQLSchema = GraphQLSchemaImpl;

typedef GraphQLSchemaConfig = Struct<{
  query: GraphQLObjectType,
  ?mutation: GraphQLObjectType
}>;

// https://graphql.org/graphql-js/type/#graphqlobjecttype

typedef GraphQLObjectType = GraphQLObjectTypeImpl;

typedef GraphQLObjectTypeConfig = Struct<{
  name: String,
  ?description: String,
  ?interfaces: Array<GraphQLInterfaceType>,
  ?fields: Thunk<GraphQLFieldMap>
}>;

// https://graphql.org/graphql-js/type/#graphqlinterfacetype

typedef GraphQLInterfaceType = GraphQLInterfaceTypeImpl;

typedef GraphQLInterfaceTypeConfig = Struct<{
  name: String,
  ?description: String,
  fields: Thunk<GraphQLFieldMap>,
  ?resolveType: (value: Dynamic) -> GraphQLObjectType,
}>;

// https://graphql.org/graphql-js/type/#graphqluniontype

typedef GraphQLUnionType = GraphQLUnionTypeImpl;

typedef GraphQLUnionTypeConfig = Struct<{
  name: String,
  ?description: String,
  types: Thunk<Array<GraphQLObjectType>>,
  ?resolveType: (value: Dynamic) -> GraphQLObjectType,
}>;

// https://graphql.org/graphql-js/type/#graphqlscalartype

typedef GraphQLScalarType<T> = GraphQLScalarTypeImpl<T>;

typedef GraphQLScalarTypeConfig<T> = Struct<{
  name: String,
  ?description: String,
  serialize: (value: Dynamic) -> Null<T>,
  ?parseValue: (value: Dynamic) -> Null<T>
}>;

// https://graphql.org/graphql-js/type/#graphqlinputobjecttype

typedef GraphQLInputObjectType = GraphQLInputObjectTypeImpl;

typedef GraphQLInputObjectTypeConfig = Struct<{
  name: String,
  ?description: String,
  fields: Thunk<Record<GraphQLInputFieldConfig>>
}>;

typedef GraphQLInputFieldConfig = Struct<{
  ?description: String,
  type: Dynamic,
  ?defaultValue: Dynamic
}>;

class Type {
  inline public static function int(): GraphQLScalarType<Int>
    return TypeImpl.int();

  inline public static function float(): GraphQLScalarType<Float>
    return TypeImpl.float();

  inline public static function string(): GraphQLScalarType<String>
    return TypeImpl.string();

  inline public static function boolean(): GraphQLScalarType<Bool>
    return TypeImpl.boolean();

  inline public static function id(): GraphQLScalarType<Dynamic>
    return TypeImpl.id();
}
