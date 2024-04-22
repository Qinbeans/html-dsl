import gleam/io
import gleam/option.{type Option}
import html_dsl/types/attribute.{type Attribute, attribute_to_string}
import html_dsl/types/html/body.{type Body, body_to_string}
import html_dsl/types/html/head.{type Head}
import html_dsl/utils/check.{illegal_string_check}

/// Exists to prevent strings from being passed to engines
///
/// Engines should require `Html` or `Component`
pub opaque type Html {
  Html(String)
  Component(String)
  Nil
}

/// Check Html enum
///  - `@param` html: The Html enum
///  - `@returns`: True if the Html enum is Html, False if it is Component
pub fn is_html(html: Html) -> Bool {
  case html {
    Html(_) -> True
    _ -> False
  }
}

/// Converts Html enum to a string
pub fn html_to_string(html: Html) -> String {
  case html {
    Html(content) -> content
    Component(content) -> content
    Nil -> ""
  }
}

/// This creates a string that represents a div element
///  - `@param` attributes: The attributes of the element
///  - `@param` inner: The child of the element
///  - `@returns`: A string that represents the HTML element
pub fn div(
  attributes attributes: Option(Attribute),
  inner inner: String,
) -> String {
  // I'm too lazy, so I'm going to add id to the attributes list
  let att_str = attribute_to_string(attributes)
  "<div" <> att_str <> ">" <> inner <> "</div>"
}

/// This creates a string that represents an image element
///  - `@param` src: The source of the image
///  - `@param` alt: The alt text of the image
///  - `@param` attributes: The attributes of the element
///  - `@returns`: A string that represents the HTML element
pub fn img(
  src src: String,
  alt alt: String,
  attributes attributes: Option(Attribute),
) -> String {
  let att_str = attribute_to_string(attributes)
  let src = illegal_string_check(src)
  let alt = illegal_string_check(alt)
  "<img src=\"" <> src <> "\" alt=\"" <> alt <> "\"" <> att_str <> "/>"
}

/// This creates a string that represents an anchor element
///  - `@param` href: The href of the anchor
///  - `@param` attributes: The attributes of the element
///  - `@param` inner: The child of the element
///  - `@returns`: A string that represents the HTML element
pub fn a(
  href href: String,
  attributes attributes: Option(Attribute),
  inner inner: String,
) -> String {
  let att_str = attribute_to_string(attributes)
  let href = illegal_string_check(href)
  "<a href=\"" <> href <> "\"" <> att_str <> ">" <> inner <> "</a>"
}

/// This creates a string that represents an h1 element
///  - `@param` attributes: The attributes of the element
///  - `@param` inner: The child of the element
///  - `@returns`: A string that represents the HTML element
pub fn h1(
  attributes attributes: Option(Attribute),
  inner inner: String,
) -> String {
  let att_str = attribute_to_string(attributes)
  "<h1" <> att_str <> ">" <> inner <> "</h1>"
}

/// This creates a string that represents an h2 element
/// - `@param` attributes: The attributes of the element
/// - `@param` inner: The child of the element
/// - `@returns`: A string that represents the HTML element
pub fn h2(
  attributes attributes: Option(Attribute),
  inner inner: String,
) -> String {
  let att_str = attribute_to_string(attributes)
  "<h2" <> att_str <> ">" <> inner <> "</h2>"
}

/// This creates a string that represents an h3 element
/// - `@param` attributes: The attributes of the element
/// - `@param` inner: The child of the element
/// - `@returns`: A string that represents the HTML element
pub fn h3(
  attributes attributes: Option(Attribute),
  inner inner: String,
) -> String {
  let att_str = attribute_to_string(attributes)
  "<h3" <> att_str <> ">" <> inner <> "</h3>"
}

/// This creates a string that represents an h4 element
/// - `@param` attributes: The attributes of the element
/// - `@param` inner: The child of the element
/// - `@returns`: A string that represents the HTML element
pub fn h4(
  attributes attributes: Option(Attribute),
  inner inner: String,
) -> String {
  let att_str = attribute_to_string(attributes)
  "<h4" <> att_str <> ">" <> inner <> "</h4>"
}

/// This creates a string that represents an h5 element
/// - `@param` attributes: The attributes of the element
/// - `@param` inner: The child of the element
/// - `@returns`: A string that represents the HTML element
pub fn h5(
  attributes attributes: Option(Attribute),
  inner inner: String,
) -> String {
  let att_str = attribute_to_string(attributes)
  "<h5" <> att_str <> ">" <> inner <> "</h5>"
}

/// This creates a string that represents an h6 element
/// - `@param` attributes: The attributes of the element
/// - `@param` inner: The child of the element
/// - `@returns`: A string that represents the HTML element
pub fn h6(
  attributes attributes: Option(Attribute),
  inner inner: String,
) -> String {
  let att_str = attribute_to_string(attributes)
  "<h6" <> att_str <> ">" <> inner <> "</h6>"
}

/// This creates a string that represents a paragraph element
///  - `@param` attributes: The attributes of the element
///  - `@param` inner: The child of the element
///  - `@returns`: A string that represents the HTML element
pub fn p(
  attributes attributes: Option(Attribute),
  inner inner: String,
) -> String {
  let att_str = attribute_to_string(attributes)
  "<p" <> att_str <> ">" <> inner <> "</p>"
}

