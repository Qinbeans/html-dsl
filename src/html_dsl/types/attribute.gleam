import html_dsl/utils/check.{illegal_string_check}
import gleam/option.{type Option, None, Some}

/// Similar to a pair, but uniquely named
pub opaque type Attribute {
  Attribute(String)
  Nil
}

/// This function is used to create an attribute
/// - `@returns`: An Attribute
pub fn new() -> Option(Attribute) {
  Some(Nil)
}

/// Shortcut for creating a class attribute
/// - `@param` root: The root attribute
/// - `@param` classes: The classes to add
/// - `@returns`: An Attribute
pub fn class(root: Option(Attribute), classes: String) -> Option(Attribute) {
  add(root, "class", classes)
}

/// Shortcut for creating a id attribute
/// - `@param` root: The root attribute
/// - `@param` id: The id to add
/// - `@returns`: An Attribute
pub fn id(root: Option(Attribute), id: String) -> Option(Attribute) {
  add(root, "id", id)
}

/// Adds an attribute to an attribute
/// - `@param` root: The root attribute
/// - `@param` key: The key of the attribute
/// - `@param` value: The value of the attribute
/// - `@returns`: An Attribute
pub fn add(
  root: Option(Attribute),
  key: String,
  value: String,
) -> Option(Attribute) {
  let key = illegal_string_check(key)
  let value = illegal_string_check(value)
  case [key, value] {
    ["", ""] -> root
    ["", _] -> root
    [_, ""] -> root
    _ ->
      Some(Attribute(
        attribute_to_string(root) <> " " <> key <> "=\"" <> value <> "\"",
      ))
  }
}

/// This function is used to convert an attribute to a string
///  - `@param` attribute: The attribute to convert
///  - `@returns`: String
pub fn attribute_to_string(attribute: Option(Attribute)) -> String {
  case attribute {
    Some(attribute) ->
      case attribute {
        Attribute(value) -> value
        Nil -> ""
      }
    None -> ""
  }
}
