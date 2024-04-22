import gleam/option.{type Option}
import html_dsl/types/attribute.{type Attribute, attribute_to_string}
import html_dsl/utils/check.{illegal_string_check}

/// Represents the body of a document.
pub opaque type Body {
  Body(String)
  Element(String)
  End(String)
}

pub fn element() -> Body {
  Element("")
}

pub fn text(text: String) -> Body {
  Element(text)
}

pub fn nil() -> Body {
  Element("")
}

pub fn resolve(body: Body) -> Result(String, String) {
  case body {
    Body(body) -> Error(body)
    Element(body) -> Error(body)
    End(body) -> Ok(body)
  }
}

pub fn body_to_string(body: Body) -> String {
  case body {
    Body(body) -> body
    Element(body) -> body
    End(body) -> body
  }
}

pub fn body(attributes attributes: Option(Attribute)) -> Body {
  let att_str = attribute_to_string(attributes)
  Body("<body" <> att_str <> ">")
}

pub fn end(root: Body) -> Body {
  End(body_to_string(root) <> "</body>")
}

pub fn br(root: Body) -> Body {
  case root {
    Body(body) -> Body(body <> "<br>")
    Element(body) -> Element(body <> "<br>")
    End(_) -> panic as "Cannot add a <br> tag to the end of the body"
  }
}

pub fn hr(root: Body) -> Body {
  case root {
    Body(body) -> Body(body <> "<hr>")
    Element(body) -> Element(body <> "<hr>")
    End(_) -> panic as "Cannot add a <hr> tag to the end of the body"
  }
}

pub fn div(
  root: Body,
  attributes attributes: Option(Attribute),
  inner inner: Body,
) -> Body {
  //inherit type from root
  let inner = case inner {
    Body(_) -> panic as "Cannot add a body to a div"
    Element(inner) -> inner
    End(_) -> panic as "Cannot add an end to a div"
  }
  case root {
    Body(body) ->
      Body(
        body
        <> "<div"
        <> attribute_to_string(attributes)
        <> ">"
        <> inner
        <> "</div>",
      )
    Element(body) ->
      Element(
        body
        <> "<div"
        <> attribute_to_string(attributes)
        <> ">"
        <> inner
        <> "</div>",
      )
    End(_) -> panic as "Cannot add a <div> tag to the end of the body"
  }
}

pub fn span(
  root: Body,
  attributes attributes: Option(Attribute),
  inner inner: Body,
) -> Body {
  //inherit type from root
  let inner = case inner {
    Body(_) -> panic as "Cannot add a body to a span"
    Element(inner) -> inner
    End(_) -> panic as "Cannot add an end to a span"
  }
  case root {
    Body(body) ->
      Body(
        body
        <> "<span"
        <> attribute_to_string(attributes)
        <> ">"
        <> inner
        <> "</span>",
      )
    Element(body) ->
      Element(
        body
        <> "<span"
        <> attribute_to_string(attributes)
        <> ">"
        <> inner
        <> "</span>",
      )
    End(_) -> panic as "Cannot add a <span> tag to the end of the body"
  }
}

pub fn p(
  root: Body,
  attributes attributes: Option(Attribute),
  inner inner: Body,
) -> Body {
  //inherit type from root
  let inner = case inner {
    Body(_) -> panic as "Cannot add a body to a p"
    Element(inner) -> inner
    End(_) -> panic as "Cannot add an end to a p"
  }
  case root {
    Body(body) ->
      Body(
        body
        <> "<p"
        <> attribute_to_string(attributes)
        <> ">"
        <> inner
        <> "</p>",
      )
    Element(body) ->
      Element(
        body
        <> "<p"
        <> attribute_to_string(attributes)
        <> ">"
        <> inner
        <> "</p>",
      )
    End(_) -> panic as "Cannot add a <p> tag to the end of the body"
  }
}

pub fn h1(
  root: Body,
  attributes attributes: Option(Attribute),
  inner inner: Body,
) -> Body {
  //inherit type from root
  let inner = case inner {
    Body(_) -> panic as "Cannot add a body to a h1"
    Element(inner) -> inner
    End(_) -> panic as "Cannot add an end to a h1"
  }
  case root {
    Body(body) ->
      Body(
        body
        <> "<h1"
        <> attribute_to_string(attributes)
        <> ">"
        <> inner
        <> "</h1>",
      )
    Element(body) ->
      Element(
        body
        <> "<h1"
        <> attribute_to_string(attributes)
        <> ">"
        <> inner
        <> "</h1>",
      )
    End(_) -> panic as "Cannot add a <h1> tag to the end of the body"
  }
}

