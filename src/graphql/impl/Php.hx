package graphql.impl;

import php.*;

@:native('GraphQL\\Deferred')
@:noCompletion extern class Deferred {
  public var promise: Dynamic;
  public function new(callback: Dynamic): Void;
  // public static function getQueue(): SplQueue;
  public static function runQueue(): Void;
  public function then(?onFulfilled: Dynamic, ?onRejected: Dynamic): Dynamic;
  public function run(): Void;
}

@:native('GraphQL\\GraphQL')
@:noCompletion extern class GraphQL {
  public static function executeQuery(schema: Schema, source: Dynamic,
    ?rootValue: Dynamic, ?context: Dynamic, ?variableValues: Dynamic,
    ?operationName: String, ?fieldResolver: Dynamic,
    ?validationRules: Array<Dynamic>): ExecutionResult;
  public static function promiseToExecute(promiseAdapter: PromiseAdapter,
    schema: Schema, source: Dynamic, ?rootValue: Dynamic, ?context: Dynamic,
    ?variableValues: Dynamic, ?operationName: String, ?fieldResolver: Dynamic,
    ?validationRules: Array<Dynamic>): Promise;
  public static function execute(schema: Schema, source: Dynamic,
    ?rootValue: Dynamic, ?contextValue: Dynamic, ?variableValues: Dynamic,
    ?operationName: String): Dynamic;
  public static function executeAndReturnResult(schema: Schema,
    source: Dynamic, ?rootValue: Dynamic, ?contextValue: Dynamic,
    ?variableValues: Dynamic, ?operationName: String): Dynamic;
  public static function getStandardDirectives(): Array<Dynamic>;
  public static function getStandardTypes(): Array<Dynamic>;
  public static function overrideStandardTypes(types: Array<Dynamic>): Dynamic;
  public static function getStandardValidationRules(): Array<Dynamic>;
  public static function setDefaultFieldResolver(fn: Dynamic): Void;
  public static function setPromiseAdapter(?promiseAdapter: PromiseAdapter): Void;
  public static function useExperimentalExecutor(): Dynamic;
  public static function useReferenceExecutor(): Dynamic;
  public static function getInternalDirectives(): Array<Dynamic>;
}

@:native('GraphQL\\Error\\ClientAware')
@:noCompletion extern interface ClientAware {
  public function isClientSafe(): Bool;
  public function getCategory(): String;
}

@:native('GraphQL\\Error\\Debug')
@:noCompletion extern class Debug {
  @:phpClassConst static public final INCLUDE_DEBUG_MESSAGE: Dynamic;
  @:phpClassConst static public final INCLUDE_TRACE: Dynamic;
  @:phpClassConst static public final RETHROW_INTERNAL_EXCEPTIONS: Dynamic;
  @:phpClassConst static public final RETHROW_UNSAFE_EXCEPTIONS: Dynamic;
}

@:native('GraphQL\\Error\\Error')
@:noCompletion extern class Error extends Exception implements JsonSerializable<Dynamic> implements ClientAware {
  @:phpClassConst static public final CATEGORY_GRAPHQL: Dynamic;
  @:phpClassConst static public final CATEGORY_INTERNAL: Dynamic;
  public var path: Dynamic;
  public var nodes: Dynamic;
  private var category: Dynamic;
  private var extensions: Dynamic;
  public function new(message: String, ?nodes: Dynamic, ?source: Source,
    ?positions: Dynamic, ?path: Dynamic, ?previous: php.Throwable,
    ?extensions: Array<Dynamic>): Void;
  public static function createLocatedError(error: Dynamic, ?nodes: Dynamic,
    ?path: Dynamic): php.Error;
  public static function formatError(error: php.Error): Array<Dynamic>;
  public function isClientSafe(): Bool;
  public function getCategory(): String;
  public function getSource(): Dynamic;
  public function getPositions(): Array<Int>;
  public function getLocations(): Array<SourceLocation>;
  public function getNodes(): Dynamic;
  public function getPath(): Dynamic;
  public function getExtensions(): Array<Dynamic>;
  public function toSerializableArray(): Array<Dynamic>;
  public function jsonSerialize(): Dynamic;
  public function __toString(): String;
}

@:native('GraphQL\\Error\\FormattedError')
@:noCompletion extern class FormattedError {
  public static function setInternalErrorMessage(msg: String): Dynamic;
  public static function printError(error: php.Error): String;
  public static function createFromException(e: php.Throwable,
    ?debug: Dynamic, ?internalErrorMessage: String): Array<Dynamic>;
  public static function addDebugEntries(formattedError: Array<Dynamic>,
    e: php.Throwable, debug: Dynamic): Array<Dynamic>;
  public static function prepareFormatter(?formatter: Dynamic,
    debug: Dynamic): Dynamic;
  public static function toSafeTrace(error: php.Throwable): Array<Dynamic>;
  public static function printVar(var_: Dynamic): String;
  public static function create(error: String,
    ?locations: Array<Dynamic>): Array<Dynamic>;
  public static function createFromPHPError(e: php.ErrorException): Array<Dynamic>;
}

@:native('GraphQL\\Error\\InvariantViolation')
@:noCompletion extern class InvariantViolation extends Exception {}

@:native('GraphQL\\Error\\SyntaxError')
@:noCompletion extern class SyntaxError extends Exception {
  public function new(source: Source, position: Int,
    description: String): Void;
}

@:native('GraphQL\\Error\\UserError')
@:noCompletion extern class UserError extends Exception implements ClientAware {
  public function isClientSafe(): Bool;
  public function getCategory(): String;
}

@:native('GraphQL\\Error\\Warning')
@:noCompletion extern class Warning {
  @:phpClassConst static public final WARNING_ASSIGN: Dynamic;
  @:phpClassConst static public final WARNING_CONFIG: Dynamic;
  @:phpClassConst static public final WARNING_FULL_SCHEMA_SCAN: Dynamic;
  @:phpClassConst static public final WARNING_CONFIG_DEPRECATION: Dynamic;
  @:phpClassConst static public final WARNING_NOT_A_TYPE: Dynamic;
  @:phpClassConst static public final ALL: Dynamic;
  public static function setWarningHandler(?warningHandler: Dynamic): Dynamic;
  public static function suppress(?suppress: Dynamic): Dynamic;
  public static function enable(?enable: Dynamic): Dynamic;
  public static function warnOnce(errorMessage: Dynamic, warningId: Dynamic,
    ?messageLevel: Dynamic): Dynamic;
  public static function warn(errorMessage: Dynamic, warningId: Dynamic,
    ?messageLevel: Dynamic): Dynamic;
}

@:native('GraphQL\\Executor\\ExecutionContext')
@:noCompletion extern class ExecutionContext {
  public var schema: Dynamic;
  public var fragments: Dynamic;
  public var rootValue: Dynamic;
  public var contextValue: Dynamic;
  public var operation: Dynamic;
  public var variableValues: Dynamic;
  public var fieldResolver: Dynamic;
  public var errors: Dynamic;
  public var promises: Dynamic;
  public function new(schema: Dynamic, fragments: Dynamic, root: Dynamic,
    contextValue: Dynamic, operation: Dynamic, variables: Dynamic,
    errors: Dynamic, fieldResolver: Dynamic, promiseAdapter: Dynamic): Void;
  public function addError(error: php.Error): Dynamic;
}

@:native('GraphQL\\Executor\\ExecutionResult')
@:noCompletion extern class ExecutionResult implements JsonSerializable<Dynamic> {
  public var data: Dynamic;
  public var errors: Dynamic;
  public var extensions: Dynamic;
  public function new(?data: Array<Dynamic>, ?errors: Array<Dynamic>,
    ?extensions: Array<Dynamic>): Void;
  public function setErrorFormatter(errorFormatter: Dynamic): ExecutionResult;
  public function setErrorsHandler(handler: Dynamic): ExecutionResult;
  public function jsonSerialize(): Array<Dynamic>;
  public function toArray(?debug: Dynamic): Array<Dynamic>;
}

@:native('GraphQL\\Executor\\Executor')
@:noCompletion extern class Executor {
  public static function getDefaultFieldResolver(): Dynamic;
  public static function setDefaultFieldResolver(fieldResolver: Dynamic): Dynamic;
  public static function getPromiseAdapter(): PromiseAdapter;
  public static function setPromiseAdapter(?defaultPromiseAdapter: PromiseAdapter): Dynamic;
  public static function getImplementationFactory(): Dynamic;
  public static function setImplementationFactory(implementationFactory: Dynamic): Dynamic;
  public static function execute(schema: Schema, documentNode: DocumentNode,
    ?rootValue: Dynamic, ?contextValue: Dynamic, ?variableValues: Dynamic,
    ?operationName: Dynamic, ?fieldResolver: Dynamic): Dynamic;
  public static function promiseToExecute(promiseAdapter: PromiseAdapter,
    schema: Schema, documentNode: DocumentNode, ?rootValue: Dynamic,
    ?contextValue: Dynamic, ?variableValues: Dynamic, ?operationName: Dynamic,
    ?fieldResolver: Dynamic): Promise;
  public static function defaultFieldResolver(source: Dynamic,
    args: Array<Dynamic>, context: Dynamic, info: ResolveInfo): Dynamic;
}

@:native('GraphQL\\Executor\\ExecutorImplementation')
@:noCompletion extern interface ExecutorImplementation {
  public function doExecute(): Promise;
}

@:native('GraphQL\\Executor\\ReferenceExecutor')
@:noCompletion extern class ReferenceExecutor implements ExecutorImplementation {
  public static function create(promiseAdapter: PromiseAdapter,
    schema: Schema, documentNode: DocumentNode, rootValue: Dynamic,
    contextValue: Dynamic, variableValues: Dynamic, operationName: String,
    fieldResolver: Dynamic): Dynamic;
  public function doExecute(): Promise;
  public function completeValueWithLocatedError(returnType: Type,
    fieldNodes: Array<FieldNode>, info: ResolveInfo, path: Array<String>,
    result: Dynamic): Dynamic;
}

@:native('GraphQL\\Executor\\Values')
@:noCompletion extern class Values {
  public static function getVariableValues(schema: Schema,
    varDefNodes: Array<VariableDefinitionNode>,
    inputs: Array<Dynamic>): Array<Dynamic>;
  public static function getDirectiveValues(directiveDef: Directive,
    node: Dynamic, ?variableValues: Dynamic): Dynamic;
  public static function getArgumentValues(def: Dynamic, node: Dynamic,
    ?variableValues: Array<Dynamic>): Array<Dynamic>;
  public static function getArgumentValuesForMap(fieldDefinition: Dynamic,
    argumentValueMap: Array<ArgumentNode>, ?variableValues: Array<Dynamic>,
    ?referenceNode: Dynamic): Array<Dynamic>;
  public static function valueFromAST(valueNode: ValueNode, type: InputType,
    ?variables: Array<Dynamic>): Dynamic;
  public static function isValidPHPValue(value: Array<Dynamic>,
    type: InputType): Array<String>;
}

/*
  @:native('GraphQL\\Executor\\Promise\\Adapter\\ReactPromiseAdapter')
  @:noCompletion extern class ReactPromiseAdapter implements PromiseAdapter {
  public function isThenable(value: Dynamic): Dynamic;
  public function convertThenable(thenable: Dynamic): Dynamic;
  public function then(promise: Promise,
    ?onFulfilled: Dynamic, ?onRejected: Dynamic): Dynamic;
  public function create(resolver: Dynamic): Dynamic;
  public function createFulfilled(?value: Dynamic): Dynamic;
  public function createRejected(reason: Dynamic): Dynamic;
  public function all(promisesOrValues: Array<Dynamic>): Dynamic;
}*/
@:native('GraphQL\\Executor\\Promise\\Adapter\\SyncPromise')
@:noCompletion extern class SyncPromise {
  @:phpClassConst static public final PENDING: Dynamic;
  @:phpClassConst static public final FULFILLED: Dynamic;
  @:phpClassConst static public final REJECTED: Dynamic;
  public var queue: Dynamic;
  public var state: String;
  public var result: Dynamic;
  public static function runQueue(): Dynamic;
  public function resolve(value: Dynamic): Dynamic;
  public function reject(reason: Dynamic): Dynamic;
  public static function getQueue(): Dynamic;
  public function then(?onFulfilled: Dynamic, ?onRejected: Dynamic): Dynamic;
}

