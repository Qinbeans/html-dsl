import gleeunit
import gleeunit/should
import html_dsl/types/html.{
  a, body, button, div, h1, header, html, html_to_string, img, is_html, p, span,
}
import html_dsl/types/attribute.{attribute}
import html_dsl/types/html/head.{head, meta, title}
import html_dsl/types/html/form.{Submit, Text, form, input, label}
import html_dsl/types/html/lists.{li, ul}

pub fn main() {
  gleeunit.main()
}

// gleeunit test functions end in `_test`
pub fn html_test() {
  let html = html(lang: "en", head: head(), body: "")
  case is_html(html) {
    True ->
      html_to_string(html)
      |> should.equal("<!DOCTYPE html><html lang=\"en\"></html>")
    False -> panic("Expected Html")
  }
}

pub fn body_test() {
  body(
    id: "main-content",
    class: "container",
    attributes: attribute()
      |> attribute.add("hx-boost", "true"),
    inner: "",
  )
  |> should.equal(
    "<body class=\"container\" hx-boost=\"true\" id=\"main-content\"></body>",
  )
}

pub fn div_test() {
  div(
    id: "main-content",
    class: "container",
    attributes: attribute()
      |> attribute.add("hx-boost", "true"),
    inner: "",
  )
  |> should.equal(
    "<div class=\"container\" hx-boost=\"true\" id=\"main-content\"></div>",
  )
}

pub fn span_test() {
  span(
    id: "main-content",
    class: "container",
    attributes: attribute()
      |> attribute.add("hx-boost", "true"),
    inner: "",
  )
  |> should.equal(
    "<span class=\"container\" hx-boost=\"true\" id=\"main-content\"></span>",
  )
}

pub fn p_test() {
  p(
    id: "main-content",
    class: "container",
    attributes: attribute()
      |> attribute.add("hx-boost", "true"),
    inner: "",
  )
  |> should.equal(
    "<p class=\"container\" hx-boost=\"true\" id=\"main-content\"></p>",
  )
}

pub fn a_test() {
  a(
    id: "main-content",
    class: "container",
    href: "/home",
    attributes: attribute()
      |> attribute.add("hx-boost", "true"),
    inner: "",
  )
  |> should.equal(
    "<a href=\"/home\" class=\"container\" hx-boost=\"true\" id=\"main-content\"></a>",
  )
}

pub fn img_test() {
  img(
    "main-content",
    "container",
    "/home.png",
    "home",
    attribute()
      |> attribute.add("hx-boost", "true"),
  )
  |> should.equal(
    "<img src=\"/home.png\" alt=\"home\" class=\"container\" hx-boost=\"true\" id=\"main-content\"/>",
  )
}

pub fn complete_test() {
  let html =
    html(
      lang: "en",
      head: head()
        |> title("Hello, Gleam!"),
      body: body(
        id: "main-content",
        class: "grid",
        attributes: attribute(),
        inner: h1("", "", attribute(), "Hello, Gleam!")
          <> ul(
            "",
            "",
            attribute(),
            li()
              |> lists.add("", "", attribute(), "This is a list item")
              |> lists.add("", "", attribute(), "This is another list item"),
          )
          <> form(
            "",
            "",
            attribute(),
            form.init()
              |> label("", "", attribute(), "Name:")
              |> input("", "", attribute(), Text, "name")
              |> input("", "", attribute(), Submit, "submit")
              |> form.element(button("", "", attribute(), "Click me!")),
          ),
      ),
    )
  case is_html(html) {
    True ->
      html_to_string(html)
      |> should.equal(
        "<!DOCTYPE html><html lang=\"en\"><head><title>Hello, Gleam!</title></head><body class=\"grid\" id=\"main-content\"><h1>Hello, Gleam!</h1><ul><li>This is a list item</li><li>This is another list item</li></ul><form><label>Name:</label><input type=\"text\" placeholder=\"name\"/><input type=\"submit\" placeholder=\"submit\"/><button>Click me!</button></form></body></html>",
      )
    False -> panic("Expected Html")
  }
}

pub fn conditional_test() {
  let html =
    html(
      lang: "en",
      head: head()
        |> title("Hello, Gleam!")
        |> meta("description", "A Gleam program that generates HTML."),
      body: body(
        id: "main-content",
        class: "grid",
        attributes: attribute(),
        inner: header("", "", attribute(), "")
          <> case False {
            True -> h1("", "", attribute(), "True")
            False -> h1("", "", attribute(), "False")
          }
          <> ul(
            "",
            "",
            attribute(),
            li()
              |> lists.add("", "", attribute(), "This is a list item")
              |> lists.add("", "", attribute(), "This is another list item"),
          )
          <> form(
            "",
            "",
            attribute(),
            form.init()
              |> label("", "", attribute(), "Name:")
              |> input("", "", attribute(), Text, "name")
              |> input("", "", attribute(), Submit, "submit")
              |> form.element(button("", "", attribute(), "Click me!")),
          ),
      ),
    )
  case is_html(html) {
    True ->
      html_to_string(html)
      |> should.equal(
        "<!DOCTYPE html><html lang=\"en\"><head><title>Hello, Gleam!</title><meta name=\"description\" content=\"A Gleam program that generates HTML.\"></head><body class=\"grid\" id=\"main-content\"><header></header><h1>False</h1><ul><li>This is a list item</li><li>This is another list item</li></ul><form><label>Name:</label><input type=\"text\" placeholder=\"name\"/><input type=\"submit\" placeholder=\"submit\"/><button>Click me!</button></form></body></html>",
      )
    False -> panic("Expected Html")
  }
}

pub fn illegal_test() {
  // A test to break parser with illegal characters
  div(
    id: "\"><script>alert(\"Pwned\")</script><",
    class: "container",
    attributes: attribute(),
    inner: "",
  )
  |> should.equal(
    "<div class=\"container\" id=\"&#34;&gt;&lt;script&gt;alert(&#34;Pwned&#34;)&lt;/script&gt;&lt;\"></div>",
  )
}
