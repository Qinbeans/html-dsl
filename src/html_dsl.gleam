import gleam/io
import html_dsl/types/html.{body, button, h1, header, html, nav}
import html_dsl/types/html/head.{charset, head, meta, script, title}
import html_dsl/types/html/lists.{ul}
import html_dsl/types/html/form.{Submit, Text, element, form, input, label}
import html_dsl/types/attribute.{class, id}
import html_dsl/types/html/form/select.{select}
import gleam/option.{None}

/// Example of creating an HTML string
pub fn main() {
  html(
    lang: "en",
    head: head()
      |> title("Hello, Gleam!")
      |> charset("UTF-8")
      |> meta("viewport", "width=device-width, initial-scale=1.0")
      |> meta("description", "A Gleam program that generates HTML.")
      |> script("https://cdn.tailwindcss.com")
      |> head.end(),
    body: body(
      attributes: id(None, "main-content")
        |> class("bg-black text-white"),
      inner: header(
          class(None, "grid place-content-center"),
          nav(None, "Hello"),
        )
        <> case False {
          True -> h1(None, "True")
          False -> h1(None, "False")
        }
        <> ul(None)
        |> lists.add(
          attribute.new()
            |> class("text-blue-400"),
          "This is a list item",
        )
        |> lists.add(None, "This is another list item")
        |> lists.end()
        <> form(
          class(None, "flex")
          |> attribute.add("method", "GET")
          |> attribute.add("action", "#"),
        )
        |> label(None, "Name:")
        |> input(None, Text, "name")
        |> input(None, Submit, "submit")
        |> element(button(None, "Click me!"))
        |> select(None)
        |> select.add(
          attribute.add(None, "selected", "selected")
            |> attribute.add("disabled", "disabled"),
          "",
          "--Please choose an option--",
        )
        |> select.add(None, value: "something", label: "Something")
        |> select.add(None, value: "else", label: "Else")
        |> select.end()
        |> form.end(),
    ),
  )
  |> html.force()
  |> html.html_to_string()
  |> io.println()
}