@:native('GraphQL\\Executor\\Promise\\Adapter\\SyncPromiseAdapter')
@:noCompletion extern class SyncPromiseAdapter implements PromiseAdapter {
  public function isThenable(value: Dynamic): Bool;
  public function convertThenable(thenable: Map<String, Dynamic>): Promise;
  public function then(promise: Promise, ?onFulfilled: Dynamic,
    ?onRejected: Dynamic): Promise;
  public function create(resolver: Dynamic): Promise;
  public function createFulfilled(?value: Dynamic): Promise;
  public function createRejected(reason: php.Throwable): Promise;
  public function all(promisesOrValues: Array<Dynamic>): Promise;
  public function wait(promise: Promise): ExecutionResult;
  private function beforeWait(promise: Promise): Dynamic;
  private function onWait(promise: Promise): Dynamic;
}

@:native('GraphQL\\Executor\\Promise\\Promise')
@:noCompletion extern class Promise {
  public var adoptedPromise: Dynamic;
  public function new(adoptedPromise: Dynamic, adapter: PromiseAdapter): Void;
  public function then(?onFulfilled: Dynamic, ?onRejected: Dynamic): Promise;
}

@:native('GraphQL\\Executor\\Promise\\PromiseAdapter')
@:noCompletion extern interface PromiseAdapter {
  public function isThenable(value: Dynamic): Bool;
  public function convertThenable(thenable: Map<String, Dynamic>): Promise;
  public function then(promise: Promise, ?onFulfilled: Dynamic,
    ?onRejected: Dynamic): Promise;
  public function create(resolver: Dynamic): Promise;
  public function createFulfilled(?value: Dynamic): Promise;
  public function createRejected(reason: php.Throwable): Promise;
  public function all(promisesOrValues: Array<Dynamic>): Promise;
}

@:native('GraphQL\\Experimental\\Executor\\Collector')
@:noCompletion extern class Collector {
  public var operation: Dynamic;
  public var fragments: Array<FragmentDefinitionNode>;
  public var rootType: Dynamic;
  public function new(schema: Schema, runtime: Runtime): Void;
  public function initialize(documentNode: DocumentNode,
    ?operationName: String): Dynamic;
  public function collectFields(runtimeType: ObjectType,
    selectionSet: SelectionSetNode): php.Generator;
}

@:native('GraphQL\\Experimental\\Executor\\CoroutineContext')
@:noCompletion extern class CoroutineContext {
  public var shared: Dynamic;
  public var type: Dynamic;
  public var value: Dynamic;
  public var result: Dynamic;
  public var path: Dynamic;
  public var resolveInfo: Dynamic;
  public var nullFence: Dynamic;
  public function new(shared: CoroutineContextShared, type: ObjectType,
    value: Dynamic, result: Map<String, Dynamic>, path: Array<Dynamic>,
    ?nullFence: Array<Dynamic>): Void;
}

@:native('GraphQL\\Experimental\\Executor\\CoroutineContextShared')
@:noCompletion extern class CoroutineContextShared {
  public var fieldNodes: Dynamic;
  public var fieldName: Dynamic;
  public var resultName: Dynamic;
  public var argumentValueMap: Dynamic;
  public var mergedSelectionSet: Dynamic;
  public var typeGuard1: Dynamic;
  public var resolveIfType1: Dynamic;
  public var argumentsIfType1: Dynamic;
  public var resolveInfoIfType1: Dynamic;
  public var typeGuard2: Dynamic;
  public var childContextsIfType2: Dynamic;
  public function new(fieldNodes: Array<Dynamic>, fieldName: String,
    resultName: String, argumentValueMap: Array<Dynamic>): Void;
}

@:native('GraphQL\\Experimental\\Executor\\CoroutineExecutor')
@:noCompletion extern class CoroutineExecutor implements Runtime implements ExecutorImplementation {
  public function new(promiseAdapter: PromiseAdapter, schema: Schema,
    documentNode: DocumentNode, rootValue: Dynamic, contextValue: Dynamic,
    rawVariableValues: Dynamic, operationName: String,
    fieldResolver: Dynamic): Void;
  public static function create(promiseAdapter: PromiseAdapter,
    schema: Schema, documentNode: DocumentNode, rootValue: Dynamic,
    contextValue: Dynamic, variableValues: Dynamic, operationName: String,
    fieldResolver: Dynamic): Dynamic;
  public function doExecute(): Promise;
  public function evaluate(valueNode: ValueNode, type: InputType): Dynamic;
  public function addError(error: Dynamic): Dynamic;
}

@:native('GraphQL\\Experimental\\Executor\\Runtime')
@:noCompletion extern interface Runtime {
  public function evaluate(valueNode: ValueNode, type: InputType): Dynamic;
  public function addError(error: Dynamic): Dynamic;
}

@:native('GraphQL\\Experimental\\Executor\\Strand')
@:noCompletion extern class Strand {
  public var current: Dynamic;
  public var stack: Dynamic;
  public var depth: Dynamic;
  public var success: Dynamic;
  public var value: Dynamic;
  public function new(coroutine: php.Generator): Void;
}

@:native('GraphQL\\Language\\AST\\ArgumentNode')
@:noCompletion extern class ArgumentNode {
  public var kind: String;
  public var value: Dynamic;
  public var name: Dynamic;
}

@:native('GraphQL\\Language\\AST\\BooleanValueNode')
@:noCompletion extern class BooleanValueNode implements ValueNode {
  public var kind: String;
  public var value: Dynamic;
}

@:native('GraphQL\\Language\\AST\\DefinitionNode')
@:noCompletion extern interface DefinitionNode {}

@:native('GraphQL\\Language\\AST\\DirectiveDefinitionNode')
@:noCompletion extern class DirectiveDefinitionNode implements TypeSystemDefinitionNode {
  public var kind: String;
  public var name: Dynamic;
  public var arguments: Dynamic;
  public var locations: Dynamic;
  public var description: Dynamic;
}

@:native('GraphQL\\Language\\AST\\DirectiveNode')
@:noCompletion extern class DirectiveNode {
  public var kind: String;
  public var name: Dynamic;
  public var arguments: Dynamic;
}

@:native('GraphQL\\Language\\AST\\DocumentNode')
@:noCompletion extern class DocumentNode {
  public var kind: String;
  public var definitions: Dynamic;
}

@:native('GraphQL\\Language\\AST\\EnumTypeDefinitionNode')
@:noCompletion extern class EnumTypeDefinitionNode implements TypeDefinitionNode {
  public var kind: String;
  public var name: Dynamic;
  public var directives: Dynamic;
  public var values: Dynamic;
  public var description: Dynamic;
}

@:native('GraphQL\\Language\\AST\\EnumTypeExtensionNode')
@:noCompletion extern class EnumTypeExtensionNode implements TypeExtensionNode {
  public var kind: String;
  public var name: Dynamic;
  public var directives: Dynamic;
  public var values: Dynamic;
}

@:native('GraphQL\\Language\\AST\\EnumValueDefinitionNode')
@:noCompletion extern class EnumValueDefinitionNode {
  public var kind: String;
  public var name: Dynamic;
  public var directives: Dynamic;
  public var description: Dynamic;
}

@:native('GraphQL\\Language\\AST\\EnumValueNode')
@:noCompletion extern class EnumValueNode implements ValueNode {
  public var kind: String;
  public var value: Dynamic;
}

@:native('GraphQL\\Language\\AST\\ExecutableDefinitionNode')
@:noCompletion extern interface ExecutableDefinitionNode extends DefinitionNode {}

@:native('GraphQL\\Language\\AST\\FieldDefinitionNode')
@:noCompletion extern class FieldDefinitionNode {
  public var kind: String;
  public var name: Dynamic;
  public var arguments: Dynamic;
  public var type: Dynamic;
  public var directives: Dynamic;
  public var description: Dynamic;
}

@:native('GraphQL\\Language\\AST\\FieldNode')
@:noCompletion extern class FieldNode implements SelectionNode {
  public var kind: String;
  public var name: Dynamic;
  public var alias: Dynamic;
  public var arguments: Dynamic;
  public var directives: Dynamic;
  public var selectionSet: Dynamic;
}

@:native('GraphQL\\Language\\AST\\FloatValueNode')
@:noCompletion extern class FloatValueNode implements ValueNode {
  public var kind: String;
  public var value: Dynamic;
}

@:native('GraphQL\\Language\\AST\\FragmentDefinitionNode')
@:noCompletion extern class FragmentDefinitionNode implements ExecutableDefinitionNode implements HasSelectionSet {
  public var kind: String;
  public var name: Dynamic;
  public var variableDefinitions: Dynamic;
  public var typeCondition: Dynamic;
  public var directives: Dynamic;
  public var selectionSet: Dynamic;
}

@:native('GraphQL\\Language\\AST\\FragmentSpreadNode')
@:noCompletion extern class FragmentSpreadNode implements SelectionNode {
  public var kind: String;
  public var name: Dynamic;
  public var directives: Dynamic;
}

@:native('GraphQL\\Language\\AST\\HasSelectionSet')
@:noCompletion extern interface HasSelectionSet {}

@:native('GraphQL\\Language\\AST\\InlineFragmentNode')
@:noCompletion extern class InlineFragmentNode implements SelectionNode {
  public var kind: String;
  public var typeCondition: Dynamic;
  public var directives: Dynamic;
  public var selectionSet: Dynamic;
}

@:native('GraphQL\\Language\\AST\\InputObjectTypeDefinitionNode')
@:noCompletion extern class InputObjectTypeDefinitionNode implements TypeDefinitionNode {
  public var kind: String;
  public var name: Dynamic;
  public var directives: Dynamic;
  public var fields: Dynamic;
  public var description: Dynamic;
}

@:native('GraphQL\\Language\\AST\\InputObjectTypeExtensionNode')
@:noCompletion extern class InputObjectTypeExtensionNode implements TypeExtensionNode {
  public var kind: String;
  public var name: Dynamic;
  public var directives: Dynamic;
  public var fields: Dynamic;
}

@:native('GraphQL\\Language\\AST\\InputValueDefinitionNode')
@:noCompletion extern class InputValueDefinitionNode {
  public var kind: String;
  public var name: Dynamic;
  public var type: Dynamic;
  public var defaultValue: Dynamic;
  public var directives: Dynamic;
  public var description: Dynamic;
}

@:native('GraphQL\\Language\\AST\\InterfaceTypeDefinitionNode')
@:noCompletion extern class InterfaceTypeDefinitionNode implements TypeDefinitionNode {
  public var kind: String;
  public var name: Dynamic;
  public var directives: Dynamic;
  public var fields: Dynamic;
  public var description: Dynamic;
}

@:native('GraphQL\\Language\\AST\\InterfaceTypeExtensionNode')
@:noCompletion extern class InterfaceTypeExtensionNode implements TypeExtensionNode {
  public var kind: String;
  public var name: Dynamic;
  public var directives: Dynamic;
  public var fields: Dynamic;
}

@:native('GraphQL\\Language\\AST\\IntValueNode')
@:noCompletion extern class IntValueNode implements ValueNode {
  public var kind: String;
  public var value: Dynamic;
}

@:native('GraphQL\\Language\\AST\\ListTypeNode')
@:noCompletion extern class ListTypeNode implements TypeNode {
  public var kind: String;
  public var type: Dynamic;
}

@:native('GraphQL\\Language\\AST\\ListValueNode')
@:noCompletion extern class ListValueNode implements ValueNode {
  public var kind: String;
  public var values: Dynamic;
}

