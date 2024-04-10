import html_dsl/utils/check.{illegal_string_check}

/// Similar to a pair, but uniquely named
pub opaque type Attribute {
  Attribute(String)
  Nil
}

/// This function is used to create a ListItem
/// - `@returns`: A ListItem
pub fn attribute() -> Attribute {
  Nil
}

/// This function is used to create a ListItem
/// - `@param` root: The root attribute
/// - `@param` key: The key of the attribute
/// - `@param` value: The value of the attribute
/// - `@returns`: A ListItem
pub fn add(root: Attribute, key: String, value: String) -> Attribute {
  let key = illegal_string_check(key)
  let value = illegal_string_check(value)
  case [key, value] {
    ["", ""] -> root
    ["", _] -> root
    [_, ""] -> root
    _ ->
      Attribute(
        attribute_to_string(root) <> " " <> key <> "=\"" <> value <> "\"",
      )
  }
}

/// This function is used to create a ListItem
///  - `@param` content: The content of the list item
///  - `@returns`: A ListItem
pub fn attribute_to_string(attribute: Attribute) -> String {
  case attribute {
    Attribute(value) -> value
    Nil -> ""
  }
}
