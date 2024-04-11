import html_dsl/types/attribute.{type Attribute, attribute_to_string}
import gleam/option.{type Option}

/// Exists to prevent strings from being passed to ul and ol
pub opaque type List {
  UnorderedList(String)
  OrderedList(String)
}

/// This creates a string that represents a list element
///  - `@param` li: The list element
///  - `@returns`: A string that represents the HTML element
pub fn li_to_string(li: List) -> String {
  case li {
    UnorderedList(s) -> s
    OrderedList(s) -> s
  }
}

/// Closes the element
///  - `@param` li: The list element
///  - `@returns`: A string that represents the HTML element
pub fn end(li: List) -> String {
  case li {
    UnorderedList(s) -> s <> "</ul>"
    OrderedList(s) -> s <> "</ol>"
  }
}

/// This creates a string that represents a list item element
///  - `@param` root: The list element
///  - `@param` attributes: The attributes of the element
///  - `@param` inner: The inner content of the element
///  - `@returns`: A ListItem
pub fn add(
  root: List,
  attributes attributes: Option(Attribute),
  inner inner: String,
) -> List {
  let att_str = attribute_to_string(attributes)
  case root {
    UnorderedList(s) ->
      UnorderedList(s <> "<li" <> att_str <> ">" <> inner <> "</li>")
    OrderedList(s) ->
      OrderedList(s <> "<li" <> att_str <> ">" <> inner <> "</li>")
  }
}

/// This creates a string that represents an unordered list element
///  - `@param` attributes: The attributes of the element
///  - `@returns`: A string that represents the HTML element
pub fn ul(attributes attributes: Option(Attribute)) -> List {
  let att_str = attribute_to_string(attributes)
  UnorderedList("<ul" <> att_str <> ">")
}

/// This creates a string that represents an ordered list element
///  - `@param` attributes: The attributes of the element
///  - `@returns`: A string that represents the HTML element
pub fn ol(attributes attributes: Option(Attribute)) -> List {
  let att_str = attribute_to_string(attributes)
  OrderedList("<ol" <> att_str <> ">")
}