@:native('GraphQL\\Language\\AST\\Location')
@:noCompletion extern class Location {
  public var start: Dynamic;
  public var end: Dynamic;
  public var startToken: Dynamic;
  public var endToken: Dynamic;
  public var source: Dynamic;
  public static function create(start: Int, end: Int): Location;
  public function new(?startToken: Token, ?endToken: Token,
    ?source: Source): Void;
}

@:native('GraphQL\\Language\\AST\\NamedTypeNode')
@:noCompletion extern class NamedTypeNode implements TypeNode {
  public var kind: String;
  public var name: Dynamic;
}

@:native('GraphQL\\Language\\AST\\NameNode')
@:noCompletion extern class NameNode implements TypeNode {
  public var kind: String;
  public var value: Dynamic;
}

@:native('GraphQL\\Language\\AST\\Node')
@:noCompletion extern class Node {
  public var loc: Dynamic;
  public function new(vars: Array<Dynamic>): Void;
  public function cloneDeep(): Node;
  public function __toString(): String;
  public function toArray(?recursive: Bool): Array<Dynamic>;
}

@:native('GraphQL\\Language\\AST\\NodeKind')
@:noCompletion extern class NodeKind {
  @:phpClassConst static public final NAME: Dynamic;
  @:phpClassConst static public final DOCUMENT: Dynamic;
  @:phpClassConst static public final OPERATION_DEFINITION: Dynamic;
  @:phpClassConst static public final VARIABLE_DEFINITION: Dynamic;
  @:phpClassConst static public final VARIABLE: Dynamic;
  @:phpClassConst static public final SELECTION_SET: Dynamic;
  @:phpClassConst static public final FIELD: Dynamic;
  @:phpClassConst static public final ARGUMENT: Dynamic;
  @:phpClassConst static public final FRAGMENT_SPREAD: Dynamic;
  @:phpClassConst static public final INLINE_FRAGMENT: Dynamic;
  @:phpClassConst static public final FRAGMENT_DEFINITION: Dynamic;
  @:phpClassConst static public final INT: Dynamic;
  @:phpClassConst static public final FLOAT: Dynamic;
  @:phpClassConst static public final STRING: Dynamic;
  @:phpClassConst static public final BOOLEAN: Dynamic;
  @:phpClassConst static public final ENUM: Dynamic;
  @:phpClassConst static public final NULL: Dynamic;
  @:phpClassConst static public final LST: Dynamic;
  @:phpClassConst static public final OBJECT: Dynamic;
  @:phpClassConst static public final OBJECT_FIELD: Dynamic;
  @:phpClassConst static public final DIRECTIVE: Dynamic;
  @:phpClassConst static public final NAMED_TYPE: Dynamic;
  @:phpClassConst static public final LIST_TYPE: Dynamic;
  @:phpClassConst static public final NON_NULL_TYPE: Dynamic;
  @:phpClassConst static public final SCHEMA_DEFINITION: Dynamic;
  @:phpClassConst static public final OPERATION_TYPE_DEFINITION: Dynamic;
  @:phpClassConst static public final SCALAR_TYPE_DEFINITION: Dynamic;
  @:phpClassConst static public final OBJECT_TYPE_DEFINITION: Dynamic;
  @:phpClassConst static public final FIELD_DEFINITION: Dynamic;
  @:phpClassConst static public final INPUT_VALUE_DEFINITION: Dynamic;
  @:phpClassConst static public final INTERFACE_TYPE_DEFINITION: Dynamic;
  @:phpClassConst static public final UNION_TYPE_DEFINITION: Dynamic;
  @:phpClassConst static public final ENUM_TYPE_DEFINITION: Dynamic;
  @:phpClassConst static public final ENUM_VALUE_DEFINITION: Dynamic;
  @:phpClassConst static public final INPUT_OBJECT_TYPE_DEFINITION: Dynamic;
  @:phpClassConst static public final SCALAR_TYPE_EXTENSION: Dynamic;
  @:phpClassConst static public final OBJECT_TYPE_EXTENSION: Dynamic;
  @:phpClassConst static public final INTERFACE_TYPE_EXTENSION: Dynamic;
  @:phpClassConst static public final UNION_TYPE_EXTENSION: Dynamic;
  @:phpClassConst static public final ENUM_TYPE_EXTENSION: Dynamic;
  @:phpClassConst static public final INPUT_OBJECT_TYPE_EXTENSION: Dynamic;
  @:phpClassConst static public final DIRECTIVE_DEFINITION: Dynamic;
  @:phpClassConst static public final SCHEMA_EXTENSION: Dynamic;
  public var classMap: Array<String>;
}

@:native('GraphQL\\Language\\AST\\NodeList')
@:noCompletion extern class NodeList implements php.ArrayAccess<String, Dynamic>
    implements IteratorAggregate<Dynamic> implements Countable {
  public static function create(nodes: Array<Dynamic>): NodeList;
  public function new(nodes: Array<Dynamic>): Void;
  public function offsetExists(offset: Dynamic): Bool;
  public function offsetGet(offset: Dynamic): Dynamic;
  public function offsetSet(offset: Dynamic, value: Dynamic): Void;
  public function offsetUnset(offset: Dynamic): Void;
  public function splice(offset: Int, length: Int,
    ?replacement: Dynamic): NodeList;
  public function merge(list: Dynamic): NodeList;
  public function getIterator(): php.Traversable;
  public function count(): Int;
}

@:native('GraphQL\\Language\\AST\\NonNullTypeNode')
@:noCompletion extern class NonNullTypeNode implements TypeNode {
  public var kind: String;
  public var type: Dynamic;
}

@:native('GraphQL\\Language\\AST\\NullValueNode')
@:noCompletion extern class NullValueNode implements ValueNode {
  public var kind: String;
}

@:native('GraphQL\\Language\\AST\\ObjectFieldNode')
@:noCompletion extern class ObjectFieldNode {
  public var kind: String;
  public var name: Dynamic;
  public var value: Dynamic;
}

@:native('GraphQL\\Language\\AST\\ObjectTypeDefinitionNode')
@:noCompletion extern class ObjectTypeDefinitionNode implements TypeDefinitionNode {
  public var kind: String;
  public var name: Dynamic;
  public var interfaces: Array<NamedTypeNode>;
  public var directives: Dynamic;
  public var fields: Dynamic;
  public var description: Dynamic;
}

@:native('GraphQL\\Language\\AST\\ObjectTypeExtensionNode')
@:noCompletion extern class ObjectTypeExtensionNode implements TypeExtensionNode {
  public var kind: String;
  public var name: Dynamic;
  public var interfaces: Array<NamedTypeNode>;
  public var directives: Dynamic;
  public var fields: Dynamic;
}

@:native('GraphQL\\Language\\AST\\ObjectValueNode')
@:noCompletion extern class ObjectValueNode implements ValueNode {
  public var kind: String;
  public var fields: Dynamic;
}

@:native('GraphQL\\Language\\AST\\OperationDefinitionNode')
@:noCompletion extern class OperationDefinitionNode implements ExecutableDefinitionNode implements HasSelectionSet {
  public var kind: String;
  public var name: Dynamic;
  public var operation: Dynamic;
  public var variableDefinitions: Dynamic;
  public var directives: Dynamic;
  public var selectionSet: Dynamic;
}

@:native('GraphQL\\Language\\AST\\OperationTypeDefinitionNode')
@:noCompletion extern class OperationTypeDefinitionNode {
  public var kind: String;
  public var operation: Dynamic;
  public var type: Dynamic;
}

@:native('GraphQL\\Language\\AST\\ScalarTypeDefinitionNode')
@:noCompletion extern class ScalarTypeDefinitionNode implements TypeDefinitionNode {
  public var kind: String;
  public var name: Dynamic;
  public var directives: Dynamic;
  public var description: Dynamic;
}

@:native('GraphQL\\Language\\AST\\ScalarTypeExtensionNode')
@:noCompletion extern class ScalarTypeExtensionNode implements TypeExtensionNode {
  public var kind: String;
  public var name: Dynamic;
  public var directives: Dynamic;
}

@:native('GraphQL\\Language\\AST\\SchemaDefinitionNode')
@:noCompletion extern class SchemaDefinitionNode implements TypeSystemDefinitionNode {
  public var kind: String;
  public var directives: Dynamic;
  public var operationTypes: Dynamic;
}

@:native('GraphQL\\Language\\AST\\SchemaTypeExtensionNode')
@:noCompletion extern class SchemaTypeExtensionNode implements TypeExtensionNode {
  public var kind: String;
  public var directives: Dynamic;
  public var operationTypes: Dynamic;
}

@:native('GraphQL\\Language\\AST\\SelectionNode')
@:noCompletion extern interface SelectionNode {}

@:native('GraphQL\\Language\\AST\\SelectionSetNode')
@:noCompletion extern class SelectionSetNode {
  public var kind: String;
  public var selections: Dynamic;
}

@:native('GraphQL\\Language\\AST\\StringValueNode')
@:noCompletion extern class StringValueNode implements ValueNode {
  public var kind: String;
  public var value: Dynamic;
  public var block: Dynamic;
}

@:native('GraphQL\\Language\\AST\\TypeDefinitionNode')
@:noCompletion extern interface TypeDefinitionNode extends TypeSystemDefinitionNode {}

@:native('GraphQL\\Language\\AST\\TypeExtensionNode')
@:noCompletion extern interface TypeExtensionNode extends TypeSystemDefinitionNode {}

@:native('GraphQL\\Language\\AST\\TypeNode')
@:noCompletion extern interface TypeNode {}

@:native('GraphQL\\Language\\AST\\TypeSystemDefinitionNode')
@:noCompletion extern interface TypeSystemDefinitionNode extends DefinitionNode {}

@:native('GraphQL\\Language\\AST\\UnionTypeDefinitionNode')
@:noCompletion extern class UnionTypeDefinitionNode implements TypeDefinitionNode {
  public var kind: String;
  public var name: Dynamic;
  public var directives: Dynamic;
  public var types: Dynamic;
  public var description: Dynamic;
}

@:native('GraphQL\\Language\\AST\\UnionTypeExtensionNode')
@:noCompletion extern class UnionTypeExtensionNode implements TypeExtensionNode {
  public var kind: String;
  public var name: Dynamic;
  public var directives: Dynamic;
  public var types: Dynamic;
}

@:native('GraphQL\\Language\\AST\\ValueNode')
@:noCompletion extern interface ValueNode {}

@:native('GraphQL\\Language\\AST\\VariableDefinitionNode')
@:noCompletion extern class VariableDefinitionNode implements DefinitionNode {
  public var kind: String;
  public var variable: Dynamic;
  public var type: Dynamic;
  public var defaultValue: Dynamic;
}

@:native('GraphQL\\Language\\AST\\VariableNode')
@:noCompletion extern class VariableNode implements ValueNode {
  public var kind: String;
  public var name: Dynamic;
}

@:native('GraphQL\\Language\\DirectiveLocation')
@:noCompletion extern class DirectiveLocation {
  @:phpClassConst static public final QUERY: Dynamic;
  @:phpClassConst static public final MUTATION: Dynamic;
  @:phpClassConst static public final SUBSCRIPTION: Dynamic;
  @:phpClassConst static public final FIELD: Dynamic;
  @:phpClassConst static public final FRAGMENT_DEFINITION: Dynamic;
  @:phpClassConst static public final FRAGMENT_SPREAD: Dynamic;
  @:phpClassConst static public final INLINE_FRAGMENT: Dynamic;
  @:phpClassConst static public final SCHEMA: Dynamic;
  @:phpClassConst static public final SCALAR: Dynamic;
  @:phpClassConst static public final OBJECT: Dynamic;
  @:phpClassConst static public final FIELD_DEFINITION: Dynamic;
  @:phpClassConst static public final ARGUMENT_DEFINITION: Dynamic;
  @:phpClassConst static public final IFACE: Dynamic;
  @:phpClassConst static public final UNION: Dynamic;
  @:phpClassConst static public final ENUM: Dynamic;
  @:phpClassConst static public final ENUM_VALUE: Dynamic;
  @:phpClassConst static public final INPUT_OBJECT: Dynamic;
  @:phpClassConst static public final INPUT_FIELD_DEFINITION: Dynamic;
  public static function has(name: String): Bool;
}

