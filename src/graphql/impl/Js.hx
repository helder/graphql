package graphql.impl;

import haxe.Constraints.Constructible;
import haxe.DynamicAccess;
import haxe.ds.ReadOnlyArray;
import js.lib.Promise;
import haxe.extern.EitherType;

typedef Undefined = Dynamic;
typedef ReadonlyArray<T> = ReadOnlyArray<T>;
typedef Readonly<T> = T;
typedef Record<K, V> = DynamicAccess<V>;
typedef Thunk<T> = EitherType<(() -> T), T>;
typedef PromiseOrValue<T> = EitherType<Promise<T>, T>;
typedef GraphQLFieldConfigMap<T, T2, T3> = Dynamic;
typedef GraphQLFieldMap<T, T2> = Dynamic;
typedef GraphQLOutputType = Dynamic;
typedef GraphQLAbstractType = Dynamic;

typedef Path = {
  prev: Path,
  key: EitherType<String, Float>
};

typedef GraphQLFieldResolver<TSource, TContext, TArgs> = (source: TSource,
  args: TArgs, context: TContext, info: GraphQLResolveInfo) -> Dynamic;

typedef GraphQLIsTypeOfFn<TSource, TContext> = (source: TSource,
  context: TContext, info: GraphQLResolveInfo) -> PromiseOrValue<Bool>;

typedef GraphQLInputType = Dynamic;
typedef GraphQLDirective = Dynamic;
typedef GraphQLInputFieldConfigMap = Dynamic;
typedef GraphQLLeafType = Dynamic;
typedef GraphQLEnumValueConfigMap = Dynamic;
typedef GraphQLInputFieldMap = Dynamic;
typedef GraphQLCompositeType = Dynamic;
typedef GraphQLWrappingType = Dynamic;
typedef GraphQLFieldConfigArgumentMap = Dynamic;
typedef TypeMap = Dynamic;
typedef GraphQLNamedType = Dynamic;

typedef ASTSourceLocation = {
  var line: Float;
  var column: Float;
};

@:jsRequire('graphql/language/source')
extern class Source {
  var body: String;
  var name: String;
  var locationOffset: ASTSourceLocation;
  function new(body: String, ?name: String,
    ?locationOffset: ASTSourceLocation): Void;
}

typedef TokenKind = String;
typedef TokenKindEnum = String;
typedef TypeNode = String;

// languae/ast
typedef Location = {
  var start: Float;
  var end: Float;
  var startToken: Token;
  var endToken: Token;
  var source: Source;
};

typedef Token = {
  var kind: TokenKindEnum;
  var start: Float;
  var end: Float;
  var line: Float;
  var column: Float;
  var value: String;
  var prev: Token;
  var next: Token;
};

typedef ASTKindToNode = {
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

typedef NameNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var value: String;
};

typedef DocumentNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var definitions: ReadonlyArray<DefinitionNode>;
};

typedef DefinitionNode = Dynamic;
typedef OperationTypeNode = Dynamic;
typedef ValueNode = Dynamic;
typedef SelectionNode = Dynamic;

typedef OperationDefinitionNode = {
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

typedef VariableDefinitionNode = {
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

typedef VariableNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var name: NameNode;
};

typedef SelectionSetNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var selections: ReadonlyArray<SelectionNode>;
};

typedef FieldNode = {
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

typedef ArgumentNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var name: NameNode;
  var value: ValueNode;
};

typedef FragmentSpreadNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var name: NameNode;
  @:optional
  var directives: ReadonlyArray<DirectiveNode>;
};

typedef InlineFragmentNode = {
  var kind: String;
  @:optional
  var loc: Location;
  @:optional
  var typeCondition: NamedTypeNode;
  @:optional
  var directives: ReadonlyArray<DirectiveNode>;
  var selectionSet: SelectionSetNode;
};

typedef FragmentDefinitionNode = {
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

typedef IntValueNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var value: String;
};

typedef FloatValueNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var value: String;
};

typedef StringValueNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var value: String;
  @:optional
  var block: Bool;
};

typedef BooleanValueNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var value: Bool;
};

typedef NullValueNode = {
  var kind: String;
  @:optional
  var loc: Location;
};

typedef EnumValueNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var value: String;
};

typedef ListValueNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var values: ReadonlyArray<ValueNode>;
};