pub fn h2(
  root: Body,
  attributes attributes: Option(Attribute),
  inner inner: Body,
) -> Body {
  //inherit type from root
  let inner = case inner {
    Body(_) -> panic as "Cannot add a body to a h2"
    Element(inner) -> inner
    End(_) -> panic as "Cannot add an end to a h2"
  }
  case root {
    Body(body) ->
      Body(
        body
        <> "<h2"
        <> attribute_to_string(attributes)
        <> ">"
        <> inner
        <> "</h2>",
      )
    Element(body) ->
      Element(
        body
        <> "<h2"
        <> attribute_to_string(attributes)
        <> ">"
        <> inner
        <> "</h2>",
      )
    End(_) -> panic as "Cannot add a <h2> tag to the end of the body"
  }
}

pub fn h3(
  root: Body,
  attributes attributes: Option(Attribute),
  inner inner: Body,
) -> Body {
  //inherit type from root
  let inner = case inner {
    Body(_) -> panic as "Cannot add a body to a h3"
    Element(inner) -> inner
    End(_) -> panic as "Cannot add an end to a h3"
  }
  case root {
    Body(body) ->
      Body(
        body
        <> "<h3"
        <> attribute_to_string(attributes)
        <> ">"
        <> inner
        <> "</h3>",
      )
    Element(body) ->
      Element(
        body
        <> "<h3"
        <> attribute_to_string(attributes)
        <> ">"
        <> inner
        <> "</h3>",
      )
    End(_) -> panic as "Cannot add a <h3> tag to the end of the body"
  }
}

pub fn h4(
  root: Body,
  attributes attributes: Option(Attribute),
  inner inner: Body,
) -> Body {
  //inherit type from root
  let inner = case inner {
    Body(_) -> panic as "Cannot add a body to a h4"
    Element(inner) -> inner
    End(_) -> panic as "Cannot add an end to a h4"
  }
  case root {
    Body(body) ->
      Body(
        body
        <> "<h4"
        <> attribute_to_string(attributes)
        <> ">"
        <> inner
        <> "</h4>",
      )
    Element(body) ->
      Element(
        body
        <> "<h4"
        <> attribute_to_string(attributes)
        <> ">"
        <> inner
        <> "</h4>",
      )
    End(_) -> panic as "Cannot add a <h4> tag to the end of the body"
  }
}

pub fn h5(
  root: Body,
  attributes attributes: Option(Attribute),
  inner inner: Body,
) -> Body {
  //inherit type from root
  let inner = case inner {
    Body(_) -> panic as "Cannot add a body to a h5"
    Element(inner) -> inner
    End(_) -> panic as "Cannot add an end to a h5"
  }
  case root {
    Body(body) ->
      Body(
        body
        <> "<h5"
        <> attribute_to_string(attributes)
        <> ">"
        <> inner
        <> "</h5>",
      )
    Element(body) ->
      Element(
        body
        <> "<h5"
        <> attribute_to_string(attributes)
        <> ">"
        <> inner
        <> "</h5>",
      )
    End(_) -> panic as "Cannot add a <h5> tag to the end of the body"
  }
}

pub fn h6(
  root: Body,
  attributes attributes: Option(Attribute),
  inner inner: Body,
) -> Body {
  //inherit type from root
  let inner = case inner {
    Body(_) -> panic as "Cannot add a body to a h6"
    Element(inner) -> inner
    End(_) -> panic as "Cannot add an end to a h6"
  }
  case root {
    Body(body) ->
      Body(
        body
        <> "<h6"
        <> attribute_to_string(attributes)
        <> ">"
        <> inner
        <> "</h6>",
      )
    Element(body) ->
      Element(
        body
        <> "<h6"
        <> attribute_to_string(attributes)
        <> ">"
        <> inner
        <> "</h6>",
      )
    End(_) -> panic as "Cannot add a <h6> tag to the end of the body"
  }
}