@:native('GraphQL\\Language\\Lexer')
@:noCompletion extern class Lexer {
  public var source: Dynamic;
  public var options: Dynamic;
  public var lastToken: Dynamic;
  public var token: Dynamic;
  public var line: Dynamic;
  public var lineStart: Dynamic;
  public function new(source: Source, ?options: Array<Dynamic>): Void;
  public function advance(): Token;
  public function lookahead(): Dynamic;
}

@:native('GraphQL\\Language\\Parser')
@:noCompletion extern class Parser {
  public static function parse(source: Dynamic,
    ?options: Array<Dynamic>): DocumentNode;
  public static function parseValue(source: Dynamic,
    ?options: Array<Dynamic>): Dynamic;
  public static function parseType(source: Dynamic,
    ?options: Array<Dynamic>): Dynamic;
  public function new(source: Source, ?options: Array<Dynamic>): Void;
}

@:native('GraphQL\\Language\\Printer')
@:noCompletion extern class Printer {
  public static function doPrint(ast: Node): String;
  private function new(): Void;
  public function printAST(ast: Dynamic): Dynamic;
  public function addDescription(cb: Dynamic): Dynamic;
  public function wrap(start: Dynamic, maybeString: Dynamic,
    ?end: Dynamic): Dynamic;
  public function block(array: Dynamic): Dynamic;
  public function indent(maybeString: Dynamic): Dynamic;
  public function manyList(start: Dynamic, list: Dynamic, separator: Dynamic,
    end: Dynamic): Dynamic;
  public function length(maybeArray: Dynamic): Dynamic;
  public function join(maybeArray: Dynamic, ?separator: Dynamic): Dynamic;
}

@:native('GraphQL\\Language\\Source')
@:noCompletion extern class Source {
  public var body: Dynamic;
  public var length: Dynamic;
  public var name: Dynamic;
  public var locationOffset: Dynamic;
  public function new(body: String, ?name: Dynamic,
    ?location: SourceLocation): Void;
  public function getLocation(position: Int): SourceLocation;
}

@:native('GraphQL\\Language\\SourceLocation')
@:noCompletion extern class SourceLocation implements JsonSerializable<Dynamic> {
  public var line: Dynamic;
  public var column: Dynamic;
  public function new(line: Int, col: Int): Void;
  public function toArray(): Array<Int>;
  public function toSerializableArray(): Array<Int>;
  public function jsonSerialize(): Array<Int>;
}

@:native('GraphQL\\Language\\Token')
@:noCompletion extern class Token {
  @:phpClassConst static public final SOF: Dynamic;
  @:phpClassConst static public final EOF: Dynamic;
  @:phpClassConst static public final BANG: Dynamic;
  @:phpClassConst static public final DOLLAR: Dynamic;
  @:phpClassConst static public final AMP: Dynamic;
  @:phpClassConst static public final PAREN_L: Dynamic;
  @:phpClassConst static public final PAREN_R: Dynamic;
  @:phpClassConst static public final SPREAD: Dynamic;
  @:phpClassConst static public final COLON: Dynamic;
  @:phpClassConst static public final EQUALS: Dynamic;
  @:phpClassConst static public final AT: Dynamic;
  @:phpClassConst static public final BRACKET_L: Dynamic;
  @:phpClassConst static public final BRACKET_R: Dynamic;
  @:phpClassConst static public final BRACE_L: Dynamic;
  @:phpClassConst static public final PIPE: Dynamic;
  @:phpClassConst static public final BRACE_R: Dynamic;
  @:phpClassConst static public final NAME: Dynamic;
  @:phpClassConst static public final INT: Dynamic;
  @:phpClassConst static public final FLOAT: Dynamic;
  @:phpClassConst static public final STRING: Dynamic;
  @:phpClassConst static public final BLOCK_STRING: Dynamic;
  @:phpClassConst static public final COMMENT: Dynamic;
  public var kind: Dynamic;
  public var start: Dynamic;
  public var end: Dynamic;
  public var line: Dynamic;
  public var column: Dynamic;
  public var value: Dynamic;
  public var prev: Dynamic;
  public var next: Dynamic;
  public function new(kind: String, start: Int, end: Int, line: Int,
    column: Int, ?previous: Token, ?value: Dynamic): Void;
  public function getDescription(): String;
  public function toArray(): Dynamic;
}

@:native('GraphQL\\Language\\Visitor')
@:noCompletion extern class Visitor {
  public var visitorKeys: Array<Array<String>>;
  public static function visit(root: Dynamic, visitor: Array<Dynamic>,
    ?keyMap: Dynamic): Dynamic;
  public static function stop(): VisitorOperation;
  public static function skipNode(): VisitorOperation;
  public static function removeNode(): VisitorOperation;
  public static function visitInParallel(visitors: Array<Array<Dynamic>>): Array<Array<Dynamic>>;
  public static function visitWithTypeInfo(typeInfo: TypeInfo,
    visitor: Dynamic): Dynamic;
  public static function getVisitFn(visitor: Dynamic, kind: String,
    isLeaving: Bool): Dynamic;
}

@:native('GraphQL\\Language\\VisitorOperation')
@:noCompletion extern class VisitorOperation {
  public var doBreak: Dynamic;
  public var doContinue: Dynamic;
  public var removeNode: Dynamic;
}

@:native('GraphQL\\Server\\Helper')
@:noCompletion extern class Helper {
  public function parseHttpRequest(?readRawBodyFn: Dynamic): Dynamic;
  public function parseRequestParams(method: String,
    bodyParams: Array<Dynamic>, queryParams: Array<Dynamic>): Dynamic;
  public function validateOperationParams(params: OperationParams): Array<php.Error>;
  public function executeOperation(config: ServerConfig,
    op: OperationParams): Dynamic;
  public function executeBatch(config: ServerConfig,
    operations: Array<Dynamic>): Dynamic;
  public function sendResponse(result: Dynamic, ?exitWhenDone: Bool): Dynamic;
  public function emitResponse(jsonSerializable: Dynamic, httpStatus: Int,
    exitWhenDone: Bool): Dynamic;
  // public function parsePsrRequest(request: ServerRequestInterface): Dynamic;
  /*public function toPsrResponse(result: Dynamic, response: ResponseInterface,
    writableBodyStream: StreamInterface): Dynamic; */
}

@:native('GraphQL\\Server\\OperationParams')
@:noCompletion extern class OperationParams {
  public var queryId: Dynamic;
  public var query: Dynamic;
  public var operation: Dynamic;
  public var variables: Dynamic;
  public var extensions: Dynamic;
  public static function create(params: Array<Dynamic>,
    ?readonly: Bool): OperationParams;
  public function getOriginalInput(key: String): Dynamic;
  public function isReadOnly(): Bool;
}

@:native('GraphQL\\Server\\RequestError')
@:noCompletion extern class RequestError extends Exception implements ClientAware {
  public function isClientSafe(): Bool;
  public function getCategory(): String;
}

@:native('GraphQL\\Server\\ServerConfig')
@:noCompletion extern class ServerConfig {
  public static function create(?config: Dynamic): ServerConfig;
  public function setSchema(schema: Schema): ServerConfig;
  public function setContext(context: Dynamic): ServerConfig;
  public function setRootValue(rootValue: Dynamic): ServerConfig;
  public function setErrorFormatter(errorFormatter: Dynamic): ServerConfig;
  public function setErrorsHandler(handler: Dynamic): ServerConfig;
  public function setValidationRules(validationRules: Dynamic): ServerConfig;
  public function setFieldResolver(fieldResolver: Dynamic): ServerConfig;
  public function setPersistentQueryLoader(persistentQueryLoader: Dynamic): ServerConfig;
  public function setDebug(?set: Dynamic): ServerConfig;
  public function setQueryBatching(enableBatching: Bool): ServerConfig;
  public function setPromiseAdapter(promiseAdapter: PromiseAdapter): ServerConfig;
  public function getContext(): Dynamic;
  public function getRootValue(): Dynamic;
  public function getSchema(): Schema;
  public function getErrorFormatter(): Dynamic;
  public function getErrorsHandler(): Dynamic;
  public function getPromiseAdapter(): PromiseAdapter;
  public function getValidationRules(): Dynamic;
  public function getFieldResolver(): Dynamic;
  public function getPersistentQueryLoader(): Dynamic;
  public function getDebug(): Bool;
  public function getQueryBatching(): Bool;
}

@:native('GraphQL\\Server\\StandardServer')
@:noCompletion extern class StandardServer {
  public static function send500Error(error: php.Throwable, ?debug: Bool,
    ?exitWhenDone: Bool): Dynamic;
  public function new(config: Dynamic): Void;
  public function handleRequest(?parsedBody: Dynamic,
    ?exitWhenDone: Bool): Dynamic;
  public function executeRequest(?parsedBody: Dynamic): Dynamic;
  /*public function processPsrRequest(request: ServerRequestInterface,
      response: ResponseInterface, writableBodyStream: StreamInterface): Dynamic;
    public function executePsrRequest(request: ServerRequestInterface): Dynamic; */
  public function getHelper(): Helper;
}

@:native('GraphQL\\Type\\Definition\\AbstractType')
@:noCompletion extern interface AbstractType {
  public function resolveType(objectValue: Map<String, Dynamic>,
    context: Array<Dynamic>, info: ResolveInfo): Dynamic;
}

@:native('GraphQL\\Type\\Definition\\BooleanType')
@:noCompletion extern class BooleanType extends ScalarType {
  public var name: String;
  public var description: String;
  public function serialize(value: Dynamic): Bool;
  public function parseValue(value: Dynamic): Bool;
  public function parseLiteral(valueNode: Node,
    ?variables: Array<Dynamic>): Dynamic;
}

@:native('GraphQL\\Type\\Definition\\CompositeType')
@:noCompletion extern interface CompositeType {}

@:native('GraphQL\\Type\\Definition\\CustomScalarType')
@:noCompletion extern class CustomScalarType extends ScalarType {
  public function serialize(value: Dynamic): Dynamic;
  public function parseValue(value: Dynamic): Dynamic;
  public function parseLiteral(valueNode: Node,
    ?variables: Array<Dynamic>): Dynamic;
  public function assertValid(): Dynamic;
}

@:native('GraphQL\\Type\\Definition\\Directive')
@:noCompletion extern class Directive {
  @:phpClassConst static public final DEFAULT_DEPRECATION_REASON: Dynamic;
  @:phpClassConst static public final INCLUDE_NAME: Dynamic;
  @:phpClassConst static public final IF_ARGUMENT_NAME: Dynamic;
  @:phpClassConst static public final SKIP_NAME: Dynamic;
  @:phpClassConst static public final DEPRECATED_NAME: Dynamic;
  @:phpClassConst static public final REASON_ARGUMENT_NAME: Dynamic;
  public var internalDirectives: Dynamic;
  public var name: Dynamic;
  public var description: Dynamic;
  public var locations: Dynamic;
  public var args: Array<FieldArgument>;
  public var astNode: Dynamic;
  public var config: Dynamic;
  public function new(config: Dynamic): Void;
  public static function includeDirective(): Directive;
  public static function getInternalDirectives(): Array<Directive>;
  public static function skipDirective(): Directive;
  public static function deprecatedDirective(): Directive;
  public static function isSpecifiedDirective(directive: Directive): Bool;
}

@:native('GraphQL\\Type\\Definition\\EnumType')
@:noCompletion extern class EnumType implements InputType
    implements OutputType implements LeafType implements NullableType
    implements NamedType {
  public var astNode: Dynamic;
  public var extensionASTNodes: Dynamic;
  public function new(config: Dynamic): Void;
  public function getValue(name: Dynamic): Dynamic;
  public function getValues(): Array<EnumValueDefinition>;
  public function serialize(value: Dynamic): Dynamic;
  public function parseValue(value: Dynamic): Dynamic;
  public function parseLiteral(valueNode: Node,
    ?variables: Array<Dynamic>): Dynamic;
  public function assertValid(): Dynamic;
}