typedef ObjectValueNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var fields: ReadonlyArray<ObjectFieldNode>;
};

typedef ObjectFieldNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var name: NameNode;
  var value: ValueNode;
};

typedef DirectiveNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var name: NameNode;
  @:optional
  var arguments: ReadonlyArray<ArgumentNode>;
};

typedef NamedTypeNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var name: NameNode;
};

typedef ListTypeNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var type: TypeNode;
};

typedef NonNullTypeNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var type: haxe.extern.EitherType<NamedTypeNode, ListTypeNode>;
};

typedef SchemaDefinitionNode = {
  var kind: String;
  @:optional
  var loc: Location;
  @:optional
  var directives: ReadonlyArray<DirectiveNode>;
  var operationTypes: ReadonlyArray<OperationTypeDefinitionNode>;
};

typedef OperationTypeDefinitionNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var operation: OperationTypeNode;
  var type: NamedTypeNode;
};

typedef ScalarTypeDefinitionNode = {
  var kind: String;
  @:optional
  var loc: Location;
  @:optional
  var description: StringValueNode;
  var name: NameNode;
  @:optional
  var directives: ReadonlyArray<DirectiveNode>;
};

typedef ObjectTypeDefinitionNode = {
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

typedef FieldDefinitionNode = {
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

typedef InputValueDefinitionNode = {
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

typedef InterfaceTypeDefinitionNode = {
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

typedef UnionTypeDefinitionNode = {
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

typedef EnumTypeDefinitionNode = {
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

typedef EnumValueDefinitionNode = {
  var kind: String;
  @:optional
  var loc: Location;
  @:optional
  var description: StringValueNode;
  var name: NameNode;
  @:optional
  var directives: ReadonlyArray<DirectiveNode>;
};

typedef InputObjectTypeDefinitionNode = {
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

typedef DirectiveDefinitionNode = {
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

typedef SchemaExtensionNode = {
  var kind: String;
  @:optional
  var loc: Location;
  @:optional var directives: ReadonlyArray<DirectiveNode>;
  @:optional var operationTypes: ReadonlyArray<OperationTypeDefinitionNode>;
};

typedef ScalarTypeExtensionNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var name: NameNode;
  @:optional
  var directives: ReadonlyArray<DirectiveNode>;
};

typedef ObjectTypeExtensionNode = {
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

typedef InterfaceTypeExtensionNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var name: NameNode;
  @:optional
  var directives: ReadonlyArray<DirectiveNode>;
  @:optional
  var fields: ReadonlyArray<FieldDefinitionNode>;
};

typedef UnionTypeExtensionNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var name: NameNode;
  @:optional
  var directives: ReadonlyArray<DirectiveNode>;
  @:optional
  var types: ReadonlyArray<NamedTypeNode>;
};

typedef EnumTypeExtensionNode = {
  var kind: String;
  @:optional
  var loc: Location;
  var name: NameNode;
  @:optional
  var directives: ReadonlyArray<DirectiveNode>;
  @:optional
  var values: ReadonlyArray<EnumValueDefinitionNode>;
};

typedef InputObjectTypeExtensionNode = {
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
typedef Maybe<T> = Null<T>;

interface GraphQLList<T:(GraphQLType) > extends GraphQLNullableType {
  var ofType: T;
  function toString(): String;
  function toJSON(): String;
  function inspect(): String;
}

typedef _GraphQLList<T:(GraphQLType)> = Constructible<GraphQLList<T>>;

typedef GraphQLNonNull<T:(GraphQLNullableType)> = {
  var ofType: T;
  function toString(): String;
  function toJSON(): String;
  function inspect(): String;
};

typedef _GraphQLNonNull<T:(GraphQLNullableType)> = Constructible<GraphQLNonNull<T>>;

@:jsRequire('graphql/type/definition', 'GraphQLScalarType')
extern class GraphQLScalarType implements GraphQLType implements GraphQLNullableType {
  var name: String;
  var description: Maybe<String>;
  var serialize: GraphQLScalarSerializer<Dynamic>;
  var parseValue: GraphQLScalarValueParser<Dynamic>;
  var parseLiteral: GraphQLScalarLiteralParser<Dynamic>;
  var extensions: Maybe<Readonly<Record<String, Dynamic>>>;
  var astNode: Maybe<ScalarTypeDefinitionNode>;
  var extensionASTNodes: Maybe<ReadonlyArray<ScalarTypeExtensionNode>>;
  function new(config: GraphQLScalarTypeConfig<Dynamic, Dynamic>): Void;
  function toConfig(): Dynamic;
  function toString(): String;
  function toJSON(): String;
  function inspect(): String;
}

typedef GraphQLScalarSerializer<TExternal> = (value: Dynamic) ->
  Maybe<TExternal>;
typedef GraphQLScalarValueParser<TInternal> = (value: Dynamic) ->
  Maybe<TInternal>;

typedef GraphQLScalarLiteralParser<TInternal> = (valueNode: ValueNode,
  variables: Maybe<DynamicAccess<Dynamic>>) -> Maybe<TInternal>;

typedef GraphQLScalarTypeConfig<TInternal, TExternal> = {
  var name: String;
  @:optional
  var description: Maybe<String>;
  var serialize: GraphQLScalarSerializer<TExternal>;
  @:optional
  var parseValue: GraphQLScalarValueParser<TInternal>;
  @:optional
  var parseLiteral: GraphQLScalarLiteralParser<TInternal>;
  @:optional
  var extensions: Maybe<Readonly<Record<String, Dynamic>>>;
  @:optional
  var astNode: Maybe<ScalarTypeDefinitionNode>;
  @:optional
  var extensionASTNodes: Maybe<ReadonlyArray<ScalarTypeExtensionNode>>;
};

@:jsRequire('graphql/type/definition', 'GraphQLObjectType')
extern class GraphQLObjectType /*<TSource, TContext, TArgs>*/ implements GraphQLType implements GraphQLNullableType {
  var name: String;
  var description: Maybe<String>;
  var isTypeOf: Maybe<GraphQLIsTypeOfFn<Dynamic, Dynamic>>;
  var extensions: Maybe<Readonly<Record<String, Dynamic>>>;
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

typedef GraphQLObjectTypeConfig<TSource, TContext, TArgs> = {
  var name: String;
  @:optional
  var description: Maybe<String>;
  @:optional
  var interfaces: Thunk<Maybe<Array<GraphQLInterfaceType>>>;
  var fields: Thunk<GraphQLFieldConfigMap<TSource, TContext, TArgs>>;
  @:optional
  var isTypeOf: Maybe<GraphQLIsTypeOfFn<TSource, TContext>>;
  @:optional
  var extensions: Maybe<Readonly<Record<String, Dynamic>>>;
  @:optional
  var astNode: Maybe<ObjectTypeDefinitionNode>;
  @:optional
  var extensionASTNodes: Maybe<ReadonlyArray<ObjectTypeExtensionNode>>;
};

typedef GraphQLResolveInfo = {
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

typedef GraphQLFieldConfig<TSource, TContext, TArgs> = {
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
  var extensions: Maybe<Readonly<Record<String, Dynamic>>>;
  @:optional
  var astNode: Maybe<FieldDefinitionNode>;
};

typedef GraphQLArgumentConfig = {
  @:optional
  var description: Maybe<String>;
  var type: GraphQLInputType;
  @:optional
  var defaultValue: Dynamic;
  @:optional
  var extensions: Maybe<Readonly<Record<String, Dynamic>>>;
  @:optional
  var astNode: Maybe<InputValueDefinitionNode>;
};

typedef GraphQLField<TSource, TContext, TArgs> = {
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
  var extensions: Maybe<Readonly<Record<String, Dynamic>>>;
  @:optional
  var astNode: Maybe<FieldDefinitionNode>;
};

typedef GraphQLArgument = {
  var name: String;
  var description: Maybe<String>;
  var type: GraphQLInputType;
  var defaultValue: Dynamic;
  var extensions: Maybe<Readonly<Record<String, Dynamic>>>;
  var astNode: Maybe<InputValueDefinitionNode>;
};

@:jsRequire('graphql/type/definition', 'GraphQLInterfaceType')
extern class GraphQLInterfaceType implements GraphQLType implements GraphQLNullableType {
  var name: String;
  var description: Maybe<String>;
  var resolveType: Maybe<GraphQLTypeResolver<Dynamic, Dynamic, Dynamic>>;
  var extensions: Maybe<Readonly<Record<String, Dynamic>>>;
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

typedef GraphQLTypeResolver<TSource, TContext, TArgs> = (value: TSource,
  context: TContext, info: GraphQLResolveInfo,
  abstractType: GraphQLAbstractType) ->
  PromiseOrValue<Maybe<EitherType<GraphQLObjectType, String>>>;

typedef GraphQLInterfaceTypeConfig<TSource, TContext, TArgs> = {
  var name: String;
  @:optional
  var description: Maybe<String>;
  var fields: Thunk<GraphQLFieldConfigMap<TSource, TContext, TArgs>>;
  @:optional
  var resolveType: Maybe<GraphQLTypeResolver<TSource, TContext, TArgs>>;
  @:optional
  var extensions: Maybe<Readonly<Record<String, Dynamic>>>;
  @:optional
  var astNode: Maybe<InterfaceTypeDefinitionNode>;
  @:optional
  var extensionASTNodes: Maybe<ReadonlyArray<InterfaceTypeExtensionNode>>;
};

@:jsRequire('graphql/type/definition', 'GraphQLUnionType')
extern class GraphQLUnionType implements GraphQLType implements GraphQLNullableType {
  var name: String;
  var description: Maybe<String>;
  var resolveType: Maybe<GraphQLTypeResolver<Dynamic, Dynamic, Dynamic>>;
  var extensions: Maybe<Readonly<Record<String, Dynamic>>>;
  var astNode: Maybe<UnionTypeDefinitionNode>;
  var extensionASTNodes: Maybe<ReadonlyArray<UnionTypeExtensionNode>>;
  function new(config: GraphQLUnionTypeConfig<Dynamic, Dynamic>): Void;
  function getTypes(): Array<GraphQLObjectType>;
  function toConfig(): Dynamic;
  function toString(): String;
  function toJSON(): String;
  function inspect(): String;
}

typedef GraphQLUnionTypeConfig<TSource, TContext> = {
  var name: String;
  @:optional
  var description: Maybe<String>;
  var types: Thunk<Array<GraphQLObjectType>>;
  @:optional
  var resolveType: Maybe<GraphQLTypeResolver<TSource, TContext, Dynamic>>;
  @:optional
  var extensions: Maybe<Readonly<Record<String, Dynamic>>>;
  @:optional
  var astNode: Maybe<UnionTypeDefinitionNode>;
  @:optional
  var extensionASTNodes: Maybe<ReadonlyArray<UnionTypeExtensionNode>>;
};

@:jsRequire('graphql/type/definition', 'GraphQLEnumType')
extern class GraphQLEnumType implements GraphQLType implements GraphQLNullableType {
  var name: String;
  var description: Maybe<String>;
  var extensions: Maybe<Readonly<Record<String, Dynamic>>>;
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

typedef GraphQLEnumTypeConfig = {
  var name: String;
  @:optional
  var description: Maybe<String>;
  var values: GraphQLEnumValueConfigMap;
  @:optional
  var extensions: Maybe<Readonly<Record<String, Dynamic>>>;
  @:optional
  var astNode: Maybe<EnumTypeDefinitionNode>;
  @:optional
  var extensionASTNodes: Maybe<ReadonlyArray<EnumTypeExtensionNode>>;
};

typedef GraphQLEnumValueConfig = {
  @:optional
  var description: Maybe<String>;
  @:optional
  var value: Dynamic;
  @:optional
  var deprecationReason: Maybe<String>;
  @:optional
  var extensions: Maybe<Readonly<Record<String, Dynamic>>>;
  @:optional
  var astNode: Maybe<EnumValueDefinitionNode>;
};

typedef GraphQLEnumValue = {
  var name: String;
  var description: Maybe<String>;
  var value: Dynamic;
  @:optional
  var isDeprecated: Bool;
  var deprecationReason: Maybe<String>;
  var extensions: Maybe<Readonly<Record<String, Dynamic>>>;
  @:optional
  var astNode: Maybe<EnumValueDefinitionNode>;
};

@:jsRequire('graphql/type/definition', 'GraphQLInputObjectType')
extern class GraphQLInputObjectType implements GraphQLType implements GraphQLNullableType {
  var name: String;
  var description: Maybe<String>;
  var extensions: Maybe<Readonly<Record<String, Dynamic>>>;
  var astNode: Maybe<InputObjectTypeDefinitionNode>;
  var extensionASTNodes: Maybe<ReadonlyArray<InputObjectTypeExtensionNode>>;
  function new(config: GraphQLInputObjectTypeConfig): Void;
  function getFields(): GraphQLInputFieldMap;
  function toConfig(): Dynamic;
  function toString(): String;
  function toJSON(): String;
  function inspect(): String;
}

typedef GraphQLInputObjectTypeConfig = {
  var name: String;
  @:optional
  var description: Maybe<String>;
  var fields: Thunk<GraphQLInputFieldConfigMap>;
  @:optional
  var extensions: Maybe<Readonly<Record<String, Dynamic>>>;
  @:optional
  var astNode: Maybe<InputObjectTypeDefinitionNode>;
  @:optional
  var extensionASTNodes: Maybe<ReadonlyArray<InputObjectTypeExtensionNode>>;
};

typedef GraphQLInputFieldConfig = {
  @:optional
  var description: Maybe<String>;
  var type: GraphQLInputType;
  @:optional
  var defaultValue: Dynamic;
  @:optional
  var extensions: Maybe<Readonly<Record<String, Dynamic>>>;
  @:optional
  var astNode: Maybe<InputValueDefinitionNode>;
};

typedef GraphQLInputField = {
  var name: String;
  @:optional
  var description: Maybe<String>;
  var type: GraphQLInputType;
  @:optional
  var defaultValue: Dynamic;
  var extensions: Maybe<Readonly<Record<String, Dynamic>>>;
  @:optional
  var astNode: Maybe<InputValueDefinitionNode>;
};

@:jsRequire('graphql/type/definition')
extern class DefinitionTopLevel {
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
extern class GraphQLSchema {
  var extensions: Maybe<Readonly<Record<String, Dynamic>>>;
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

typedef GraphQLSchemaValidationOptions = {
  @:optional
  var assumeValid: Bool;
  @:optional
  var allowedLegacyNames: Maybe<ReadonlyArray<String>>;
};

typedef GraphQLSchemaConfig = {
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
  var extensions: Maybe<Readonly<Record<String, Dynamic>>>;
  @:optional
  var astNode: Maybe<SchemaDefinitionNode>;
  @:optional
  var extensionASTNodes: Maybe<ReadonlyArray<SchemaExtensionNode>>;
};

@:jsRequire('graphql/type/schema')
extern class SchemaTopLevel {
  static function isSchema(schema: Dynamic): Bool;
  static function assertSchema(schema: Dynamic): GraphQLSchema;
}

typedef GraphQLError = Dynamic;

typedef ExecutionContext = {
  var schema: GraphQLSchema;
  var fragments: {};
  var rootValue: Dynamic;
  var contextValue: Dynamic;
  var operation: OperationDefinitionNode;
  var variableValues: {};
  var fieldResolver: GraphQLFieldResolver<Dynamic, Dynamic, Dynamic>;
  var errors: Array<GraphQLError>;
};

typedef ExecutionResultDataDefault = {};

typedef ExecutionResult<TData> = {
  @:optional
  var errors: ReadonlyArray<GraphQLError>;
  @:optional
  var data: TData;
};

@:jsRequire('graphql/execution')
extern class ExecuteTopLevel {
  static function execute<TData>(schema: GraphQLSchema,
    document: DocumentNode, ?rootValue: Dynamic, ?contextValue: Dynamic,
    ?variableValues: Maybe<{}>, ?operationName: Maybe<String>,
    ?fieldResolver: Maybe<GraphQLFieldResolver<Dynamic, Dynamic, Dynamic>>,
    ?typeResolver: Maybe<GraphQLTypeResolver<Dynamic, Dynamic,
      Dynamic>>): PromiseOrValue<ExecutionResult<TData>>;
}

typedef ParseOptions = {
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
extern class ParserTopLevel {
  static function parse(source: haxe.extern.EitherType<String, Source>,
    ?options: ParseOptions): DocumentNode;
  static function parseValue(source: haxe.extern.EitherType<String, Source>,
    ?options: ParseOptions): ValueNode;
  static function parseType(source: haxe.extern.EitherType<String, Source>,
    ?options: ParseOptions): TypeNode;
}
