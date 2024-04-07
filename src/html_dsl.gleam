import gleam/io
import html_dsl/types/html.{
  body, button, charset, form, h1, head, html, input, label, li, meta,
  new_element, title, ul,
}
import html_dsl/types/class.{Class}
import html_dsl/types/id.{Id}
import html_dsl/types/input.{Submit, Text}

/// Example of creating an HTML string
pub fn main() {
  html(
    "en",
    head([
        title("Hello, Gleam!"),
        meta("viewport", "width=device-width, initial-scale=1"),
        meta("description", "Some website"),
        charset("utf-8"),
      ])
      <> body(
        Id("main-content"),
        Class("grid"),
        [],
        h1(id.Nil, class.Nil, [], "Hello, Gleam!")
          <> ul(id.Nil, class.Nil, [], [
            li(id.Nil, class.Nil, [], "This is a list item"),
            li(id.Nil, class.Nil, [], "This is another list item"),
          ])
          <> form(id.Nil, class.Nil, [], [
            label(id.Nil, class.Nil, [], "Name:"),
            input(id.Nil, class.Nil, [], Text, "name"),
            input(id.Nil, class.Nil, [], Submit, "submit"),
            new_element(button(id.Nil, class.Nil, [], "Click me!")),
          ]),
      ),
  )
  |> html.html_to_string()
  |> io.println()
}