@:native('GraphQL\\Type\\Definition\\EnumValueDefinition')
@:noCompletion extern class EnumValueDefinition {
  public var name: Dynamic;
  public var value: Dynamic;
  public var deprecationReason: Dynamic;
  public var description: Dynamic;
  public var astNode: Dynamic;
  public var config: Dynamic;
  public function new(config: Dynamic): Void;
  public function isDeprecated(): Bool;
}

@:native('GraphQL\\Type\\Definition\\FieldArgument')
@:noCompletion extern class FieldArgument {
  public var name: Dynamic;
  public var defaultValue: Dynamic;
  public var description: Dynamic;
  public var astNode: Dynamic;
  public var config: Dynamic;
  public function new(def: Array<Dynamic>): Void;
  public static function createMap(config: Dynamic): Array<FieldArgument>;
  public function getType(): InputType;
  public function defaultValueExists(): Bool;
  public function assertValid(parentField: FieldDefinition,
    parentType: Type): Dynamic;
}

@:native('GraphQL\\Type\\Definition\\FieldDefinition')
@:noCompletion extern class FieldDefinition {
  @:phpClassConst static public final DEFAULT_COMPLEXITY_FN: Dynamic;
  public var name: Dynamic;
  public var args: Dynamic;
  public var resolveFn: Dynamic;
  public var mapFn: Dynamic;
  public var description: Dynamic;
  public var deprecationReason: Dynamic;
  public var astNode: Dynamic;
  public var config: Dynamic;
  public var type: Dynamic;
  private function new(config: Dynamic): Void;
  public static function defineFieldMap(type: Type, fields: Dynamic): Dynamic;
  public static function create(field: Array<Dynamic>): FieldDefinition;
  public static function defaultComplexity(childrenComplexity: Int): Dynamic;
  public function getArg(name: String): Dynamic;
  public function getType(): Type;
  public function isDeprecated(): Bool;
  public function getComplexityFn(): Dynamic;
  public function assertValid(parentType: Type): Dynamic;
}

@:native('GraphQL\\Type\\Definition\\FloatType')
@:noCompletion extern class FloatType extends ScalarType {
  public var name: String;
  public var description: String;
  public function serialize(value: Dynamic): Dynamic;
  public function parseValue(value: Dynamic): Dynamic;
  public function parseLiteral(valueNode: Node,
    ?variables: Array<Dynamic>): Dynamic;
}

@:native('GraphQL\\Type\\Definition\\IDType')
@:noCompletion extern class IDType extends ScalarType {
  public var name: String;
  public var description: String;
  public function serialize(value: Dynamic): String;
  public function parseValue(value: Dynamic): String;
  public function parseLiteral(valueNode: Node,
    ?variables: Array<Dynamic>): Dynamic;
}

@:native('GraphQL\\Type\\Definition\\InputObjectField')
@:noCompletion extern class InputObjectField {
  public var name: Dynamic;
  public var defaultValue: Dynamic;
  public var description: Dynamic;
  public var type: Dynamic;
  public var astNode: Dynamic;
  public var config: Dynamic;
  public function new(opts: Array<Dynamic>): Void;
  public function getType(): Dynamic;
  public function defaultValueExists(): Bool;
  public function assertValid(parentType: Type): Dynamic;
}

@:native('GraphQL\\Type\\Definition\\InputObjectType')
@:noCompletion extern class InputObjectType implements InputType implements NullableType implements NamedType {
  public var astNode: Dynamic;
  public var extensionASTNodes: Dynamic;
  public function new(config: Dynamic): Void;
  public function getField(name: String): InputObjectField;
  public function getFields(): Array<InputObjectField>;
  public function assertValid(): Dynamic;
}

@:native('GraphQL\\Type\\Definition\\InputType')
@:noCompletion extern interface InputType {}

@:native('GraphQL\\Type\\Definition\\InterfaceType')
@:noCompletion extern class InterfaceType implements AbstractType
    implements OutputType implements CompositeType implements NullableType
    implements NamedType {
  public var astNode: Dynamic;
  public var extensionASTNodes: Dynamic;
  public function new(config: Dynamic): Void;
  public static function assertInterfaceType(type: Dynamic): InterfaceType;
  public function getField(name: String): FieldDefinition;
  public function hasField(name: String): Bool;
  public function getFields(): Array<FieldDefinition>;
  public function resolveType(objectValue: Map<String, Dynamic>,
    context: Array<Dynamic>, info: ResolveInfo): Dynamic;
  public function assertValid(): Dynamic;
}

@:native('GraphQL\\Type\\Definition\\IntType')
@:noCompletion extern class IntType extends ScalarType {
  public var name: String;
  public var description: String;
  public function serialize(value: Dynamic): Dynamic;
  public function parseValue(value: Dynamic): Dynamic;
  public function parseLiteral(valueNode: Node,
    ?variables: Array<Dynamic>): Dynamic;
}

@:native('GraphQL\\Type\\Definition\\LeafType')
@:noCompletion extern interface LeafType {
  public function serialize(value: Dynamic): Dynamic;
  public function parseValue(value: Dynamic): Dynamic;
  public function parseLiteral(valueNode: Node,
    ?variables: Array<Dynamic>): Dynamic;
}

@:native('GraphQL\\Type\\Definition\\ListOfType')
@:noCompletion extern class ListOfType implements WrappingType
    implements OutputType implements NullableType implements InputType {
  public var ofType: Dynamic;
  public function new(type: Dynamic): Void;
  public function toString(): String;
  public function getWrappedType(?recurse: Bool): Dynamic;
}

@:native('GraphQL\\Type\\Definition\\NamedType')
@:noCompletion extern interface NamedType {}

@:native('GraphQL\\Type\\Definition\\NonNull')
@:noCompletion extern class NonNull implements WrappingType implements OutputType implements InputType {
  public function new(type: NullableType): Void;
  public static function assertNullableType(type: Dynamic): NullableType;
  public static function assertNullType(type: Dynamic): NonNull;
  public function toString(): String;
  public function getWrappedType(?recurse: Bool): Type;
}

@:native('GraphQL\\Type\\Definition\\NullableType')
@:noCompletion extern interface NullableType {}

@:native('GraphQL\\Type\\Definition\\ObjectType')
@:noCompletion extern class ObjectType implements OutputType
    implements CompositeType implements NullableType implements NamedType {
  public var astNode: Dynamic;
  public var extensionASTNodes: Dynamic;
  public var resolveFieldFn: Dynamic;
  public function new(config: Dynamic): Void;
  public static function assertObjectType(type: Dynamic): ObjectType;
  public function getField(name: String): FieldDefinition;
  public function hasField(name: String): Bool;
  public function getFields(): Array<FieldDefinition>;
  public function implementsInterface(iface: InterfaceType): Bool;
  public function getInterfaces(): Array<InterfaceType>;
  public function isTypeOf(value: Array<Dynamic>, context: Dynamic,
    info: ResolveInfo): Dynamic;
  public function assertValid(): Dynamic;
}

@:native('GraphQL\\Type\\Definition\\OutputType')
@:noCompletion extern interface OutputType {}

@:native('GraphQL\\Type\\Definition\\QueryPlan')
@:noCompletion extern class QueryPlan {
  public function new(parentType: ObjectType, schema: Schema,
    fieldNodes: Iterable<Dynamic>, variableValues: Array<Dynamic>,
    fragments: Array<Dynamic>): Void;
  public function queryPlan(): Array<Dynamic>;
  public function getReferencedTypes(): Array<Dynamic>;
  public function hasType(type: String): Bool;
  public function getReferencedFields(): Array<Dynamic>;
  public function hasField(field: String): Bool;
  public function subFields(typename: String): Array<Dynamic>;
}

@:native('GraphQL\\Type\\Definition\\ResolveInfo')
@:noCompletion extern class ResolveInfo {
  public var fieldName: Dynamic;
  public var fieldNodes: Array<FieldNode>;
  public var returnType: Dynamic;
  public var parentType: Dynamic;
  public var path: Dynamic;
  public var schema: Dynamic;
  public var fragments: Array<FragmentDefinitionNode>;
  public var rootValue: Dynamic;
  public var operation: Dynamic;
  public var variableValues: Array<Dynamic>;
  public function new(fieldName: String, fieldNodes: Iterable<Dynamic>,
    returnType: Dynamic, parentType: ObjectType, path: Array<Dynamic>,
    schema: Schema, fragments: Array<Dynamic>, rootValue: Dynamic,
    operation: OperationDefinitionNode, variableValues: Array<Dynamic>): Void;
  public function getFieldSelection(?depth: Int): Array<Bool>;
  public function lookAhead(): QueryPlan;
}

@:native('GraphQL\\Type\\Definition\\ScalarType')
@:noCompletion extern class ScalarType implements OutputType
    implements InputType implements LeafType implements NullableType
    implements NamedType {
  public var astNode: Dynamic;
  public var extensionASTNodes: Dynamic;
  public function new(?config: Dynamic): Void;

  public function serialize(value: Dynamic): Dynamic;
  public function parseValue(value: Dynamic): Dynamic;
  public function parseLiteral(valueNode: Node,
    ?variables: Array<Dynamic>): Dynamic;
}

@:native('GraphQL\\Type\\Definition\\StringType')
@:noCompletion extern class StringType extends ScalarType {
  public var name: String;
  public var description: String;
  public function serialize(value: Dynamic): Dynamic;
  public function parseValue(value: Dynamic): String;
  public function parseLiteral(valueNode: Node,
    ?variables: Array<Dynamic>): Dynamic;
}

@:native('GraphQL\\Type\\Definition\\Type')
@:noCompletion extern class Type implements JsonSerializable<Dynamic> {
  @:phpClassConst static public final STRING: Dynamic;
  @:phpClassConst static public final INT: Dynamic;
  @:phpClassConst static public final BOOLEAN: Dynamic;
  @:phpClassConst static public final FLOAT: Dynamic;
  @:phpClassConst static public final ID: Dynamic;
  public var name: Dynamic;
  public var description: Dynamic;
  public var astNode: Dynamic;
  public var config: Dynamic;
  public var extensionASTNodes: Dynamic;
  public static function id(): Dynamic;
  public static function string(): Dynamic;
  public static function boolean(): Dynamic;
  public static function int(): Dynamic;
  public static function float(): Dynamic;
  public static function listOf(wrappedType: Dynamic): ListOfType;
  public static function nonNull(wrappedType: NullableType): NonNull;
  public static function isBuiltInType(type: Type): Bool;
  public static function getAllBuiltInTypes(): Array<Type>;
  public static function getStandardTypes(): Array<Type>;
  public static function getInternalTypes(): Array<Type>;
  public static function overrideStandardTypes(types: Array<Dynamic>): Dynamic;
  public static function isInputType(type: Type): Bool;
  public static function getNamedType(type: Type): Dynamic;
  public static function isOutputType(type: Type): Bool;
  public static function isLeafType(type: Type): Bool;
  public static function isCompositeType(type: Type): Bool;
  public static function isAbstractType(type: Type): Bool;
  public static function assertType(type: Dynamic): Dynamic;
  public static function isType(type: Type): Bool;
  public static function getNullableType(type: Type): NullableType;
  public function assertValid(): Dynamic;
  public function jsonSerialize(): String;
  public function toString(): String;
  public function __toString(): String;
  private function tryInferName(): Dynamic;
}

@:native('GraphQL\\Type\\Definition\\UnionType')
@:noCompletion extern class UnionType implements AbstractType
    implements OutputType implements CompositeType implements NullableType
    implements NamedType {
  public var astNode: Dynamic;
  public var extensionASTNodes: Dynamic;
  public function new(config: Dynamic): Void;
  public function isPossibleType(type: Type): Bool;
  public function getTypes(): Array<ObjectType>;
  public function resolveType(objectValue: Map<String, Dynamic>,
    context: Dynamic, info: ResolveInfo): Dynamic;
  public function assertValid(): Dynamic;
}

