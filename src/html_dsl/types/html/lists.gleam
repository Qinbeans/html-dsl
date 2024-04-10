import html_dsl/types/attribute.{type Attribute, attribute_to_string}
import html_dsl/utils/check.{illegal_string_check}

/// Exists to prevent strings from being passed to ul and ol
pub opaque type ListItem {
  ListItem(String)
  Nil
}

pub fn li_to_string(li: ListItem) -> String {
  case li {
    ListItem(str) -> str
    Nil -> ""
  }
}

pub fn li() -> ListItem {
  Nil
}

/// This creates a string that represents a list item element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` child: The child of the element
///  - `@returns`: A ListItem
pub fn add(
  root root: ListItem,
  id id: String,
  class class: String,
  attributes attributes: Attribute,
  inner inner: String,
) -> ListItem {
  let att_str =
    attribute_to_string(
      attributes
      |> attribute.add("id", id),
    )
  let class = illegal_string_check(class)
  ListItem(
    li_to_string(root)
    <> case class {
      "" -> "<li" <> att_str <> ">" <> inner <> "</li>"
      _ -> "<li class=\"" <> class <> "\"" <> att_str <> ">" <> inner <> "</li>"
    },
  )
}

/// This creates a string that represents an unordered list element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` children: a list of ListItems
///  - `@returns`: A string that represents the HTML element
pub fn ul(
  id id: String,
  class class: String,
  attributes attributes: Attribute,
  inner inner: ListItem,
) -> String {
  let att_str =
    attribute_to_string(
      attributes
      |> attribute.add("id", id),
    )
  let inner_str = li_to_string(inner)
  case class {
    "" -> "<ul" <> att_str <> ">" <> inner_str <> "</ul>"
    _ -> {
      let class = illegal_string_check(class)
      "<ul class=\"" <> class <> "\"" <> att_str <> ">" <> inner_str <> "</ul>"
    }
  }
}

/// This creates a string that represents an ordered list element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` children: a list of ListItems
///  - `@returns`: A string that represents the HTML element
pub fn ol(
  id id: String,
  class class: String,
  attributes attributes: Attribute,
  inner inner: ListItem,
) -> String {
  let att_str =
    attribute_to_string(
      attributes
      |> attribute.add("id", id),
    )
  let inner_str = li_to_string(inner)
  case class {
    "" -> "<ol" <> att_str <> ">" <> inner_str <> "</ol>"
    _ -> {
      let class = illegal_string_check(class)
      "<ol class=\"" <> class <> "\"" <> att_str <> ">" <> inner_str <> "</ol>"
    }
  }
}
