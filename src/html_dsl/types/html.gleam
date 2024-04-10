import html_dsl/types/attribute.{type Attribute, add, attribute_to_string}
import html_dsl/types/html/head.{type Head, head_to_string}
import html_dsl/utils/check.{illegal_string_check}

/// Exists to prevent strings from being passed to engines
///
/// Engines should require `Html` or `Component`
pub opaque type Html {
  Html(String)
  Component(String)
}

/// Check Html enum
///  - `@param` html: The Html enum
///  - `@returns`: True if the Html enum is Html, False if it is Component
pub fn is_html(html: Html) -> Bool {
  case html {
    Html(_) -> True
    Component(_) -> False
  }
}

/// Converts Html enum to a string
pub fn html_to_string(html: Html) -> String {
  case html {
    Html(content) -> content
    Component(content) -> content
  }
}

/// This creates a string that represents a div element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` inner: The child of the element
///  - `@returns`: A string that represents the HTML element
pub fn div(
  id id: String,
  class class: String,
  attributes attributes: Attribute,
  inner inner: String,
) -> String {
  // I'm too lazy, so I'm going to add id to the attributes list
  let att_str =
    attribute_to_string(
      attributes
      |> add("id", id),
    )
  case class {
    "" -> "<div" <> att_str <> ">" <> inner <> "</div>"
    _ -> {
      let class = illegal_string_check(class)
      "<div class=\"" <> class <> "\"" <> att_str <> ">" <> inner <> "</div>"
    }
  }
}

/// This creates a string that represents an image element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` src: The source of the image
///  - `@param` alt: The alt text of the image
///  - `@param` attributes: The attributes of the element
///  - `@returns`: A string that represents the HTML element
pub fn img(
  id id: String,
  class class: String,
  src src: String,
  alt alt: String,
  attributes attributes: Attribute,
) -> String {
  let att_str =
    attribute_to_string(
      attributes
      |> add("id", id),
    )
  let src = illegal_string_check(src)
  let alt = illegal_string_check(alt)
  case class {
    "" -> "<img src=\"" <> src <> "\" alt=\"" <> alt <> "\"" <> att_str <> "/>"
    _ -> {
      let class = illegal_string_check(class)
      "<img src=\""
      <> src
      <> "\" alt=\""
      <> alt
      <> "\" class=\""
      <> class
      <> "\""
      <> att_str
      <> "/>"
    }
  }
}

/// This creates a string that represents an anchor element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` href: The href of the anchor
///  - `@param` attributes: The attributes of the element
///  - `@param` inner: The child of the element
///  - `@returns`: A string that represents the HTML element
pub fn a(
  id id: String,
  class class: String,
  href href: String,
  attributes attributes: Attribute,
  inner inner: String,
) -> String {
  let att_str =
    attribute_to_string(
      attributes
      |> add("id", id),
    )
  let href = illegal_string_check(href)
  case class {
    "" -> "<a href=\"" <> href <> "\"" <> att_str <> ">" <> inner <> "</a>"
    _ -> {
      let class = illegal_string_check(class)
      "<a href=\""
      <> href
      <> "\" class=\""
      <> class
      <> "\""
      <> att_str
      <> ">"
      <> inner
      <> "</a>"
    }
  }
}

/// This creates a string that represents an h1 element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` inner: The child of the element
///  - `@returns`: A string that represents the HTML element
pub fn h1(
  id id: String,
  class class: String,
  attributes attributes: Attribute,
  inner inner: String,
) -> String {
  let att_str =
    attribute_to_string(
      attributes
      |> add("id", id),
    )
  case class {
    "" -> "<h1" <> att_str <> ">" <> inner <> "</h1>"
    _ -> {
      let class = illegal_string_check(class)
      "<h1 class=\"" <> class <> "\"" <> att_str <> ">" <> inner <> "</h1>"
    }
  }
}

/// This creates a string that represents an h2 element
/// - `@param` id: The id of the element
/// - `@param` class: The class of the element
/// - `@param` attributes: The attributes of the element
/// - `@param` inner: The child of the element
/// - `@returns`: A string that represents the HTML element
pub fn h2(
  id id: String,
  class class: String,
  attributes attributes: Attribute,
  inner inner: String,
) -> String {
  let att_str =
    attribute_to_string(
      attributes
      |> add("id", id),
    )
  case class {
    "" -> "<h2" <> att_str <> ">" <> inner <> "</h2>"
    _ -> {
      let class = illegal_string_check(class)
      "<h2 class=\"" <> class <> "\"" <> att_str <> ">" <> inner <> "</h2>"
    }
  }
}

/// This creates a string that represents an h3 element
/// - `@param` id: The id of the element
/// - `@param` class: The class of the element
/// - `@param` attributes: The attributes of the element
/// - `@param` inner: The child of the element
/// - `@returns`: A string that represents the HTML element
pub fn h3(
  id id: String,
  class class: String,
  attributes attributes: Attribute,
  inner inner: String,
) -> String {
  let att_str =
    attribute_to_string(
      attributes
      |> add("id", id),
    )
  case class {
    "" -> "<h3" <> att_str <> ">" <> inner <> "</h3>"
    _ -> {
      let class = illegal_string_check(class)
      "<h3 class=\"" <> class <> "\"" <> att_str <> ">" <> inner <> "</h3>"
    }
  }
}