/// This creates a string that represents a span element
///  - `@param` attributes: The attributes of the element
///  - `@param` inner: The child of the element
///  - `@returns`: A string that represents the HTML element
pub fn span(
  attributes attributes: Option(Attribute),
  inner inner: String,
) -> String {
  let att_str = attribute_to_string(attributes)
  "<span" <> att_str <> ">" <> inner <> "</span>"
}

/// This creates a string that represents a break element
///  - `@returns`: A string that represents the HTML element
pub fn br() -> String {
  "<br>"
}

/// This creates a string that represents a horizontal rule element
///  - `@returns`: A string that represents the HTML element
pub fn hr() -> String {
  "<hr>"
}

/// This force resolves a `Result(Html, String)` to `Html`
///  - `@param` result: The result to resolve
///  - `@returns`: The resolved `Html`
pub fn force(result: Result(Html, String)) -> Html {
  case result {
    Ok(html) -> html
    Error(s) -> {
      io.print(s)
      Nil
    }
  }
}

/// This creates a string that represents an HTML document
///  - `@param` lang: The language of the document
///  - `@param` children: The children of the document
///  - `@returns`: A string that represents the HTML element
pub fn html(
  lang lang: String,
  head head: Head,
  body body: Body,
) -> Result(Html, String) {
  let lang = illegal_string_check(lang)
  case head.resolve(head) {
    Ok(head) -> {
      Ok(Html(
        "<!DOCTYPE html><html lang=\""
        <> lang
        <> "\">"
        <> case head {
          "" -> ""
          _ -> head
        }
        <> body_to_string(body)
        <> "</html>",
      ))
    }
    Error(s) -> {
      Error("Error: `Head` cannot resolve -> " <> s)
    }
  }
}

/// This creates a string that represents a component
///  - `@param` content: The content of the component
///  - `@returns`: A Component
pub fn component(content: String) -> Html {
  Component(content)
}

/// This creates a string that represents a header element
///  - `@param` attributes: The attributes of the element
///  - `@param` inner: The child of the element
///  - `@returns`: A string that represents the HTML element
pub fn header(
  attributes attributes: Option(Attribute),
  inner inner: String,
) -> String {
  let att_str = attribute_to_string(attributes)
  "<header" <> att_str <> ">" <> inner <> "</header>"
}

/// This creates a string that represents a footer element
///  - `@param` attributes: The attributes of the element
///  - `@param` inner: The child of the element
///  - `@returns`: A string that represents the HTML element
pub fn footer(
  attributes attributes: Option(Attribute),
  inner inner: String,
) -> String {
  let att_str = attribute_to_string(attributes)

  "<footer" <> att_str <> ">" <> inner <> "</footer>"
}

/// This creates a string that represents a nav element
///  - `@param` attributes: The attributes of the element
///  - `@param` inner: The child of the element
///  - `@returns`: A string that represents the HTML element
pub fn nav(
  attributes attributes: Option(Attribute),
  inner inner: String,
) -> String {
  let att_str = attribute_to_string(attributes)
  "<nav" <> att_str <> ">" <> inner <> "</nav>"
}

/// This creates a string that represents a section element
///  - `@param` attributes: The attributes of the element
///  - `@param` inner: The child of the element
///  - `@returns`: A string that represents the HTML element
pub fn section(
  attributes attributes: Option(Attribute),
  inner inner: String,
) -> String {
  let att_str = attribute_to_string(attributes)

  "<section" <> att_str <> ">" <> inner <> "</section>"
}

/// This creates a string that represents an article element
///  - `@param` attributes: The attributes of the element
///  - `@param` inner: The child of the element
///  - `@returns`: A string that represents the HTML element
pub fn article(
  attributes attributes: Option(Attribute),
  inner inner: String,
) -> String {
  let att_str = attribute_to_string(attributes)

  "<article" <> att_str <> ">" <> inner <> "</article>"
}

/// This creates a string that represents an aside element
///  - `@param` attributes: The attributes of the element
///  - `@param` inner: The child of the element
///  - `@returns`: A string that represents the HTML element
pub fn aside(
  attributes attributes: Option(Attribute),
  inner inner: String,
) -> String {
  let att_str = attribute_to_string(attributes)
  "<aside" <> att_str <> ">" <> inner <> "</aside>"
}

/// This creates a string that represents a main element
///  - `@param` attributes: The attributes of the element
///  - `@param` inner: The child of the element
///  - `@returns`: A string that represents the HTML element
pub fn main(
  attributes attributes: Option(Attribute),
  inner inner: String,
) -> String {
  let att_str = attribute_to_string(attributes)

  "<main" <> att_str <> ">" <> inner <> "</main>"
}

/// This creates a string that represents a button element
///  - `@param` attributes: The attributes of the element
///  - `@param` inner: The child of the element
///  - `@returns`: A string that represents the HTML element
pub fn button(
  attributes attributes: Option(Attribute),
  inner inner: String,
) -> String {
  let att_str = attribute_to_string(attributes)
  "<button" <> att_str <> ">" <> inner <> "</button>"
}