@:native('GraphQL\\Type\\Definition\\UnmodifiedType')
@:noCompletion extern interface UnmodifiedType {}

@:native('GraphQL\\Type\\Definition\\WrappingType')
@:noCompletion extern interface WrappingType {
  public function getWrappedType(?recurse: Bool): Dynamic;
}

@:native('GraphQL\\Type\\Introspection')
@:noCompletion extern class Introspection {
  @:phpClassConst static public final SCHEMA_FIELD_NAME: Dynamic;
  @:phpClassConst static public final TYPE_FIELD_NAME: Dynamic;
  @:phpClassConst static public final TYPE_NAME_FIELD_NAME: Dynamic;
  public static function getIntrospectionQuery(?options: Dynamic): String;
  public static function isIntrospectionType(type: Type): Bool;
  public static function getTypes(): Dynamic;
  public static function _schema(): Dynamic;
  public static function _type(): Dynamic;
  public static function _typeKind(): Dynamic;
  public static function _field(): Dynamic;
  public static function _inputValue(): Dynamic;
  public static function _enumValue(): Dynamic;
  public static function _directive(): Dynamic;
  public static function _directiveLocation(): Dynamic;
  public static function schemaMetaFieldDef(): Dynamic;
  public static function typeMetaFieldDef(): Dynamic;
  public static function typeNameMetaFieldDef(): Dynamic;
}

@:native('GraphQL\\Type\\Schema')
@:noCompletion extern class Schema {
  public var extensionASTNodes: Dynamic;
  public function new(config: Dynamic): Void;
  public function getTypeMap(): Array<Type>;
  public function getDirectives(): Array<Directive>;
  public function getQueryType(): ObjectType;
  public function getMutationType(): Dynamic;
  public function getSubscriptionType(): Dynamic;
  public function getConfig(): SchemaConfig;
  public function getType(name: String): Dynamic;
  public function hasType(name: String): Bool;
  public function getPossibleTypes(abstractType: AbstractType): Array<ObjectType>;
  public function isPossibleType(abstractType: AbstractType,
    possibleType: ObjectType): Bool;
  public function getDirective(name: String): Directive;
  public function getAstNode(): SchemaDefinitionNode;
  public function assertValid(): Dynamic;
  public function validate(): Dynamic;
}

@:native('GraphQL\\Type\\SchemaConfig')
@:noCompletion extern class SchemaConfig {
  public var query: Dynamic;
  public var mutation: Dynamic;
  public var subscription: Dynamic;
  public var types: Dynamic;
  public var directives: Dynamic;
  public var typeLoader: Dynamic;
  public var astNode: Dynamic;
  public var assumeValid: Dynamic;
  public var extensionASTNodes: Dynamic;
  public static function create(?options: Array<Dynamic>): SchemaConfig;
  public function getAstNode(): SchemaDefinitionNode;
  public function setAstNode(astNode: SchemaDefinitionNode): SchemaConfig;
  public function getQuery(): ObjectType;
  public function setQuery(query: ObjectType): SchemaConfig;
  public function getMutation(): ObjectType;
  public function setMutation(mutation: ObjectType): SchemaConfig;
  public function getSubscription(): ObjectType;
  public function setSubscription(subscription: ObjectType): SchemaConfig;
  public function getTypes(): Array<Type>;
  public function setTypes(types: Dynamic): SchemaConfig;
  public function getDirectives(): Array<Directive>;
  public function setDirectives(directives: Array<Dynamic>): SchemaConfig;
  public function getTypeLoader(): Dynamic;
  public function setTypeLoader(typeLoader: Dynamic): SchemaConfig;
  public function getAssumeValid(): Bool;
  public function setAssumeValid(assumeValid: Bool): SchemaConfig;
  public function getExtensionASTNodes(): Array<SchemaTypeExtensionNode>;
  public function setExtensionASTNodes(extensionASTNodes: Array<Dynamic>): Dynamic;
}

@:native('GraphQL\\Type\\SchemaValidationContext')
@:noCompletion extern class SchemaValidationContext {
  public function new(schema: Schema): Void;
  public function getErrors(): Array<php.Error>;
  public function validateRootTypes(): Dynamic;
  public function validateDirectives(): Dynamic;
  public function validateTypes(): Dynamic;
}

@:native('GraphQL\\Type\\TypeKind')
@:noCompletion extern class TypeKind {
  @:phpClassConst static public final SCALAR: Dynamic;
  @:phpClassConst static public final OBJECT: Dynamic;
  @:phpClassConst static public final INTERFACE_KIND: Dynamic;
  @:phpClassConst static public final UNION: Dynamic;
  @:phpClassConst static public final ENUM: Dynamic;
  @:phpClassConst static public final INPUT_OBJECT: Dynamic;
  @:phpClassConst static public final LIST_KIND: Dynamic;
  @:phpClassConst static public final NON_NULL: Dynamic;
}

@:native('GraphQL\\Utils\\AST')
@:noCompletion extern class AST {
  public static function fromArray(node: Array<Dynamic>): Node;
  public static function toArray(node: Node): Array<Dynamic>;
  public static function astFromValue(value: Dynamic,
    type: InputType): Dynamic;
  public static function valueFromAST(valueNode: Dynamic, type: InputType,
    ?variables: Array<Dynamic>): Dynamic;
  public static function valueFromASTUntyped(valueNode: Node,
    ?variables: Array<Dynamic>): Dynamic;
  public static function typeFromAST(schema: Schema,
    inputTypeNode: Dynamic): Dynamic;
  public static function getOperation(document: DocumentNode,
    ?operationName: String): Bool;
}

@:native('GraphQL\\Utils\\ASTDefinitionBuilder')
@:noCompletion extern class ASTDefinitionBuilder {
  public function new(typeDefinitionsMap: Array<Dynamic>,
    options: Array<Bool>, resolveType: Dynamic,
    ?typeConfigDecorator: Dynamic): Void;
  public function buildDirective(directiveNode: DirectiveDefinitionNode): Dynamic;
  public function buildType(ref: Dynamic): Type;
  public function buildField(field: FieldDefinitionNode): Dynamic;
  public function buildInputField(value: InputValueDefinitionNode): Array<Dynamic>;
  public function buildEnumValue(value: EnumValueDefinitionNode): Array<Dynamic>;
}

@:native('GraphQL\\Utils\\BlockString')
@:noCompletion extern class BlockString {
  public static function value(rawString: Dynamic): Dynamic;
}

@:native('GraphQL\\Utils\\BreakingChangesFinder')
@:noCompletion extern class BreakingChangesFinder {
  @:phpClassConst static public final BREAKING_CHANGE_FIELD_CHANGED_KIND: Dynamic;
  @:phpClassConst static public final BREAKING_CHANGE_FIELD_REMOVED: Dynamic;
  @:phpClassConst static public final BREAKING_CHANGE_TYPE_CHANGED_KIND: Dynamic;
  @:phpClassConst static public final BREAKING_CHANGE_TYPE_REMOVED: Dynamic;
  @:phpClassConst static public final BREAKING_CHANGE_TYPE_REMOVED_FROM_UNION: Dynamic;
  @:phpClassConst static public final BREAKING_CHANGE_VALUE_REMOVED_FROM_ENUM: Dynamic;
  @:phpClassConst static public final BREAKING_CHANGE_ARG_REMOVED: Dynamic;
  @:phpClassConst static public final BREAKING_CHANGE_ARG_CHANGED_KIND: Dynamic;
  @:phpClassConst static public final BREAKING_CHANGE_NON_NULL_ARG_ADDED: Dynamic;
  @:phpClassConst static public final BREAKING_CHANGE_NON_NULL_INPUT_FIELD_ADDED: Dynamic;
  @:phpClassConst static public final BREAKING_CHANGE_INTERFACE_REMOVED_FROM_OBJECT: Dynamic;
  @:phpClassConst static public final BREAKING_CHANGE_DIRECTIVE_REMOVED: Dynamic;
  @:phpClassConst static public final BREAKING_CHANGE_DIRECTIVE_ARG_REMOVED: Dynamic;
  @:phpClassConst static public final BREAKING_CHANGE_DIRECTIVE_LOCATION_REMOVED: Dynamic;
  @:phpClassConst static public final BREAKING_CHANGE_NON_NULL_DIRECTIVE_ARG_ADDED: Dynamic;
  @:phpClassConst static public final DANGEROUS_CHANGE_ARG_DEFAULT_VALUE_CHANGED: Dynamic;
  @:phpClassConst static public final DANGEROUS_CHANGE_VALUE_ADDED_TO_ENUM: Dynamic;
  @:phpClassConst static public final DANGEROUS_CHANGE_INTERFACE_ADDED_TO_OBJECT: Dynamic;
  @:phpClassConst static public final DANGEROUS_CHANGE_TYPE_ADDED_TO_UNION: Dynamic;
  @:phpClassConst static public final DANGEROUS_CHANGE_NULLABLE_INPUT_FIELD_ADDED: Dynamic;
  @:phpClassConst static public final DANGEROUS_CHANGE_NULLABLE_ARG_ADDED: Dynamic;
  public static function findBreakingChanges(oldSchema: Schema,
    newSchema: Schema): Array<Array<String>>;
  public static function findRemovedTypes(oldSchema: Schema,
    newSchema: Schema): Array<Array<String>>;
  /*public static function findTypesThatChangedKind(schemaA: Schema,
    schemaB: Schema): Iterable; */
  public static function findFieldsThatChangedTypeOnObjectOrInterfaceTypes(oldSchema: Schema,
    newSchema: Schema): Array<Array<String>>;
  public static function findFieldsThatChangedTypeOnInputObjectTypes(oldSchema: Schema,
    newSchema: Schema): Array<Array<String>>;
  public static function findTypesRemovedFromUnions(oldSchema: Schema,
    newSchema: Schema): Array<Array<String>>;
  public static function findValuesRemovedFromEnums(oldSchema: Schema,
    newSchema: Schema): Array<Array<String>>;
  public static function findArgChanges(oldSchema: Schema,
    newSchema: Schema): Array<Array<String>>;
  public static function findInterfacesRemovedFromObjectTypes(oldSchema: Schema,
    newSchema: Schema): Array<Array<String>>;
  public static function findRemovedDirectives(oldSchema: Schema,
    newSchema: Schema): Array<Array<String>>;
  public static function findRemovedDirectiveArgs(oldSchema: Schema,
    newSchema: Schema): Dynamic;
  public static function findRemovedArgsForDirectives(oldDirective: Directive,
    newDirective: Directive): Dynamic;
  public static function findAddedNonNullDirectiveArgs(oldSchema: Schema,
    newSchema: Schema): Dynamic;
  public static function findAddedArgsForDirective(oldDirective: Directive,
    newDirective: Directive): Array<FieldArgument>;
  public static function findRemovedDirectiveLocations(oldSchema: Schema,
    newSchema: Schema): Array<Array<String>>;
  public static function findRemovedLocationsForDirective(oldDirective: Directive,
    newDirective: Directive): Dynamic;
  public static function findDangerousChanges(oldSchema: Schema,
    newSchema: Schema): Array<Array<String>>;
  public static function findValuesAddedToEnums(oldSchema: Schema,
    newSchema: Schema): Array<Array<String>>;
  public static function findInterfacesAddedToObjectTypes(oldSchema: Schema,
    newSchema: Schema): Array<Array<String>>;
  public static function findTypesAddedToUnions(oldSchema: Schema,
    newSchema: Schema): Array<Array<String>>;
}

@:native('GraphQL\\Utils\\BuildSchema')
@:noCompletion extern class BuildSchema {
  public function new(ast: DocumentNode, ?typeConfigDecorator: Dynamic,
    ?options: Array<Dynamic>): Void;
  public static function build(source: Dynamic, ?typeConfigDecorator: Dynamic,
    ?options: Array<Dynamic>): Schema;
  public static function buildAST(ast: DocumentNode,
    ?typeConfigDecorator: Dynamic, ?options: Array<Dynamic>): Schema;
  public function buildSchema(): Dynamic;
}

