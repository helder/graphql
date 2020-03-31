package graphql.impl;

import haxe.Constraints.Constructible;
import haxe.DynamicAccess;
import haxe.ds.ReadOnlyArray;
import js.lib.Promise;
import haxe.extern.EitherType;

@:noCompletion typedef Undefined = Dynamic;
@:noCompletion typedef ReadonlyArray<T> = ReadOnlyArray<T>;
@:noCompletion typedef Readonly<T> = T;
@:noCompletion typedef Record_<K, V> = DynamicAccess<V>;
@:noCompletion typedef Thunk<T> = EitherType<(() -> T), T>;
@:noCompletion typedef PromiseOrValue<T> = EitherType<Promise<T>, T>;
@:noCompletion typedef GraphQLFieldConfigMap<T, T2, T3> = Dynamic;
@:noCompletion typedef GraphQLFieldMap<T, T2> = Dynamic;
@:noCompletion typedef GraphQLOutputType = Dynamic;
@:noCompletion typedef GraphQLAbstractType = Dynamic;

@:noCompletion typedef Path = {
  prev: Path,
  key: EitherType<String, Float>
};

@:noCompletion typedef GraphQLFieldResolver<TSource, TContext,
  TArgs> = (source: TSource, args: TArgs, context: TContext,
  info: GraphQLResolveInfo) -> Dynamic;

@:noCompletion typedef GraphQLIsTypeOfFn<TSource, TContext> = (source: TSource,
  context: TContext,
  info: GraphQLResolveInfo) -> PromiseOrValue<Bool>;

@:noCompletion typedef GraphQLInputType = Dynamic;
@:noCompletion typedef GraphQLDirective = Dynamic;
@:noCompletion typedef GraphQLInputFieldConfigMap = Dynamic;
@:noCompletion typedef GraphQLLeafType = Dynamic;
@:noCompletion typedef GraphQLEnumValueConfigMap = Dynamic;
@:noCompletion typedef GraphQLInputFieldMap = Dynamic;
@:noCompletion typedef GraphQLCompositeType = Dynamic;
@:noCompletion typedef GraphQLWrappingType = Dynamic;
@:noCompletion typedef GraphQLFieldConfigArgumentMap = Dynamic;
@:noCompletion typedef TypeMap = Dynamic;
@:noCompletion typedef GraphQLNamedType = Dynamic;

@:noCompletion typedef ASTSourceLocation = {
  var line: Float;
  var column: Float;
};

@:jsRequire('graphql/language/source')
@:noCompletion extern class Source {
  var body: String;
  var name: String;
  var locationOffset: ASTSourceLocation;
  function new(body: String, ?name: String,
    ?locationOffset: ASTSourceLocation): Void;
}

@:noCompletion typedef TokenKind = String;
@:noCompletion typedef TokenKindEnum = String;
@:noCompletion typedef TypeNode = String;

// languae/ast
@:noCompletion typedef Location = {
  var start: Float;
  var end: Float;
  var startToken: Token;
  var endToken: Token;
  var source: Source;
};

@:noCompletion typedef Token = {
  var kind: TokenKindEnum;
  var start: Float;
  var end: Float;
  var line: Float;
  var column: Float;
  var value: String;
  var prev: Token;
  var next: Token;
};

@:noCompletion typedef ASTKindToNode = {
  var Name: NameNode;
  var Document: DocumentNode;
  var OperationDefinition: OperationDefinitionNode;
  var VariableDefinition: VariableDefinitionNode;
  var Variable: VariableNode;
  var SelectionSet: SelectionSetNode;
  var Field: FieldNode;
  var Argument: ArgumentNode;
  var FragmentSpread: FragmentSpreadNode;
  var InlineFragment: InlineFragmentNode;
  var FragmentDefinition: FragmentDefinitionNode;
  var IntValue: IntValueNode;
  var FloatValue: FloatValueNode;
  var StringValue: StringValueNode;
  var BooleanValue: BooleanValueNode;
  var NullValue: NullValueNode;
  var EnumValue: EnumValueNode;
  var ListValue: ListValueNode;
  var ObjectValue: ObjectValueNode;
  var ObjectField: ObjectFieldNode;
  var Directive: DirectiveNode;
  var NamedType: NamedTypeNode;
  var ListType: ListTypeNode;
  var NonNullType: NonNullTypeNode;
  var SchemaDefinition: SchemaDefinitionNode;
  var OperationTypeDefinition: OperationTypeDefinitionNode;
  var ScalarTypeDefinition: ScalarTypeDefinitionNode;
  var ObjectTypeDefinition: ObjectTypeDefinitionNode;
  var FieldDefinition: FieldDefinitionNode;
  var InputValueDefinition: InputValueDefinitionNode;
  var InterfaceTypeDefinition: InterfaceTypeDefinitionNode;
  var UnionTypeDefinition: UnionTypeDefinitionNode;
  var EnumTypeDefinition: EnumTypeDefinitionNode;
  var EnumValueDefinition: EnumValueDefinitionNode;
  var InputObjectTypeDefinition: InputObjectTypeDefinitionNode;
  var DirectiveDefinition: DirectiveDefinitionNode;
  var SchemaExtension: SchemaExtensionNode;
  var ScalarTypeExtension: ScalarTypeExtensionNode;
  var ObjectTypeExtension: ObjectTypeExtensionNode;
  var InterfaceTypeExtension: InterfaceTypeExtensionNode;
  var UnionTypeExtension: UnionTypeExtensionNode;
  var EnumTypeExtension: EnumTypeExtensionNode;
  var InputObjectTypeExtension: InputObjectTypeExtensionNode;
};

