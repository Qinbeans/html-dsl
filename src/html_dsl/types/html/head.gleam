import html_dsl/utils/check.{illegal_string_check}
import html_dsl/types/attribute.{type Attribute, attribute_to_string}

/// Head is a type that represents the head of an HTML document
pub opaque type Head {
  Head(String)
  Nil
}

/// Starts a head context
/// - `@returns`: A Head
pub fn head() -> Head {
  Nil
}

/// This function converts a Head to a string
///  - `@param` head: The head to convert
///  - `@returns`: A string
pub fn head_to_string(head: Head) -> String {
  case head {
    Head(s) -> s
    Nil -> ""
  }
}

/// This creates a string that represents a script element
///  - `@param` src: The source of the script
///  - `@returns`: A Head
pub fn script(root: Head, src: String) -> Head {
  let src = illegal_string_check(src)
  Head(head_to_string(root) <> "<script src=\"" <> src <> "\"></script>")
}

/// This creates a string that represents a link element
///  - `@param` rel: The relationship of the link
///  - `@param` href: The href of the link
///  - `@param` attributes: The attributes of the link
///  - `@returns`: A Head
pub fn link(
  root: Head,
  rel: String,
  href: String,
  attributes: Attribute,
) -> Head {
  let att_str = attribute_to_string(attributes)
  let rel = illegal_string_check(rel)
  let href = illegal_string_check(href)
  Head(
    head_to_string(root)
    <> "<link rel=\""
    <> rel
    <> "\" href=\""
    <> href
    <> "\""
    <> att_str
    <> ">",
  )
}

/// This creates a string that represents a special link element for stylesheets
///  - `@param` src: The source of the stylesheet
///  - `@returns`: A Head
pub fn style(root: Head, src: String) -> Head {
  let src = illegal_string_check(src)
  Head(
    head_to_string(root) <> "<link rel=\"stylesheet\" href=\"" <> src <> "\">",
  )
}

/// This creates a string that represents a meta element
///  - `@param` name: The name of the meta
///  - `@param` content: The content of the meta
///  - `@returns`: A Head
pub fn meta(root: Head, name: String, content: String) -> Head {
  let name = illegal_string_check(name)
  Head(
    head_to_string(root)
    <> "<meta name=\""
    <> name
    <> "\" content=\""
    <> content
    <> "\">",
  )
}

/// This creates a string that represents a meta charset
///  - `@param` charset: the intended charset
///  - `@return`: A Head
pub fn charset(root: Head, set: String) -> Head {
  let set = illegal_string_check(set)
  Head(head_to_string(root) <> "<meta charset=\"" <> set <> "\">")
}

/// This creates a string that represents a title element
///  - `@param` content: The content of the title
///  - `@returns`: A Head
pub fn title(root: Head, content: String) -> Head {
  let content = illegal_string_check(content)
  Head(head_to_string(root) <> "<title>" <> content <> "</title>")
}
