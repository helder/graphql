package graphql;

import graphql.impl.LanguageImpl;
import graphql.language.AST;

using tink.CoreApi;

class Language {
  // https://graphql.org/graphql-js/language/#parse
  inline public static function parse(source: String): DocumentNode
    return cast LanguageImpl.parse(source);
}