@:noCompletion typedef NameNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var value: String;
};

@:noCompletion typedef DocumentNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var definitions: ReadonlyArray<DefinitionNode>;
};

@:noCompletion typedef DefinitionNode = Dynamic;
@:noCompletion typedef OperationTypeNode = Dynamic;
@:noCompletion typedef ValueNode = Dynamic;
@:noCompletion typedef SelectionNode = Dynamic;

@:noCompletion typedef OperationDefinitionNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var operation: OperationTypeNode;
  @:optional
  var name: NameNode;
  @:optional
  var variableDefinitions: ReadonlyArray<VariableDefinitionNode>;
  @:optional
  var directives: ReadonlyArray<DirectiveNode>;
  var selectionSet: SelectionSetNode;
};

@:noCompletion typedef VariableDefinitionNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var variable: VariableNode;
  var type: TypeNode;
  @:optional
  var defaultValue: ValueNode;
  @:optional
  var directives: ReadonlyArray<DirectiveNode>;
};

@:noCompletion typedef VariableNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var name: NameNode;
};

@:noCompletion typedef SelectionSetNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var selections: ReadonlyArray<SelectionNode>;
};

@:noCompletion typedef FieldNode = {
  var kind: String;
  @:optional
  var loc: Location;
  @:optional
  var alias: NameNode;
  var name: NameNode;
  @:optional
  var arguments: ReadonlyArray<ArgumentNode>;
  @:optional
  var directives: ReadonlyArray<DirectiveNode>;
  @:optional
  var selectionSet: SelectionSetNode;
};

@:noCompletion typedef ArgumentNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var name: NameNode;
  var value: ValueNode;
};

@:noCompletion typedef FragmentSpreadNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var name: NameNode;
  @:optional
  var directives: ReadonlyArray<DirectiveNode>;
};

@:noCompletion typedef InlineFragmentNode = {
  var kind: String;
  @:optional
  var loc: Location;
  @:optional
  var typeCondition: NamedTypeNode;
  @:optional
  var directives: ReadonlyArray<DirectiveNode>;
  var selectionSet: SelectionSetNode;
};

@:noCompletion typedef FragmentDefinitionNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var name: NameNode;
  @:optional
  var variableDefinitions: ReadonlyArray<VariableDefinitionNode>;
  var typeCondition: NamedTypeNode;
  @:optional
  var directives: ReadonlyArray<DirectiveNode>;
  var selectionSet: SelectionSetNode;
};

@:noCompletion typedef IntValueNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var value: String;
};

@:noCompletion typedef FloatValueNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var value: String;
};

@:noCompletion typedef StringValueNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var value: String;
  @:optional
  var block: Bool;
};

@:noCompletion typedef BooleanValueNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var value: Bool;
};

@:noCompletion typedef NullValueNode = {
  var kind: String;
  @:optional
  var loc: Location;
};

@:noCompletion typedef EnumValueNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var value: String;
};

@:noCompletion typedef ListValueNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var values: ReadonlyArray<ValueNode>;
};

@:noCompletion typedef ObjectValueNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var fields: ReadonlyArray<ObjectFieldNode>;
};

@:noCompletion typedef ObjectFieldNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var name: NameNode;
  var value: ValueNode;
};

@:noCompletion typedef DirectiveNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var name: NameNode;
  @:optional
  var arguments: ReadonlyArray<ArgumentNode>;
};

@:noCompletion typedef NamedTypeNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var name: NameNode;
};

@:noCompletion typedef ListTypeNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var type: TypeNode;
};

@:noCompletion typedef NonNullTypeNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var type: haxe.extern.EitherType<NamedTypeNode, ListTypeNode>;
};

@:noCompletion typedef SchemaDefinitionNode = {
  var kind: String;
  @:optional
  var loc: Location;
  @:optional
  var directives: ReadonlyArray<DirectiveNode>;
  var operationTypes: ReadonlyArray<OperationTypeDefinitionNode>;
};