@:native('GraphQL\\Utils\\MixedStore')
@:noCompletion extern class MixedStore implements php.ArrayAccess<String, Dynamic> {
  public function new(): Void;
  public function offsetExists(offset: Dynamic): Bool;
  public function offsetGet(offset: Dynamic): Dynamic;
  public function offsetSet(offset: Dynamic, value: Dynamic): Void;
  public function offsetUnset(offset: Dynamic): Void;
}

@:native('GraphQL\\Utils\\PairSet')
@:noCompletion extern class PairSet {
  public function new(): Void;
  public function has(a: String, b: String, areMutuallyExclusive: Bool): Bool;
  public function add(a: String, b: String,
    areMutuallyExclusive: Bool): Dynamic;
}

@:native('GraphQL\\Utils\\SchemaExtender')
@:noCompletion extern class SchemaExtender {
  @:phpClassConst static public final SCHEMA_EXTENSION: Dynamic;
  private var extendTypeCache: Dynamic;
  private var typeExtensionsMap: Dynamic;
  private var astBuilder: Dynamic;
  private static function getExtensionASTNodes(type: NamedType): Array<Dynamic>;
  private static function checkExtensionNode(type: Type, node: Node): Void;
  private static function extendCustomScalarType(type: CustomScalarType): CustomScalarType;
  private static function extendUnionType(type: UnionType): UnionType;
  private static function extendEnumType(type: EnumType): EnumType;
  private static function extendInputObjectType(type: InputObjectType): InputObjectType;
  private static function extendInputFieldMap(type: InputObjectType): Array<Dynamic>;
  private static function extendValueMap(type: EnumType): Array<Dynamic>;
  private static function extendPossibleTypes(type: UnionType): Array<Dynamic>;
  private static function extendImplementedInterfaces(type: ObjectType): Array<Dynamic>;
  private static function extendType(typeDef: Dynamic): Dynamic;
  private static function extendArgs(args: Array<Dynamic>): Array<Dynamic>;
  private static function extendFieldMap(type: Dynamic): Array<Dynamic>;
  private static function extendObjectType(type: ObjectType): ObjectType;
  private static function extendInterfaceType(type: InterfaceType): InterfaceType;
  private static function isSpecifiedScalarType(type: Type): Bool;
  private static function extendNamedType(type: Type): Dynamic;
  private static function extendMaybeNamedType(?type: NamedType): Dynamic;
  private static function getMergedDirectives(schema: Schema,
    directiveDefinitions: Array<Dynamic>): Array<Dynamic>;
  private static function extendDirective(directive: Directive): Directive;
  public static function extend(schema: Schema, documentAST: DocumentNode,
    ?options: Array<Dynamic>): Schema;
}

@:native('GraphQL\\Utils\\SchemaPrinter')
@:noCompletion extern class SchemaPrinter {
  public static function doPrint(schema: Schema,
    ?options: Array<Dynamic>): String;
  public static function printType(type: Type,
    ?options: Array<Dynamic>): String;
  public static function printIntrospectionSchema(schema: Schema,
    ?options: Array<Dynamic>): String;
}

@:native('GraphQL\\Utils\\TypeComparators')
@:noCompletion extern class TypeComparators {
  public static function isEqualType(typeA: Type, typeB: Type): Bool;
  public static function isTypeSubTypeOf(schema: Schema,
    maybeSubType: AbstractType, superType: AbstractType): Bool;
  public static function doTypesOverlap(schema: Schema, typeA: CompositeType,
    typeB: CompositeType): Bool;
}

@:native('GraphQL\\Utils\\TypeInfo')
@:noCompletion extern class TypeInfo {
  public function new(schema: Schema, ?initialType: Dynamic): Void;
  public static function isEqualType(typeA: Type, typeB: Type): Dynamic;
  public static function isTypeSubTypeOf(schema: Schema, maybeSubType: Type,
    superType: Type): Dynamic;
  public static function doTypesOverlap(schema: Schema, typeA: CompositeType,
    typeB: CompositeType): Dynamic;
  public static function extractTypes(type: Dynamic,
    ?typeMap: Array<Dynamic>): Dynamic;
  public static function extractTypesFromDirectives(directive: Directive,
    ?typeMap: Array<Dynamic>): Array<Type>;
  public function getParentInputType(): Dynamic;
  public function getArgument(): Dynamic;
  public function getEnumValue(): Dynamic;
  public function enter(node: Node): Dynamic;
  public function getType(): Type;
  public function getParentType(): Type;
  public static function typeFromAST(schema: Schema,
    inputTypeNode: Dynamic): Dynamic;
  public function getDirective(): Dynamic;
  public function getFieldDef(): FieldDefinition;
  public function getInputType(): InputType;
  public function leave(node: Node): Dynamic;
}

@:native('GraphQL\\Utils\\Utils')
@:noCompletion extern class Utils {
  public static function undefined(): Dynamic;
  public static function isInvalid(value: Dynamic): Bool;
  public static function assign(obj: Map<String, Dynamic>,
    vars: Array<Dynamic>, ?requiredKeys: Array<Dynamic>): Map<String, Dynamic>;
  public static function find(traversable: Dynamic,
    predicate: Dynamic): Dynamic;
  public static function filter(traversable: Dynamic,
    predicate: Dynamic): Array<Dynamic>;
  public static function map(traversable: Dynamic,
    fn: Dynamic): Array<Dynamic>;
  public static function mapKeyValue(traversable: Dynamic,
    fn: Dynamic): Array<Dynamic>;
  public static function keyMap(traversable: Dynamic,
    keyFn: Dynamic): Array<Dynamic>;
  public static function each(traversable: Dynamic, fn: Dynamic): Dynamic;
  public static function groupBy(traversable: Dynamic,
    keyFn: Dynamic): Array<Dynamic>;
  public static function keyValMap(traversable: Dynamic, keyFn: Dynamic,
    valFn: Dynamic): Array<Array<Dynamic>>;
  public static function every(traversable: Array<Dynamic>,
    predicate: Dynamic): Bool;
  public static function invariant(test: Bool, ?message: String): Dynamic;
  public static function getVariableType(var_: Dynamic): String;
  public static function printSafeJson(var_: Dynamic): String;
  public static function printSafe(var_: Dynamic): String;
  public static function chr(ord: String, ?encoding: String): String;
  public static function ord(char: String, ?encoding: String): Dynamic;
  public static function charCodeAt(string: String, position: Int): Dynamic;
  public static function printCharCode(code: Dynamic): String;
  public static function assertValidName(name: String): Dynamic;
  public static function isValidNameError(name: String,
    ?node: Dynamic): Dynamic;
  public static function withErrorHandling(fn: Dynamic,
    errors: Array<Dynamic>): Dynamic;
  public static function quotedOrList(items: Array<Dynamic>): String;
  public static function orList(items: Array<Dynamic>): String;
  public static function suggestionList(input: String,
    options: Array<Dynamic>): Array<String>;
}

@:native('GraphQL\\Utils\\Value')
@:noCompletion extern class Value {
  public static function coerceValue(value: Dynamic, type: InputType,
    ?blameNode: Dynamic, ?path: Array<Dynamic>): Dynamic;
}

@:native('GraphQL\\Validator\\DocumentValidator')
@:noCompletion extern class DocumentValidator {
  public static function validate(schema: Schema, ast: DocumentNode,
    ?rules: Array<Dynamic>, ?typeInfo: TypeInfo): Array<php.Error>;
  public static function allRules(): Array<ValidationRule>;
  public static function defaultRules(): Dynamic;
  public static function securityRules(): Array<QuerySecurityRule>;
  public static function sdlRules(): Dynamic;
  public static function visitUsingRules(schema: Schema, typeInfo: TypeInfo,
    documentNode: DocumentNode, rules: Array<Dynamic>): Array<php.Error>;
  public static function getRule(name: String): ValidationRule;
  public static function addRule(rule: ValidationRule): Dynamic;
  public static function isError(value: Dynamic): Dynamic;
  public static function append(arr: Dynamic, items: Dynamic): Dynamic;
  public static function isValidLiteralValue(type: Type,
    valueNode: Dynamic): Array<php.Error>;
  public static function assertValidSDLExtension(documentAST: DocumentNode,
    schema: Schema): Dynamic;
}

@:native('GraphQL\\Validator\\ValidationContext')
@:noCompletion extern class ValidationContext {
  public function new(schema: Schema, ast: DocumentNode,
    typeInfo: TypeInfo): Void;
  public function reportError(error: php.Error): Dynamic;
  public function getErrors(): Array<php.Error>;
  public function getSchema(): Schema;
  public function getRecursiveVariableUsages(operation: OperationDefinitionNode): Array<Array<Dynamic>>;
  public function getRecursivelyReferencedFragments(operation: OperationDefinitionNode): Array<FragmentDefinitionNode>;
  public function getFragmentSpreads(node: HasSelectionSet): Array<FragmentSpreadNode>;
  public function getFragment(name: String): Dynamic;
  public function getDocument(): DocumentNode;
  public function getType(): Type;
  public function getParentType(): Type;
  public function getInputType(): InputType;
  public function getParentInputType(): InputType;
  public function getFieldDef(): FieldDefinition;
  public function getDirective(): Dynamic;
  public function getArgument(): Dynamic;
}

@:native('GraphQL\\Validator\\Rules\\CustomValidationRule')
@:noCompletion extern class CustomValidationRule extends ValidationRule {
  public function new(name: Dynamic, visitorFn: Dynamic): Void;
  public function getVisitor(context: ValidationContext): Array<php.Error>;
}

@:native('GraphQL\\Validator\\Rules\\DisableIntrospection')
@:noCompletion extern class DisableIntrospection extends QuerySecurityRule {
  @:phpClassConst static public final ENABLED: Dynamic;
  public function new(?enabled: Dynamic): Void;
  public function setEnabled(enabled: Dynamic): Dynamic;
  public function getVisitor(context: ValidationContext): Dynamic;
  public static function introspectionDisabledMessage(): Dynamic;
  private function isEnabled(): Dynamic;
}

@:native('GraphQL\\Validator\\Rules\\ExecutableDefinitions')
@:noCompletion extern class ExecutableDefinitions extends ValidationRule {
  public function getVisitor(context: ValidationContext): Dynamic;
  public static function nonExecutableDefinitionMessage(defName: Dynamic): Dynamic;
}

@:native('GraphQL\\Validator\\Rules\\FieldsOnCorrectType')
@:noCompletion extern class FieldsOnCorrectType extends ValidationRule {
  public function getVisitor(context: ValidationContext): Dynamic;
  public static function undefinedFieldMessage(fieldName: String,
    type: String, suggestedTypeNames: Array<Dynamic>,
    suggestedFieldNames: Array<Dynamic>): String;
}

@:native('GraphQL\\Validator\\Rules\\FragmentsOnCompositeTypes')
@:noCompletion extern class FragmentsOnCompositeTypes extends ValidationRule {
  public function getVisitor(context: ValidationContext): Dynamic;
  public static function inlineFragmentOnNonCompositeErrorMessage(type: Dynamic): Dynamic;
  public static function fragmentOnNonCompositeErrorMessage(fragName: Dynamic,
    type: Dynamic): Dynamic;
}

@:native('GraphQL\\Validator\\Rules\\KnownArgumentNames')
@:noCompletion extern class KnownArgumentNames extends ValidationRule {
  public function getVisitor(context: ValidationContext): Dynamic;
  public static function unknownArgMessage(argName: Dynamic,
    fieldName: Dynamic, typeName: Dynamic,
    suggestedArgs: Array<Dynamic>): Dynamic;
  public static function unknownDirectiveArgMessage(argName: Dynamic,
    directiveName: Dynamic, suggestedArgs: Array<Dynamic>): Dynamic;
}

@:native('GraphQL\\Validator\\Rules\\KnownArgumentNamesOnDirectives')
@:noCompletion extern class KnownArgumentNamesOnDirectives extends ValidationRule {
  private static function unknownDirectiveArgMessage(argName: String,
    directionName: String): Dynamic;
  public function getVisitor(context: ValidationContext): Dynamic;
}