pub fn a(
  root: Body,
  attributes attributes: Option(Attribute),
  href href: String,
  inner inner: Body,
) -> Body {
  //inherit type from root
  let inner = case inner {
    Body(_) -> panic as "Cannot add a body to an a"
    Element(inner) -> inner
    End(_) -> panic as "Cannot add an end to an a"
  }
  // sanitize href
  let href = illegal_string_check(href)
  case root {
    Body(body) ->
      Body(
        body
        <> "<a"
        <> attribute_to_string(attributes)
        <> " href=\""
        <> href
        <> "\">"
        <> inner
        <> "</a>",
      )
    Element(body) ->
      Element(
        body
        <> "<a"
        <> attribute_to_string(attributes)
        <> " href=\""
        <> href
        <> "\">"
        <> inner
        <> "</a>",
      )
    End(_) -> panic as "Cannot add an <a> tag to the end of the body"
  }
}

pub fn img(
  root: Body,
  attributes attributes: Option(Attribute),
  src src: String,
) -> Body {
  // sanitize src
  let src = illegal_string_check(src)
  case root {
    Body(body) ->
      Body(
        body
        <> "<img"
        <> attribute_to_string(attributes)
        <> " src=\""
        <> src
        <> "\">",
      )
    Element(body) ->
      Element(
        body
        <> "<img"
        <> attribute_to_string(attributes)
        <> " src=\""
        <> src
        <> "\">",
      )
    End(_) -> panic as "Cannot add an <img> tag to the end of the body"
  }
}

pub fn header(
  root: Body,
  attributes attributes: Option(Attribute),
  inner inner: Body,
) -> Body {
  //inherit type from root
  let inner = case inner {
    Body(_) -> panic as "Cannot add a body to a header"
    Element(inner) -> inner
    End(_) -> panic as "Cannot add an end to a header"
  }
  case root {
    Body(body) ->
      Body(
        body
        <> "<header"
        <> attribute_to_string(attributes)
        <> ">"
        <> inner
        <> "</header>",
      )
    Element(body) ->
      Element(
        body
        <> "<header"
        <> attribute_to_string(attributes)
        <> ">"
        <> inner
        <> "</header>",
      )
    End(_) -> panic as "Cannot add a <header> tag to the end of the body"
  }
}

pub fn footer(
  root: Body,
  attributes attributes: Option(Attribute),
  inner inner: Body,
) -> Body {
  //inherit type from root
  let inner = case inner {
    Body(_) -> panic as "Cannot add a body to a footer"
    Element(inner) -> inner
    End(_) -> panic as "Cannot add an end to a footer"
  }
  case root {
    Body(body) ->
      Body(
        body
        <> "<footer"
        <> attribute_to_string(attributes)
        <> ">"
        <> inner
        <> "</footer>",
      )
    Element(body) ->
      Element(
        body
        <> "<footer"
        <> attribute_to_string(attributes)
        <> ">"
        <> inner
        <> "</footer>",
      )
    End(_) -> panic as "Cannot add a <footer> tag to the end of the body"
  }
}

pub fn nav(
  root: Body,
  attributes attributes: Option(Attribute),
  inner inner: Body,
) -> Body {
  //inherit type from root
  let inner = case inner {
    Body(_) -> panic as "Cannot add a body to a nav"
    Element(inner) -> inner
    End(_) -> panic as "Cannot add an end to a nav"
  }
  case root {
    Body(body) ->
      Body(
        body
        <> "<nav"
        <> attribute_to_string(attributes)
        <> ">"
        <> inner
        <> "</nav>",
      )
    Element(body) ->
      Element(
        body
        <> "<nav"
        <> attribute_to_string(attributes)
        <> ">"
        <> inner
        <> "</nav>",
      )
    End(_) -> panic as "Cannot add a <nav> tag to the end of the body"
  }
}

pub fn section(
  root: Body,
  attributes attributes: Option(Attribute),
  inner inner: Body,
) -> Body {
  //inherit type from root
  let inner = case inner {
    Body(_) -> panic as "Cannot add a body to a section"
    Element(inner) -> inner
    End(_) -> panic as "Cannot add an end to a section"
  }
  case root {
    Body(body) ->
      Body(
        body
        <> "<section"
        <> attribute_to_string(attributes)
        <> ">"
        <> inner
        <> "</section>",
      )
    Element(body) ->
      Element(
        body
        <> "<section"
        <> attribute_to_string(attributes)
        <> ">"
        <> inner
        <> "</section>",
      )
    End(_) -> panic as "Cannot add a <section> tag to the end of the body"
  }
}