@:noCompletion typedef OperationTypeDefinitionNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var operation: OperationTypeNode;
  var type: NamedTypeNode;
};

@:noCompletion typedef ScalarTypeDefinitionNode = {
  var kind: String;
  @:optional
  var loc: Location;
  @:optional
  var description: StringValueNode;
  var name: NameNode;
  @:optional
  var directives: ReadonlyArray<DirectiveNode>;
};

@:noCompletion typedef ObjectTypeDefinitionNode = {
  var kind: String;
  @:optional
  var loc: Location;
  @:optional
  var description: StringValueNode;
  var name: NameNode;
  @:optional
  var interfaces: ReadonlyArray<NamedTypeNode>;
  @:optional
  var directives: ReadonlyArray<DirectiveNode>;
  @:optional
  var fields: ReadonlyArray<FieldDefinitionNode>;
};

@:noCompletion typedef FieldDefinitionNode = {
  var kind: String;
  @:optional
  var loc: Location;
  @:optional
  var description: StringValueNode;
  var name: NameNode;
  @:optional
  var arguments: ReadonlyArray<InputValueDefinitionNode>;
  var type: TypeNode;
  @:optional
  var directives: ReadonlyArray<DirectiveNode>;
};

@:noCompletion typedef InputValueDefinitionNode = {
  var kind: String;
  @:optional
  var loc: Location;
  @:optional
  var description: StringValueNode;
  var name: NameNode;
  var type: TypeNode;
  @:optional
  var defaultValue: ValueNode;
  @:optional
  var directives: ReadonlyArray<DirectiveNode>;
};

@:noCompletion typedef InterfaceTypeDefinitionNode = {
  var kind: String;
  @:optional
  var loc: Location;
  @:optional
  var description: StringValueNode;
  var name: NameNode;
  @:optional
  var directives: ReadonlyArray<DirectiveNode>;
  @:optional
  var fields: ReadonlyArray<FieldDefinitionNode>;
};

@:noCompletion typedef UnionTypeDefinitionNode = {
  var kind: String;
  @:optional
  var loc: Location;
  @:optional
  var description: StringValueNode;
  var name: NameNode;
  @:optional
  var directives: ReadonlyArray<DirectiveNode>;
  @:optional
  var types: ReadonlyArray<NamedTypeNode>;
};

@:noCompletion typedef EnumTypeDefinitionNode = {
  var kind: String;
  @:optional
  var loc: Location;
  @:optional
  var description: StringValueNode;
  var name: NameNode;
  @:optional
  var directives: ReadonlyArray<DirectiveNode>;
  @:optional
  var values: ReadonlyArray<EnumValueDefinitionNode>;
};

@:noCompletion typedef EnumValueDefinitionNode = {
  var kind: String;
  @:optional
  var loc: Location;
  @:optional
  var description: StringValueNode;
  var name: NameNode;
  @:optional
  var directives: ReadonlyArray<DirectiveNode>;
};

@:noCompletion typedef InputObjectTypeDefinitionNode = {
  var kind: String;
  @:optional
  var loc: Location;
  @:optional
  var description: StringValueNode;
  var name: NameNode;
  @:optional
  var directives: ReadonlyArray<DirectiveNode>;
  @:optional
  var fields: ReadonlyArray<InputValueDefinitionNode>;
};

@:noCompletion typedef DirectiveDefinitionNode = {
  var kind: String;
  @:optional
  var loc: Location;
  @:optional
  var description: StringValueNode;
  var name: NameNode;
  @:optional
  var arguments: ReadonlyArray<InputValueDefinitionNode>;
  var repeatable: Bool;
  var locations: ReadonlyArray<NameNode>;
};

@:noCompletion typedef SchemaExtensionNode = {
  var kind: String;
  @:optional
  var loc: Location;
  @:optional var directives: ReadonlyArray<DirectiveNode>;
  @:optional var operationTypes: ReadonlyArray<OperationTypeDefinitionNode>;
};

@:noCompletion typedef ScalarTypeExtensionNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var name: NameNode;
  @:optional
  var directives: ReadonlyArray<DirectiveNode>;
};

@:noCompletion typedef ObjectTypeExtensionNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var name: NameNode;
  @:optional
  var interfaces: ReadonlyArray<NamedTypeNode>;
  @:optional
  var directives: ReadonlyArray<DirectiveNode>;
  @:optional
  var fields: ReadonlyArray<FieldDefinitionNode>;
};

@:noCompletion typedef InterfaceTypeExtensionNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var name: NameNode;
  @:optional
  var directives: ReadonlyArray<DirectiveNode>;
  @:optional
  var fields: ReadonlyArray<FieldDefinitionNode>;
};

