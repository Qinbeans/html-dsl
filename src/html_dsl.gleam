import gleam/io
import html_dsl/types/attribute
import html_dsl/types/html.{html}
import html_dsl/types/html/body.{
  a, body, br, div, h1, header, nav, p, section, span,
}
import html_dsl/types/html/head.{charset, head, meta, script, title}

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
      attribute.new()
      |> attribute.class("bg-black text-white"),
    )
      |> header(
      attribute.new()
        |> attribute.class("grid grid-cols-3 gap-4 py-2"),
      body.element()
        |> nav(
        attribute.new()
          |> attribute.class("col-start-2 col-span-1 flex justify-center gap-4"),
        body.element()
          |> a(
          attribute.new()
            |> attribute.class(
            "px-2 py-1 bg-white/25 hover:bg-white/15 rounded-lg",
          ),
          "#",
          body.text("Home"),
        )
          |> a(
          attribute.new()
            |> attribute.class(
            "px-2 py-1 bg-white/25 hover:bg-white/15 rounded-lg",
          ),
          "#",
          body.text("About"),
        )
          |> a(
          attribute.new()
            |> attribute.class(
            "px-2 py-1 bg-white/25 hover:bg-white/15 rounded-lg",
          ),
          "#",
          body.text("Contact"),
        ),
      ),
    )
      |> section(
      attribute.new(),
      body.element()
        |> div(
        attribute.new()
          |> attribute.class("px-52"),
        body.element()
          |> h1(
          attribute.new()
            |> attribute.class("text-4xl text-center"),
          body.text("Hello, Gleam!"),
        )
          |> br()
          |> p(
          attribute.new()
            |> attribute.class("bg-white/15 pl-2"),
          body.text("Hello, Gleam!")
            |> span(
            attribute.new()
              |> attribute.class("text-2xl"),
            body.text("🚀"),
          ),
        ),
      ),
    )
      |> body.end(),
  )
  |> html.force()
  |> html.html_to_string()
  |> io.println()
}