/// This creates a string that represents an h4 element
/// - `@param` id: The id of the element
/// - `@param` class: The class of the element
/// - `@param` attributes: The attributes of the element
/// - `@param` inner: The child of the element
/// - `@returns`: A string that represents the HTML element
pub fn h4(
  id id: String,
  class class: String,
  attributes attributes: Attribute,
  inner inner: String,
) -> String {
  let att_str =
    attribute_to_string(
      attributes
      |> add("id", id),
    )
  case class {
    "" -> "<h4" <> att_str <> ">" <> inner <> "</h4>"
    _ -> {
      let class = illegal_string_check(class)
      "<h4 class=\"" <> class <> "\"" <> att_str <> ">" <> inner <> "</h4>"
    }
  }
}

/// This creates a string that represents an h5 element
/// - `@param` id: The id of the element
/// - `@param` class: The class of the element
/// - `@param` attributes: The attributes of the element
/// - `@param` inner: The child of the element
/// - `@returns`: A string that represents the HTML element
pub fn h5(
  id id: String,
  class class: String,
  attributes attributes: Attribute,
  inner inner: String,
) -> String {
  let att_str =
    attribute_to_string(
      attributes
      |> add("id", id),
    )
  case class {
    "" -> "<h5" <> att_str <> ">" <> inner <> "</h5>"
    _ -> {
      let class = illegal_string_check(class)
      "<h5 class=\"" <> class <> "\"" <> att_str <> ">" <> inner <> "</h5>"
    }
  }
}

/// This creates a string that represents an h6 element
/// - `@param` id: The id of the element
/// - `@param` class: The class of the element
/// - `@param` attributes: The attributes of the element
/// - `@param` inner: The child of the element
/// - `@returns`: A string that represents the HTML element
pub fn h6(
  id id: String,
  class class: String,
  attributes attributes: Attribute,
  inner inner: String,
) -> String {
  let att_str =
    attribute_to_string(
      attributes
      |> add("id", id),
    )
  case class {
    "" -> "<h6" <> att_str <> ">" <> inner <> "</h6>"
    _ -> {
      let class = illegal_string_check(class)
      "<h6 class=\"" <> class <> "\"" <> att_str <> ">" <> inner <> "</h6>"
    }
  }
}

/// This creates a string that represents a paragraph element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` child: The child of the element
///  - `@returns`: A string that represents the HTML element
pub fn p(
  id id: String,
  class class: String,
  attributes attributes: Attribute,
  inner inner: String,
) -> String {
  let att_str =
    attribute_to_string(
      attributes
      |> add("id", id),
    )
  case class {
    "" -> "<p" <> att_str <> ">" <> inner <> "</p>"
    _ -> {
      let class = illegal_string_check(class)
      "<p class=\"" <> class <> "\"" <> att_str <> ">" <> inner <> "</p>"
    }
  }
}