@:noCompletion typedef UnionTypeExtensionNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var name: NameNode;
  @:optional
  var directives: ReadonlyArray<DirectiveNode>;
  @:optional
  var types: ReadonlyArray<NamedTypeNode>;
};

@:noCompletion typedef EnumTypeExtensionNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var name: NameNode;
  @:optional
  var directives: ReadonlyArray<DirectiveNode>;
  @:optional
  var values: ReadonlyArray<EnumValueDefinitionNode>;
};

@:noCompletion typedef InputObjectTypeExtensionNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var name: NameNode;
  @:optional
  var directives: ReadonlyArray<DirectiveNode>;
  @:optional
  var fields: ReadonlyArray<InputValueDefinitionNode>;
};

// type/definition

interface GraphQLType {}
interface GraphQLNullableType {}
@:noCompletion typedef Maybe<T> = Null<T>;

@:jsRequire('graphql/type/definition', 'GraphQLList')
@:noCompletion extern class GraphQLList<T /*:(GraphQLType)*/> {
  function new(type: T): Void;
  var ofType: T;
  function toString(): String;
  function toJSON(): String;
  function inspect(): String;
}

@:noCompletion typedef _GraphQLList<T:(GraphQLType)> = Constructible<GraphQLList<T>>;

@:jsRequire('graphql/type/definition', 'GraphQLNonNull')
@:noCompletion extern class GraphQLNonNull<T /*:(GraphQLNullableType)*/> {
  function new(type: T): Void;
  var ofType: T;
  function toString(): String;
  function toJSON(): String;
  function inspect(): String;
}

@:noCompletion typedef _GraphQLNonNull<T:(GraphQLNullableType)> = Constructible<GraphQLNonNull<T>>;

@:jsRequire('graphql/type/definition', 'GraphQLScalarType')
@:noCompletion extern class GraphQLScalarType implements GraphQLType implements GraphQLNullableType {
  var name: String;
  var description: Maybe<String>;
  var serialize: GraphQLScalarSerializer<Dynamic>;
  var parseValue: GraphQLScalarValueParser<Dynamic>;
  var parseLiteral: GraphQLScalarLiteralParser<Dynamic>;
  var extensions: Maybe<Readonly<Record_<String, Dynamic>>>;
  var astNode: Maybe<ScalarTypeDefinitionNode>;
  var extensionASTNodes: Maybe<ReadonlyArray<ScalarTypeExtensionNode>>;
  function new(config: GraphQLScalarTypeConfig<Dynamic, Dynamic>): Void;
  function toConfig(): Dynamic;
  function toString(): String;
  function toJSON(): String;
  function inspect(): String;
}

@:noCompletion typedef GraphQLScalarSerializer<TExternal> = (value: Dynamic) ->
  Maybe<TExternal>;
@:noCompletion typedef GraphQLScalarValueParser<TInternal> = (value: Dynamic) ->
  Maybe<TInternal>;

@:noCompletion typedef GraphQLScalarLiteralParser<TInternal> = (valueNode: ValueNode,
  variables: Maybe<DynamicAccess<Dynamic>>) -> Maybe<TInternal>;

@:noCompletion typedef GraphQLScalarTypeConfig<TInternal, TExternal> = {
  var name: String;
  @:optional
  var description: Maybe<String>;
  var serialize: GraphQLScalarSerializer<TExternal>;
  @:optional
  var parseValue: GraphQLScalarValueParser<TInternal>;
  @:optional
  var parseLiteral: GraphQLScalarLiteralParser<TInternal>;
  @:optional
  var extensions: Maybe<Readonly<Record_<String, Dynamic>>>;
  @:optional
  var astNode: Maybe<ScalarTypeDefinitionNode>;
  @:optional
  var extensionASTNodes: Maybe<ReadonlyArray<ScalarTypeExtensionNode>>;
};

@:jsRequire('graphql/type/definition', 'GraphQLObjectType')
@:noCompletion extern class GraphQLObjectType /*<TSource, TContext, TArgs>*/ implements GraphQLType implements GraphQLNullableType {
  var name: String;
  var description: Maybe<String>;
  var isTypeOf: Maybe<GraphQLIsTypeOfFn<Dynamic, Dynamic>>;
  var extensions: Maybe<Readonly<Record_<String, Dynamic>>>;
  var astNode: Maybe<ObjectTypeDefinitionNode>;
  var extensionASTNodes: Maybe<ReadonlyArray<ObjectTypeExtensionNode>>;
  function new(config: GraphQLObjectTypeConfig<Dynamic, Dynamic,
    Dynamic> /*<TSource, TContext, TArgs>*/): Void;
  function getFields(): GraphQLFieldMap<Dynamic, Dynamic>;
  function getInterfaces(): Array<GraphQLInterfaceType>;
  function toConfig(): Dynamic;
  function toString(): String;
  function toJSON(): String;
  function inspect(): String;
}

