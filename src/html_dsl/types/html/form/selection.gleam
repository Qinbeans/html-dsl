import html_dsl/types/attribute.{type Attribute, attribute_to_string}
import html_dsl/utils/check.{illegal_string_check}

pub opaque type Option {
  Option(String)
  Nil
}

/// This creates a string that represents a select element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` options: The options of the select
///  - `@returns`: A string that represents the HTML element
pub fn select(
  id id: String,
  class class: String,
  attributes attributes: Attribute,
  options options: Option,
) -> String {
  let att_str =
    attribute_to_string(
      attributes
      |> attribute.add("id", id),
    )
  let opt_str = option_to_string(options)
  case class {
    "" -> "<select " <> att_str <> ">" <> opt_str <> "</select>"
    _ ->
      "<select class=\""
      <> class
      <> "\" "
      <> att_str
      <> ">"
      <> opt_str
      <> "</select>"
  }
}

pub fn option_to_string(option: Option) -> String {
  case option {
    Option(value) -> value
    Nil -> ""
  }
}

pub fn option() -> Option {
  Nil
}

/// This creates a string that represents an option element
///  - `@param` value: The value of the option
///  - `@param` children: The children of the option
///  - `@returns`: An Option
pub fn add(
  root root: Option,
  value value: String,
  inner inner: String,
) -> Option {
  let value = illegal_string_check(value)
  Option(
    option_to_string(root)
    <> "<option value=\""
    <> value
    <> "\">"
    <> inner
    <> "</option> ",
  )
}
