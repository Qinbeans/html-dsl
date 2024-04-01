import gleam/io
import types/html.{
  Element, body, button, form, h1, head, html, input, label, li, title, ul,
}
import types/class.{Class}
import types/id.{Id}
import types/input.{Submit, Text}

pub fn main() {
  let root =
    html(
      "en",
      head(title("Hello, Gleam!"))
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
  let html.Html(html) = root
  io.println_error(html)
}