@:noCompletion typedef GraphQLObjectTypeConfig<TSource, TContext, TArgs> = {
  var name: String;
  @:optional
  var description: Maybe<String>;
  @:optional
  var interfaces: Thunk<Maybe<Array<GraphQLInterfaceType>>>;
  var fields: Thunk<GraphQLFieldConfigMap<TSource, TContext, TArgs>>;
  @:optional
  var isTypeOf: Maybe<GraphQLIsTypeOfFn<TSource, TContext>>;
  @:optional
  var extensions: Maybe<Readonly<Record_<String, Dynamic>>>;
  @:optional
  var astNode: Maybe<ObjectTypeDefinitionNode>;
  @:optional
  var extensionASTNodes: Maybe<ReadonlyArray<ObjectTypeExtensionNode>>;
};

@:noCompletion typedef GraphQLResolveInfo = {
  var fieldName: String;
  var fieldNodes: ReadonlyArray<FieldNode>;
  var returnType: GraphQLOutputType;
  var parentType: GraphQLObjectType;
  var path: Path;
  var schema: GraphQLSchema;
  var fragments: {};
  var rootValue: Dynamic;
  var operation: OperationDefinitionNode;
  var variableValues: {};
};

@:noCompletion typedef GraphQLFieldConfig<TSource, TContext, TArgs> = {
  @:optional
  var description: Maybe<String>;
  var type: GraphQLOutputType;
  @:optional
  var args: Dynamic;
  @:optional
  var resolve: GraphQLFieldResolver<TSource, TContext, TArgs>;
  @:optional
  var subscribe: GraphQLFieldResolver<TSource, TContext, TArgs>;
  @:optional
  var deprecationReason: Maybe<String>;
  @:optional
  var extensions: Maybe<Readonly<Record_<String, Dynamic>>>;
  @:optional
  var astNode: Maybe<FieldDefinitionNode>;
};

@:noCompletion typedef GraphQLArgumentConfig = {
  @:optional
  var description: Maybe<String>;
  var type: GraphQLInputType;
  @:optional
  var defaultValue: Dynamic;
  @:optional
  var extensions: Maybe<Readonly<Record_<String, Dynamic>>>;
  @:optional
  var astNode: Maybe<InputValueDefinitionNode>;
};

@:noCompletion typedef GraphQLField<TSource, TContext, TArgs> = {
  var name: String;
  var description: Maybe<String>;
  var type: GraphQLOutputType;
  var args: Array<GraphQLArgument>;
  @:optional
  var resolve: GraphQLFieldResolver<TSource, TContext, TArgs>;
  @:optional
  var subscribe: GraphQLFieldResolver<TSource, TContext, TArgs>;
  @:optional
  var isDeprecated: Bool;
  @:optional
  var deprecationReason: Maybe<String>;
  var extensions: Maybe<Readonly<Record_<String, Dynamic>>>;
  @:optional
  var astNode: Maybe<FieldDefinitionNode>;
};

@:noCompletion typedef GraphQLArgument = {
  var name: String;
  var description: Maybe<String>;
  var type: GraphQLInputType;
  var defaultValue: Dynamic;
  var extensions: Maybe<Readonly<Record_<String, Dynamic>>>;
  var astNode: Maybe<InputValueDefinitionNode>;
};

@:jsRequire('graphql/type/definition', 'GraphQLInterfaceType')
@:noCompletion extern class GraphQLInterfaceType implements GraphQLType implements GraphQLNullableType {
  var name: String;
  var description: Maybe<String>;
  var resolveType: Maybe<GraphQLTypeResolver<Dynamic, Dynamic, Dynamic>>;
  var extensions: Maybe<Readonly<Record_<String, Dynamic>>>;
  @:optional
  var astNode: Maybe<InterfaceTypeDefinitionNode>;
  var extensionASTNodes: Maybe<ReadonlyArray<InterfaceTypeExtensionNode>>;
  function new(config: GraphQLInterfaceTypeConfig<Dynamic, Dynamic,
    Dynamic>): Void;
  function getFields(): GraphQLFieldMap<Dynamic, Dynamic>;
  function toConfig(): Dynamic;
  function toString(): String;
  function toJSON(): String;
  function inspect(): String;
}

@:noCompletion typedef GraphQLTypeResolver<TSource, TContext,
  TArgs> = (value: TSource, context: TContext, info: GraphQLResolveInfo,
  abstractType: GraphQLAbstractType) ->
  PromiseOrValue<Maybe<EitherType<GraphQLObjectType, String>>>;

