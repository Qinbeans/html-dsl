# html_dsl

[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://qinbeans.github.io/html-dsl/)
[![test](https://github.com/Qinbeans/html-dsl/actions/workflows/test.yml/badge.svg)](https://github.com/Qinbeans/html-dsl/actions/workflows/test.yml)

A fun, modular, and simple way to create HTML in Gleam.

## Premise

I wanted a simple framework to build HTML and I saw a way forward with strings. Think of this as building a one way buffer to generate HTML. I wanted to avoid using a lot of intermediate steps like using a list of tuples or a list of records. I wanted to get straight to the point and build the HTML string as I go along. This is a very simple way to build HTML and I wanted to keep it that way.


I thought that Gleam had a very unique type system in which I could wrap strings around a named type like `Html` or `Head`. The way I implemented it does restrict general reactivity through Gleam itself, but I never thought making this a standalone framework as an option. The idea was to combine this with existing frontend libraries like HTMX to add that touch of reactivity. The backend/DSL would choose what to generate based on requests and headers for a more dynamic experience.

## Going forward

I'm refining the way the elements are built as well as adding more elements to the DSL. I add deeper documentation based one what I think could cause problems. If you find something difficult, feel free to reach out!


## Installation

```sh
gleam add html_dsl
```

## Examples

```gleam
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

```
So why use strings to build each element? Ultimately everything is parsed into a string so I wanted to get straight to the point with little to no intermediate step. Don't get me wrong, I still have intermediate's here and there, but that's more for explicitness. It prevents bad [HTML](https://developer.mozilla.org/en-US/docs/Web/HTML) from being written.

## Development

This is for use for contributors to the project.

```sh
./dev.sh run   # Run the project
./dev.sh test  # Run the tests
./dev.sh docs  # Generate the documentation
./dev.sh build # Build the project
```