@:native('GraphQL\\Validator\\Rules\\KnownDirectives')
@:noCompletion extern class KnownDirectives extends ValidationRule {
  public function getVisitor(context: ValidationContext): Dynamic;
  public static function unknownDirectiveMessage(directiveName: Dynamic): Dynamic;
  public static function misplacedDirectiveMessage(directiveName: Dynamic,
    location: Dynamic): Dynamic;
}

@:native('GraphQL\\Validator\\Rules\\KnownFragmentNames')
@:noCompletion extern class KnownFragmentNames extends ValidationRule {
  public function getVisitor(context: ValidationContext): Dynamic;
  public static function unknownFragmentMessage(fragName: String): Dynamic;
}

@:native('GraphQL\\Validator\\Rules\\KnownTypeNames')
@:noCompletion extern class KnownTypeNames extends ValidationRule {
  public function getVisitor(context: ValidationContext): Dynamic;
  public static function unknownTypeMessage(type: String,
    suggestedTypes: Array<Dynamic>): Dynamic;
}

@:native('GraphQL\\Validator\\Rules\\LoneAnonymousOperation')
@:noCompletion extern class LoneAnonymousOperation extends ValidationRule {
  public function getVisitor(context: ValidationContext): Dynamic;
  public static function anonOperationNotAloneMessage(): Dynamic;
}

@:native('GraphQL\\Validator\\Rules\\LoneSchemaDefinition')
@:noCompletion extern class LoneSchemaDefinition extends ValidationRule {
  public function getVisitor(context: ValidationContext): Dynamic;
}

@:native('GraphQL\\Validator\\Rules\\NoFragmentCycles')
@:noCompletion extern class NoFragmentCycles extends ValidationRule {
  public var visitedFrags: Dynamic;
  public var spreadPath: Dynamic;
  public var spreadPathIndexByName: Dynamic;
  public function getVisitor(context: ValidationContext): Dynamic;
  public static function cycleErrorMessage(fragName: Dynamic,
    ?spreadNames: Array<Dynamic>): Dynamic;
}

@:native('GraphQL\\Validator\\Rules\\NoUndefinedVariables')
@:noCompletion extern class NoUndefinedVariables extends ValidationRule {
  public function getVisitor(context: ValidationContext): Dynamic;
  public static function undefinedVarMessage(varName: Dynamic,
    ?opName: Dynamic): Dynamic;
}

@:native('GraphQL\\Validator\\Rules\\NoUnusedFragments')
@:noCompletion extern class NoUnusedFragments extends ValidationRule {
  public var operationDefs: Dynamic;
  public var fragmentDefs: Dynamic;
  public function getVisitor(context: ValidationContext): Dynamic;
  public static function unusedFragMessage(fragName: Dynamic): Dynamic;
}

@:native('GraphQL\\Validator\\Rules\\NoUnusedVariables')
@:noCompletion extern class NoUnusedVariables extends ValidationRule {
  public var variableDefs: Dynamic;
  public function getVisitor(context: ValidationContext): Dynamic;
  public static function unusedVariableMessage(varName: Dynamic,
    ?opName: Dynamic): Dynamic;
}

@:native('GraphQL\\Validator\\Rules\\OverlappingFieldsCanBeMerged')
@:noCompletion extern class OverlappingFieldsCanBeMerged extends ValidationRule {
  public function getVisitor(context: ValidationContext): Dynamic;
  public static function fieldsConflictMessage(responseName: String,
    reason: String): Dynamic;
  public static function reasonMessage(reason: Dynamic): Dynamic;
}

@:native('GraphQL\\Validator\\Rules\\PossibleFragmentSpreads')
@:noCompletion extern class PossibleFragmentSpreads extends ValidationRule {
  public function getVisitor(context: ValidationContext): Dynamic;
  public static function typeIncompatibleAnonSpreadMessage(parentType: Dynamic,
    fragType: Dynamic): Dynamic;
  public static function typeIncompatibleSpreadMessage(fragName: Dynamic,
    parentType: Dynamic, fragType: Dynamic): Dynamic;
}

@:native('GraphQL\\Validator\\Rules\\ProvidedNonNullArguments')
@:noCompletion extern class ProvidedNonNullArguments extends ValidationRule {
  public function getVisitor(context: ValidationContext): Dynamic;
  public static function missingFieldArgMessage(fieldName: Dynamic,
    argName: Dynamic, type: Dynamic): Dynamic;
  public static function missingDirectiveArgMessage(directiveName: Dynamic,
    argName: Dynamic, type: Dynamic): Dynamic;
}

@:native('GraphQL\\Validator\\Rules\\ProvidedRequiredArgumentsOnDirectives')
@:noCompletion extern class ProvidedRequiredArgumentsOnDirectives extends ValidationRule {
  private static function missingDirectiveArgMessage(directiveName: String,
    argName: String): Dynamic;
  public function getVisitor(context: ValidationContext): Dynamic;
}

@:native('GraphQL\\Validator\\Rules\\QueryComplexity')
@:noCompletion extern class QueryComplexity extends QuerySecurityRule {
  public function new(maxQueryComplexity: Dynamic): Void;
  public function getVisitor(context: ValidationContext): Dynamic;
  public function getRawVariableValues(): Dynamic;
  public function setRawVariableValues(?rawVariableValues: Array<Dynamic>): Dynamic;
  public function getQueryComplexity(): Dynamic;
  public function getMaxQueryComplexity(): Dynamic;
  public function setMaxQueryComplexity(maxQueryComplexity: Dynamic): Dynamic;
  public static function maxQueryComplexityErrorMessage(max: Dynamic,
    count: Dynamic): Dynamic;
  private function isEnabled(): Dynamic;
}

@:native('GraphQL\\Validator\\Rules\\QueryDepth')
@:noCompletion extern class QueryDepth extends QuerySecurityRule {
  public function new(maxQueryDepth: Dynamic): Void;
  public function getVisitor(context: ValidationContext): Dynamic;
  public function getMaxQueryDepth(): Dynamic;
  public function setMaxQueryDepth(maxQueryDepth: Dynamic): Dynamic;
  public static function maxQueryDepthErrorMessage(max: Dynamic,
    count: Dynamic): Dynamic;
  private function isEnabled(): Dynamic;
}

@:native('GraphQL\\Validator\\Rules\\QuerySecurityRule')
@:noCompletion extern class QuerySecurityRule extends ValidationRule {
  @:phpClassConst static public final DISABLED: Dynamic;
  private function checkIfGreaterOrEqualToZero(name: String,
    value: Int): Dynamic;
  private function getFragment(fragmentSpread: FragmentSpreadNode): Dynamic;
  private function getFragments(): Array<FragmentDefinitionNode>;
  private function invokeIfNeeded(context: ValidationContext,
    validators: Array<Dynamic>): Array<Dynamic>;
  private function isEnabled(): Dynamic;
  private function gatherFragmentDefinition(context: ValidationContext): Dynamic;
  private function collectFieldASTsAndDefs(context: ValidationContext,
    parentType: Dynamic, selectionSet: SelectionSetNode,
    ?visitedFragmentNames: NativeArray, ?astAndDefs: NativeArray): NativeArray;
  private function getFieldName(node: FieldNode): Dynamic;
}

@:native('GraphQL\\Validator\\Rules\\ScalarLeafs')
@:noCompletion extern class ScalarLeafs extends ValidationRule {
  public function getVisitor(context: ValidationContext): Dynamic;
  public static function noSubselectionAllowedMessage(field: Dynamic,
    type: Dynamic): Dynamic;
  public static function requiredSubselectionMessage(field: Dynamic,
    type: Dynamic): Dynamic;
}

@:native('GraphQL\\Validator\\Rules\\UniqueArgumentNames')
@:noCompletion extern class UniqueArgumentNames extends ValidationRule {
  public var knownArgNames: Dynamic;
  public function getVisitor(context: ValidationContext): Dynamic;
  public static function duplicateArgMessage(argName: Dynamic): Dynamic;
}

@:native('GraphQL\\Validator\\Rules\\UniqueDirectivesPerLocation')
@:noCompletion extern class UniqueDirectivesPerLocation extends ValidationRule {
  public function getVisitor(context: ValidationContext): Dynamic;
  public static function duplicateDirectiveMessage(directiveName: Dynamic): Dynamic;
}

@:native('GraphQL\\Validator\\Rules\\UniqueFragmentNames')
@:noCompletion extern class UniqueFragmentNames extends ValidationRule {
  public var knownFragmentNames: Dynamic;
  public function getVisitor(context: ValidationContext): Dynamic;
  public static function duplicateFragmentNameMessage(fragName: Dynamic): Dynamic;
}

@:native('GraphQL\\Validator\\Rules\\UniqueInputFieldNames')
@:noCompletion extern class UniqueInputFieldNames extends ValidationRule {
  public var knownNames: Dynamic;
  public var knownNameStack: Dynamic;
  public function getVisitor(context: ValidationContext): Dynamic;
  public static function duplicateInputFieldMessage(fieldName: Dynamic): Dynamic;
}

@:native('GraphQL\\Validator\\Rules\\UniqueOperationNames')
@:noCompletion extern class UniqueOperationNames extends ValidationRule {
  public var knownOperationNames: Dynamic;
  public function getVisitor(context: ValidationContext): Dynamic;
  public static function duplicateOperationNameMessage(operationName: Dynamic): Dynamic;
}

@:native('GraphQL\\Validator\\Rules\\UniqueVariableNames')
@:noCompletion extern class UniqueVariableNames extends ValidationRule {
  public var knownVariableNames: Dynamic;
  public function getVisitor(context: ValidationContext): Dynamic;
  public static function duplicateVariableMessage(variableName: Dynamic): Dynamic;
}

@:native('GraphQL\\Validator\\Rules\\ValidationRule')
@:noCompletion extern class ValidationRule {
  private var name: Dynamic;
  public function getName(): Dynamic;
  public function __invoke(context: ValidationContext): Dynamic;
  public function getVisitor(context: ValidationContext): Array<Dynamic>;
}

@:native('GraphQL\\Validator\\Rules\\ValuesOfCorrectType')
@:noCompletion extern class ValuesOfCorrectType extends ValidationRule {
  public function getVisitor(context: ValidationContext): Dynamic;
  public static function badValueMessage(typeName: Dynamic,
    valueName: Dynamic, ?message: Dynamic): Dynamic;
  public static function badArgumentValueMessage(typeName: Dynamic,
    valueName: Dynamic, fieldName: Dynamic, argName: Dynamic,
    ?message: Dynamic): Dynamic;
  public static function requiredFieldMessage(typeName: Dynamic,
    fieldName: Dynamic, fieldTypeName: Dynamic): Dynamic;
  public static function unknownFieldMessage(typeName: Dynamic,
    fieldName: Dynamic, ?message: Dynamic): Dynamic;
}

@:native('GraphQL\\Validator\\Rules\\VariablesAreInputTypes')
@:noCompletion extern class VariablesAreInputTypes extends ValidationRule {
  public function getVisitor(context: ValidationContext): Dynamic;
  public static function nonInputTypeOnVarMessage(variableName: Dynamic,
    typeName: Dynamic): Dynamic;
}

@:native('GraphQL\\Validator\\Rules\\VariablesDefaultValueAllowed')
@:noCompletion extern class VariablesDefaultValueAllowed extends ValidationRule {
  public function getVisitor(context: ValidationContext): Dynamic;
  public static function defaultForRequiredVarMessage(varName: Dynamic,
    type: Dynamic, guessType: Dynamic): Dynamic;
}

@:native('GraphQL\\Validator\\Rules\\VariablesInAllowedPosition')
@:noCompletion extern class VariablesInAllowedPosition extends ValidationRule {
  public var varDefMap: Dynamic;
  public function getVisitor(context: ValidationContext): Dynamic;
  public static function badVarPosMessage(varName: Dynamic, varType: Dynamic,
    expectedType: Dynamic): Dynamic;
}
