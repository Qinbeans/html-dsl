import gleam/io
import types/html.{
  Component, Element, Html, body, button, form, h1, head, html, input, label, li,
  meta, title, ul,
}
import types/class.{Class}
import types/id.{Id}
import types/input.{Submit, Text}

pub fn main() {
  let root =
    html(
      "en",
      head([
          title("Hello, Gleam!"),
          meta("viewport", "width=device-width, initial-scale=1"),
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
              Element(button(id.Nil, class.Nil, [], "Click me!")),
            ]),
        ),
    )
  case root {
    Html(html) -> io.println_error(html)
    Component(component) -> io.println_error(component)
  }
}