@:noCompletion typedef GraphQLInterfaceTypeConfig<TSource, TContext, TArgs> = {
  var name: String;
  @:optional
  var description: Maybe<String>;
  var fields: Thunk<GraphQLFieldConfigMap<TSource, TContext, TArgs>>;
  @:optional
  var resolveType: Maybe<GraphQLTypeResolver<TSource, TContext, TArgs>>;
  @:optional
  var extensions: Maybe<Readonly<Record_<String, Dynamic>>>;
  @:optional
  var astNode: Maybe<InterfaceTypeDefinitionNode>;
  @:optional
  var extensionASTNodes: Maybe<ReadonlyArray<InterfaceTypeExtensionNode>>;
};

@:jsRequire('graphql/type/definition', 'GraphQLUnionType')
@:noCompletion extern class GraphQLUnionType implements GraphQLType implements GraphQLNullableType {
  var name: String;
  var description: Maybe<String>;
  var resolveType: Maybe<GraphQLTypeResolver<Dynamic, Dynamic, Dynamic>>;
  var extensions: Maybe<Readonly<Record_<String, Dynamic>>>;
  var astNode: Maybe<UnionTypeDefinitionNode>;
  var extensionASTNodes: Maybe<ReadonlyArray<UnionTypeExtensionNode>>;
  function new(config: GraphQLUnionTypeConfig<Dynamic, Dynamic>): Void;
  function getTypes(): Array<GraphQLObjectType>;
  function toConfig(): Dynamic;
  function toString(): String;
  function toJSON(): String;
  function inspect(): String;
}

@:noCompletion typedef GraphQLUnionTypeConfig<TSource, TContext> = {
  var name: String;
  @:optional
  var description: Maybe<String>;
  var types: Thunk<Array<GraphQLObjectType>>;
  @:optional
  var resolveType: Maybe<GraphQLTypeResolver<TSource, TContext, Dynamic>>;
  @:optional
  var extensions: Maybe<Readonly<Record_<String, Dynamic>>>;
  @:optional
  var astNode: Maybe<UnionTypeDefinitionNode>;
  @:optional
  var extensionASTNodes: Maybe<ReadonlyArray<UnionTypeExtensionNode>>;
};

@:jsRequire('graphql/type/definition', 'GraphQLEnumType')
@:noCompletion extern class GraphQLEnumType implements GraphQLType implements GraphQLNullableType {
  var name: String;
  var description: Maybe<String>;
  var extensions: Maybe<Readonly<Record_<String, Dynamic>>>;
  var astNode: Maybe<EnumTypeDefinitionNode>;
  var extensionASTNodes: Maybe<ReadonlyArray<EnumTypeExtensionNode>>;
  function new(config: GraphQLEnumTypeConfig): Void;
  function getValues(): Array<GraphQLEnumValue>;
  function getValue(name: String): Maybe<GraphQLEnumValue>;
  function serialize(value: Dynamic): Maybe<String>;
  function parseValue(value: Dynamic): Maybe<Dynamic>;
  function parseLiteral(valueNode: ValueNode,
    _variables: Maybe<{}>): Maybe<Dynamic>;
  function toConfig(): Dynamic;
  function toString(): String;
  function toJSON(): String;
  function inspect(): String;
}

@:noCompletion typedef GraphQLEnumTypeConfig = {
  var name: String;
  @:optional
  var description: Maybe<String>;
  var values: GraphQLEnumValueConfigMap;
  @:optional
  var extensions: Maybe<Readonly<Record_<String, Dynamic>>>;
  @:optional
  var astNode: Maybe<EnumTypeDefinitionNode>;
  @:optional
  var extensionASTNodes: Maybe<ReadonlyArray<EnumTypeExtensionNode>>;
};

@:noCompletion typedef GraphQLEnumValueConfig = {
  @:optional
  var description: Maybe<String>;
  @:optional
  var value: Dynamic;
  @:optional
  var deprecationReason: Maybe<String>;
  @:optional
  var extensions: Maybe<Readonly<Record_<String, Dynamic>>>;
  @:optional
  var astNode: Maybe<EnumValueDefinitionNode>;
};

@:noCompletion typedef GraphQLEnumValue = {
  var name: String;
  var description: Maybe<String>;
  var value: Dynamic;
  @:optional
  var isDeprecated: Bool;
  var deprecationReason: Maybe<String>;
  var extensions: Maybe<Readonly<Record_<String, Dynamic>>>;
  @:optional
  var astNode: Maybe<EnumValueDefinitionNode>;
};

@:jsRequire('graphql/type/definition', 'GraphQLInputObjectType')
@:noCompletion extern class GraphQLInputObjectType implements GraphQLType implements GraphQLNullableType {
  var name: String;
  var description: Maybe<String>;
  var extensions: Maybe<Readonly<Record_<String, Dynamic>>>;
  var astNode: Maybe<InputObjectTypeDefinitionNode>;
  var extensionASTNodes: Maybe<ReadonlyArray<InputObjectTypeExtensionNode>>;
  function new(config: GraphQLInputObjectTypeConfig): Void;
  function getFields(): GraphQLInputFieldMap;
  function toConfig(): Dynamic;
  function toString(): String;
  function toJSON(): String;
  function inspect(): String;
}

