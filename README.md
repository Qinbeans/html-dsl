# html_dsl

[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://qinbeans.github.io/html-dsl/)
[![test](https://github.com/Qinbeans/html-dsl/actions/workflows/test.yml/badge.svg)](https://github.com/Qinbeans/html-dsl/actions/workflows/test.yml)

A fun way to create HTML in Gleam.

## Premise

I wanted a simple framework to build HTML and I saw a way forward with strings.

I thought that Gleam had a very unique type system in which I could wrap strings around a named type like `Html` or `Head`. The way I implemented it does restrict general reactivity through Gleam itself, but I never thought making this a standalone framework as an option. The idea was to combine this with existing frontend libraries like HTMX to add that touch of reactivity.

## Going forward

I'm not sure what else to expand except implementing more existing HTML elements.

## Examples

```gleam
import html_dsl/types/html.{Html, Attribute, head, style, script, body, title, charset, meta, button}
import html_dsl/types/id.{Id}
import html_dsl/types/class.{Class}
// If you're familiar with HTML, this might seem pretty standalone
fn main() {
  let my_doc = Html(
    "en", // States the locale
    head([
      title("My doc"),
      charset("utf-8"),
      meta("description","This is my doc"),
      meta("viewport","width=device-width, initial-scale=1"),
      style("https://cdn.tailwindcss.com"),
      script("https://unpkg.com/htmx.org@1.9.11")
    ])
    // Most elements are strings under the hood so we can concat them
    <> body(
        Id("main-content"), // This declares we do not need an id
        Class("text-white"),
        [], // Have no custom attributes
        button(
          id.Nil,
          class.Nil,
          [
            Attribute("hx-trigger", "click"),
            Attribute("hx-get", "/clicked"),
            Attribute("hx-boost", "true"),
            Attribute("target", "#main-content")
          ],
          "Happy Days"
        )
      )
  )
  // We can access the document as a string
  let _ = html.html_to_string(my_doc)
  // or through the pipe operator
  let _ = my_doc
    |> html.html_to_string()
}
```
So why use strings to build each element? Ultimately everything is parsed into a string so I wanted to get straight to the point with little to no intermediate step. Don't get me wrong, I still have intermediate's here and there, but that's more for explicitness. It prevents bad [HTML](https://developer.mozilla.org/en-US/docs/Web/HTML) from being written.

## Development

```sh
./dev.sh run   # Run the project
./dev.sh test  # Run the tests
./dev.sh docs  # Generate the documentation
./dev.sh build # Build the project
```
