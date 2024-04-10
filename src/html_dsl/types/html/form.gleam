import html_dsl/types/attribute.{type Attribute, add, attribute_to_string}
import html_dsl/utils/check.{illegal_string_check}

/// An enum of all possible input types for an HTML input element.
pub type InputType {
  Button
  Checkbox
  Color
  Date
  DatetimeLocal
  Email
  File
  Hidden
  Image
  Month
  Number
  Password
  Radio
  Range
  Reset
  Search
  Submit
  Tel
  Text
  Time
  Url
  Week
}

/// Exists to prevent strings from being passed to forms
pub opaque type Input {
  Input(String)
  Nil
}

/// A function that converts an input type to the corresponding HTML attribute as a string.
///  - `@param` input_type: The input type to convert.
///  - `@return`: The corresponding HTML attribute as a string.
/// @example
/// ```gleam
/// let str = input_type_to_attribute(InputType.Text)
/// // str == "type=\"text\""
/// ```
pub fn input_type_to_attribute(input_type: InputType) -> String {
  "type=\""
  <> case input_type {
    Button -> "button"
    Checkbox -> "checkbox"
    Color -> "color"
    Date -> "date"
    DatetimeLocal -> "datetime-local"
    Email -> "email"
    File -> "file"
    Hidden -> "hidden"
    Image -> "image"
    Month -> "month"
    Number -> "number"
    Password -> "password"
    Radio -> "radio"
    Range -> "range"
    Reset -> "reset"
    Search -> "search"
    Submit -> "submit"
    Tel -> "tel"
    Text -> "text"
    Time -> "time"
    Url -> "url"
    Week -> "week"
  }
  <> "\""
}

pub fn input_to_string(input: Input) -> String {
  case input {
    Input(str) -> str
    Nil -> ""
  }
}

pub fn init() -> Input {
  Nil
}

/// Element is part of an opaque type, so it can't be accessed directly
///
/// This function is used to create an Element
///  - `@param` content: The content of the element
///  - `@returns`: An Element
pub fn element(root root: Input, content content: String) -> Input {
  Input(input_to_string(root) <> content)
}

/// This creates a string that represents an input element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` input_type: The type of the input
///  - `@param` placeholder: The placeholder of the input
///  - `@returns`: An Input
pub fn input(
  root root: Input,
  id id: String,
  class class: String,
  attributes attributes: Attribute,
  input_type input_type: InputType,
  placeholder placeholder: String,
) -> Input {
  let att_str =
    attribute_to_string(
      attributes
      |> add("id", id),
    )
  let placeholder = illegal_string_check(placeholder)
  Input(
    input_to_string(root)
    <> case class {
      "" ->
        "<input "
        <> input_type_to_attribute(input_type)
        <> " placeholder=\""
        <> placeholder
        <> "\""
        <> att_str
        <> "/>"
      _ -> {
        let class = illegal_string_check(class)
        "<input "
        <> input_type_to_attribute(input_type)
        <> " placeholder=\""
        <> placeholder
        <> "\" class=\""
        <> class
        <> "\""
        <> att_str
        <> "/>"
      }
    },
  )
}

/// This creates a string that represents a label element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` child: The child of the element
///  - `@returns`: An Input
pub fn label(
  root root: Input,
  id id: String,
  class class: String,
  attributes attributes: Attribute,
  innner inner: String,
) -> Input {
  let att_str =
    attribute_to_string(
      attributes
      |> add("id", id),
    )

  Input(
    input_to_string(root)
    <> case class {
      "" -> "<label" <> att_str <> ">" <> inner <> "</label>"
      _ -> {
        let class = illegal_string_check(class)
        "<label class=\""
        <> class
        <> "\""
        <> att_str
        <> ">"
        <> inner
        <> "</label>"
      }
    },
  )
}

/// This creates a string that represents a form element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` children: The children of the element
///  - `@returns`: A string that represents the HTML element
pub fn form(
  id id: String,
  class class: String,
  attributes attributes: Attribute,
  inner inner: Input,
) -> String {
  let att_str =
    attribute_to_string(
      attributes
      |> add("id", id),
    )

  case class {
    "" -> "<form" <> att_str <> ">" <> input_to_string(inner) <> "</form>"
    _ -> {
      let class = illegal_string_check(class)
      "<form class=\""
      <> class
      <> "\""
      <> att_str
      <> ">"
      <> input_to_string(inner)
      <> "</form>"
    }
  }
}