@:noCompletion typedef GraphQLInputObjectTypeConfig = {
  var name: String;
  @:optional
  var description: Maybe<String>;
  var fields: Thunk<GraphQLInputFieldConfigMap>;
  @:optional
  var extensions: Maybe<Readonly<Record_<String, Dynamic>>>;
  @:optional
  var astNode: Maybe<InputObjectTypeDefinitionNode>;
  @:optional
  var extensionASTNodes: Maybe<ReadonlyArray<InputObjectTypeExtensionNode>>;
};

@:noCompletion typedef GraphQLInputFieldConfig = {
  @:optional
  var description: Maybe<String>;
  var type: GraphQLInputType;
  @:optional
  var defaultValue: Dynamic;
  @:optional
  var extensions: Maybe<Readonly<Record_<String, Dynamic>>>;
  @:optional
  var astNode: Maybe<InputValueDefinitionNode>;
};

@:noCompletion typedef GraphQLInputField = {
  var name: String;
  @:optional
  var description: Maybe<String>;
  var type: GraphQLInputType;
  @:optional
  var defaultValue: Dynamic;
  var extensions: Maybe<Readonly<Record_<String, Dynamic>>>;
  @:optional
  var astNode: Maybe<InputValueDefinitionNode>;
};

@:jsRequire('graphql/type/definition')
@:noCompletion extern class DefinitionTopLevel {
  static function isType(type: Dynamic): Bool;
  static function assertType(type: Dynamic): GraphQLType;
  static function isScalarType(type: Dynamic): Bool;
  static function assertScalarType(type: Dynamic): GraphQLScalarType;
  static function isObjectType(type: Dynamic): Bool;
  static function assertObjectType(type: Dynamic): GraphQLObjectType;
  static function isInterfaceType(type: Dynamic): Bool;
  static function assertInterfaceType(type: Dynamic): GraphQLInterfaceType;
  static function isUnionType(type: Dynamic): Bool;
  static function assertUnionType(type: Dynamic): GraphQLUnionType;
  static function isEnumType(type: Dynamic): Bool;
  static function assertEnumType(type: Dynamic): GraphQLEnumType;
  static function isInputObjectType(type: Dynamic): Bool;
  static function assertInputObjectType(type: Dynamic): GraphQLInputObjectType;
  static function isListType(type: Dynamic): Bool;
  static function assertListType(type: Dynamic): GraphQLList<Dynamic>;
  static function isNonNullType(type: Dynamic): Bool;
  static function assertNonNullType(type: Dynamic): GraphQLNonNull<Dynamic>;
  static function isInputType(type: Dynamic): Bool;
  static function assertInputType(type: Dynamic): GraphQLInputType;
  static function isOutputType(type: Dynamic): Bool;
  static function assertOutputType(type: Dynamic): GraphQLOutputType;
  static function isLeafType(type: Dynamic): Bool;
  static function assertLeafType(type: Dynamic): GraphQLLeafType;
  static function isCompositeType(type: Dynamic): Bool;
  static function assertCompositeType(type: Dynamic): GraphQLCompositeType;
  static function isAbstractType(type: Dynamic): Bool;
  static function assertAbstractType(type: Dynamic): GraphQLAbstractType;
  static var GraphQLList: _GraphQLList<GraphQLType>;
  static var GraphQLNonNull: _GraphQLNonNull<GraphQLNullableType>;
  static function isWrappingType(type: Dynamic): Bool;
  static function assertWrappingType(type: Dynamic): GraphQLWrappingType;
  static function isNullableType(type: Dynamic): Bool;
  static function assertNullableType(type: Dynamic): GraphQLNullableType;
  static function getNullableType<T: (GraphQLNullableType)>(type: GraphQLNonNull<T>): T;
  static function isNamedType(type: Dynamic): Bool;
  static function assertNamedType(type: Dynamic): GraphQLNamedType;
  static function getNamedType(type: GraphQLType): GraphQLNamedType;
  static function argsToArgsConfig(args: ReadonlyArray<GraphQLArgument>): GraphQLFieldConfigArgumentMap;
  static function isRequiredArgument(arg: GraphQLArgument): Bool;
  static function isRequiredInputField(field: GraphQLInputField): Bool;
}