/// This creates a string that represents a span element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` child: The child of the element
///  - `@returns`: A string that represents the HTML element
pub fn span(
  id id: String,
  class class: String,
  attributes attributes: Attribute,
  inner inner: String,
) -> String {
  let att_str =
    attribute_to_string(
      attributes
      |> add("id", id),
    )
  case class {
    "" -> "<span" <> att_str <> ">" <> inner <> "</span>"
    _ -> {
      let class = illegal_string_check(class)
      "<span class=\"" <> class <> "\"" <> att_str <> ">" <> inner <> "</span>"
    }
  }
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

/// This creates a string that represents the body of an HTML document
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` children: The children of the element
///  - `@returns`: A string that represents the HTML element
pub fn body(
  id id: String,
  class class: String,
  attributes attributes: Attribute,
  inner inner: String,
) -> String {
  let att_str =
    attribute_to_string(
      attributes
      |> add("id", id),
    )

  case class {
    "" -> "<body" <> att_str <> ">" <> inner <> "</body>"
    _ -> {
      let class = illegal_string_check(class)
      "<body class=\"" <> class <> "\"" <> att_str <> ">" <> inner <> "</body>"
    }
  }
}

/// This creates a string that represents an HTML document
///  - `@param` lang: The language of the document
///  - `@param` children: The children of the document
///  - `@returns`: A string that represents the HTML element
pub fn html(lang lang: String, head head: Head, body body: String) -> Html {
  let lang = illegal_string_check(lang)
  let head = head_to_string(head)
  Html(
    "<!DOCTYPE html><html lang=\""
    <> lang
    <> "\">"
    <> case head {
      "" -> ""
      _ -> "<head>" <> head <> "</head>"
    }
    <> body
    <> "</html>",
  )
}

/// This creates a string that represents a component
///  - `@param` content: The content of the component
///  - `@returns`: A Component
pub fn component(content: String) -> Html {
  Component(content)
}

/// This creates a string that represents a header element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` children: The children of the element
///  - `@returns`: A string that represents the HTML element
pub fn header(
  id id: String,
  class class: String,
  attributes attributes: Attribute,
  inner inner: String,
) -> String {
  let att_str =
    attribute_to_string(
      attributes
      |> add("id", id),
    )

  case class {
    "" -> "<header" <> att_str <> ">" <> inner <> "</header>"
    _ -> {
      let class = illegal_string_check(class)
      "<header class=\""
      <> class
      <> "\""
      <> att_str
      <> ">"
      <> inner
      <> "</header>"
    }
  }
}

/// This creates a string that represents a footer element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` children: The children of the element
///  - `@returns`: A string that represents the HTML element
pub fn footer(
  id id: String,
  class class: String,
  attributes attributes: Attribute,
  inner inner: String,
) -> String {
  let att_str =
    attribute_to_string(
      attributes
      |> add("id", id),
    )

  case class {
    "" -> "<footer" <> att_str <> ">" <> inner <> "</footer>"
    _ -> {
      let class = illegal_string_check(class)
      "<footer class=\""
      <> class
      <> "\""
      <> att_str
      <> ">"
      <> inner
      <> "</footer>"
    }
  }
}

/// This creates a string that represents a nav element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` children: The children of the element
///  - `@returns`: A string that represents the HTML element
pub fn nav(
  id id: String,
  class class: String,
  attributes attributes: Attribute,
  inner inner: String,
) -> String {
  let att_str =
    attribute_to_string(
      attributes
      |> add("id", id),
    )

  case class {
    "" -> "<nav" <> att_str <> ">" <> inner <> "</nav>"
    _ -> {
      let class = illegal_string_check(class)
      "<nav class=\"" <> class <> "\"" <> att_str <> ">" <> inner <> "</nav>"
    }
  }
}

/// This creates a string that represents a section element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` children: The children of the element
///  - `@returns`: A string that represents the HTML element
pub fn section(
  id id: String,
  class class: String,
  attributes attributes: Attribute,
  inner inner: String,
) -> String {
  let att_str =
    attribute_to_string(
      attributes
      |> add("id", id),
    )

  case class {
    "" -> "<section" <> att_str <> ">" <> inner <> "</section>"
    _ -> {
      let class = illegal_string_check(class)
      "<section class=\""
      <> class
      <> "\""
      <> att_str
      <> ">"
      <> inner
      <> "</section>"
    }
  }
}

/// This creates a string that represents an article element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` children: The children of the element
///  - `@returns`: A string that represents the HTML element
pub fn article(
  id id: String,
  class class: String,
  attributes attributes: Attribute,
  inner inner: String,
) -> String {
  let att_str =
    attribute_to_string(
      attributes
      |> add("id", id),
    )

  case class {
    "" -> "<article" <> att_str <> ">" <> inner <> "</article>"
    _ -> {
      let class = illegal_string_check(class)
      "<article class=\""
      <> class
      <> "\""
      <> att_str
      <> ">"
      <> inner
      <> "</article>"
    }
  }
}

/// This creates a string that represents an aside element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` children: The children of the element
///  - `@returns`: A string that represents the HTML element
pub fn aside(
  id id: String,
  class class: String,
  attributes attributes: Attribute,
  inner inner: String,
) -> String {
  let att_str =
    attribute_to_string(
      attributes
      |> add("id", id),
    )

  case class {
    "" -> "<aside" <> att_str <> ">" <> inner <> "</aside>"
    _ -> {
      let class = illegal_string_check(class)
      "<aside class=\""
      <> class
      <> "\""
      <> att_str
      <> ">"
      <> inner
      <> "</aside>"
    }
  }
}

/// This creates a string that represents a main element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` children: The children of the element
///  - `@returns`: A string that represents the HTML element
pub fn main(
  id id: String,
  class class: String,
  attributes attributes: Attribute,
  inner inner: String,
) -> String {
  let att_str =
    attribute_to_string(
      attributes
      |> add("id", id),
    )

  case class {
    "" -> "<main" <> att_str <> ">" <> inner <> "</main>"
    _ -> {
      let class = illegal_string_check(class)
      "<main class=\"" <> class <> "\"" <> att_str <> ">" <> inner <> "</main>"
    }
  }
}

/// This creates a string that represents a button element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` children: The children of the element
///  - `@returns`: A string that represents the HTML element
pub fn button(
  id id: String,
  class class: String,
  attributes attributes: Attribute,
  inner inner: String,
) -> String {
  let att_str =
    attribute_to_string(
      attributes
      |> add("id", id),
    )

  case class {
    "" -> "<button" <> att_str <> ">" <> inner <> "</button>"
    _ -> {
      let class = illegal_string_check(class)
      "<button class=\""
      <> class
      <> "\""
      <> att_str
      <> ">"
      <> inner
      <> "</button>"
    }
  }
}
