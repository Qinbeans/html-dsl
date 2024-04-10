import gleam/io
import html_dsl/types/html.{body, button, h1, header, html}
import html_dsl/types/html/head.{charset, head, meta, title}
import html_dsl/types/html/lists.{li, ul}
import html_dsl/types/html/form.{Submit, Text, form, input, label}
import html_dsl/types/attribute.{attribute}

/// Example of creating an HTML string
pub fn main() {
  html(
    lang: "en",
    head: head()
      |> title("Hello, Gleam!")
      |> charset("UTF-8")
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
  |> html.html_to_string()
  |> io.println()
}