@:jsRequire('graphql/type/schema', 'GraphQLSchema')
@:noCompletion extern class GraphQLSchema {
  var extensions: Maybe<Readonly<Record_<String, Dynamic>>>;
  var astNode: Maybe<SchemaDefinitionNode>;
  var extensionASTNodes: Maybe<ReadonlyArray<SchemaExtensionNode>>;
  function new(config: GraphQLSchemaConfig): Void;
  function getQueryType(): Maybe<GraphQLObjectType>;
  function getMutationType(): Maybe<GraphQLObjectType>;
  function getSubscriptionType(): Maybe<GraphQLObjectType>;
  function getTypeMap(): TypeMap;
  function getType(name: String): Maybe<GraphQLNamedType>;
  function getPossibleTypes(abstractType: GraphQLAbstractType): ReadonlyArray<GraphQLObjectType>;
  function isPossibleType(abstractType: GraphQLAbstractType,
    possibleType: GraphQLObjectType): Bool;
  function getDirectives(): ReadonlyArray<GraphQLDirective>;
  function getDirective(name: String): Maybe<GraphQLDirective>;
  function toConfig(): Dynamic;
}

@:noCompletion typedef GraphQLSchemaValidationOptions = {
  @:optional
  var assumeValid: Bool;
  @:optional
  var allowedLegacyNames: Maybe<ReadonlyArray<String>>;
};

@:noCompletion typedef GraphQLSchemaConfig = {
  > GraphQLSchemaValidationOptions,
  var query: Maybe<GraphQLObjectType>;
  @:optional
  var mutation: Maybe<GraphQLObjectType>;
  @:optional
  var subscription: Maybe<GraphQLObjectType>;
  @:optional
  var types: Maybe<Array<GraphQLNamedType>>;
  @:optional
  var directives: Maybe<Array<GraphQLDirective>>;
  @:optional
  var extensions: Maybe<Readonly<Record_<String, Dynamic>>>;
  @:optional
  var astNode: Maybe<SchemaDefinitionNode>;
  @:optional
  var extensionASTNodes: Maybe<ReadonlyArray<SchemaExtensionNode>>;
};

@:jsRequire('graphql/type/schema')
@:noCompletion extern class SchemaTopLevel {
  static function isSchema(schema: Dynamic): Bool;
  static function assertSchema(schema: Dynamic): GraphQLSchema;
}

@:noCompletion typedef GraphQLError = Dynamic;

@:noCompletion typedef ExecutionContext = {
  var schema: GraphQLSchema;
  var fragments: {};
  var rootValue: Dynamic;
  var contextValue: Dynamic;
  var operation: OperationDefinitionNode;
  var variableValues: {};
  var fieldResolver: GraphQLFieldResolver<Dynamic, Dynamic, Dynamic>;
  var errors: Array<GraphQLError>;
};

@:noCompletion typedef ExecutionResultDataDefault = {};

@:noCompletion typedef ExecutionResult<TData> = {
  @:optional
  var errors: ReadonlyArray<GraphQLError>;
  @:optional
  var data: TData;
};

@:jsRequire('graphql')
@:noCompletion extern class GraphqlTopLevel {
  static function graphql<TData>(schema: GraphQLSchema,
    source: haxe.extern.EitherType<Source, String>, ?rootValue: Dynamic,
    ?contextValue: Dynamic, ?variableValues: Maybe<{}>,
    ?operationName: Maybe<String>,
    ?fieldResolver: Maybe<GraphQLFieldResolver<Dynamic, Dynamic, Dynamic>>,
    ?typeResolver: Maybe<GraphQLTypeResolver<Dynamic, Dynamic,
      Dynamic>>): Promise<ExecutionResult<TData>>;
}

@:jsRequire('graphql/execution')
@:noCompletion extern class ExecuteTopLevel {
  static function execute<TData>(schema: GraphQLSchema,
    document: DocumentNode, ?rootValue: Dynamic, ?contextValue: Dynamic,
    ?variableValues: Maybe<{}>, ?operationName: Maybe<String>,
    ?fieldResolver: Maybe<GraphQLFieldResolver<Dynamic, Dynamic, Dynamic>>,
    ?typeResolver: Maybe<GraphQLTypeResolver<Dynamic, Dynamic,
      Dynamic>>): PromiseOrValue<ExecutionResult<TData>>;
}

@:noCompletion typedef ParseOptions = {
  @:optional
  var noLocation: Bool;
  @:optional
  var allowLegacySDLEmptyFields: Bool;
  @:optional
  var allowLegacySDLImplementsInterfaces: Bool;
  @:optional
  var experimentalFragmentVariables: Bool;
};

@:jsRequire('graphql/language/parser')
@:noCompletion extern class ParserTopLevel {
  static function parse(source: haxe.extern.EitherType<String, Source>,
    ?options: ParseOptions): DocumentNode;
  static function parseValue(source: haxe.extern.EitherType<String, Source>,
    ?options: ParseOptions): ValueNode;
  static function parseType(source: haxe.extern.EitherType<String, Source>,
    ?options: ParseOptions): TypeNode;
}
