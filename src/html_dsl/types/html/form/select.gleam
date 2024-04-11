import html_dsl/types/attribute.{type Attribute, attribute_to_string}
import html_dsl/utils/check.{illegal_string_check}
import gleam/option.{type Option}
import html_dsl/types/html/form.{type Input, element}

/// This is a type that represents an option element
pub opaque type Selection {
  Selection(String, Input)
}

/// This creates a string that represents a select element
///  - `@param` attributes: The attributes of the element
///  - `@param` options: The options of the select
///  - `@returns`: A string that represents the HTML element
pub fn select(
  input: Input,
  attributes attributes: Option(Attribute),
) -> Selection {
  let att_str = attribute_to_string(attributes)
  Selection("<select " <> att_str <> ">", input)
}

pub fn end(root: Selection) -> Input {
  case root {
    Selection(root, input) -> element(input, root)
  }
}

/// This creates a string that represents an option element
///  - `@param` root: The root of the option
///  - `@param` attributes: The attributes of the option
///  - `@param` value: The value of the option
///  - `@param` label: The label of the option
///  - `@returns`: An Option
pub fn add(
  root root: Selection,
  attributes attributes: Option(Attribute),
  value value: String,
  label label: String,
) -> Selection {
  let value = illegal_string_check(value)
  let label = illegal_string_check(label)
  let att_str = attribute_to_string(attributes)
  case root {
    Selection(root, input) ->
      Selection(
        root
          <> "<option"
          <> att_str
          <> " value=\""
          <> value
          <> "\" label=\""
          <> label
          <> "\">"
          <> "</option> ",
        input,
      )
  }
}
