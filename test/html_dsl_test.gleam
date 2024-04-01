import gleeunit
import gleeunit/should
import types/class.{Class}
import types/id.{Id}
import types/html.{
  Attribute, Element, Html, a, body, button, div, form, h1, head, header, html,
  img, input, label, li, meta, p, span, title, ul,
}
import types/input.{Submit, Text}

pub fn main() {
  gleeunit.main()
}

// gleeunit test functions end in `_test`
pub fn html_test() {
  case html("en", "") {
    Html(root) ->
      root
      |> should.equal("<!DOCTYPE html><html lang=\"en\"></html>")
    _ -> panic("Expected Html")
  }
}

pub fn body_test() {
  body(
    Id("main-content"),
    Class("container"),
    [Attribute("hx-boost", "true")],
    "",
  )
  |> should.equal(
    "<body class=\"container\" hx-boost=\"true\" id=\"main-content\"></body>",
  )
}

pub fn div_test() {
  div(
    Id("main-content"),
    Class("container"),
    [Attribute("hx-boost", "true")],
    "",
  )
  |> should.equal(
    "<div class=\"container\" hx-boost=\"true\" id=\"main-content\"></div>",
  )
}

pub fn span_test() {
  span(
    Id("main-content"),
    Class("container"),
    [Attribute("hx-boost", "true")],
    "",
  )
  |> should.equal(
    "<span class=\"container\" hx-boost=\"true\" id=\"main-content\"></span>",
  )
}

pub fn p_test() {
  p(Id("main-content"), Class("container"), [Attribute("hx-boost", "true")], "")
  |> should.equal(
    "<p class=\"container\" hx-boost=\"true\" id=\"main-content\"></p>",
  )
}

pub fn a_test() {
  a(
    Id("main-content"),
    Class("container"),
    "/home",
    [Attribute("hx-boost", "true")],
    "",
  )
  |> should.equal(
    "<a href=\"/home\" class=\"container\" hx-boost=\"true\" id=\"main-content\"></a>",
  )
}

pub fn img_test() {
  img(Id("main-content"), Class("container"), "/home.png", "home", [
    Attribute("hx-boost", "true"),
  ])
  |> should.equal(
    "<img src=\"/home.png\" alt=\"home\" class=\"container\" hx-boost=\"true\" id=\"main-content\"/>",
  )
}

pub fn complete_test() {
  case
    html(
      "en",
      head([title("Hello, Gleam!")])
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
  {
    Html(root) ->
      root
      |> should.equal(
        "<!DOCTYPE html><html lang=\"en\"><head><title>Hello, Gleam!</title></head><body class=\"grid\" id=\"main-content\"><h1 >Hello, Gleam!</h1><ul ><li >This is a list item</li><li >This is another list item</li></ul><form ><label >Name:</label><input type=\"text\" placeholder=\"name\" /><input type=\"submit\" placeholder=\"submit\" /><button >Click me!</button></form></body></html>",
      )
    _ -> panic("Expected Html")
  }
}

pub fn conditional_test() {
  case
    html(
      "en",
      head([
          title("Hello, Gleam!"),
          meta("description", "A Gleam program that generates HTML."),
        ])
        <> body(
          Id("main-content"),
          Class("grid"),
          [],
          header(id.Nil, class.Nil, [], "")
            <> case False {
              True -> h1(id.Nil, class.Nil, [], "Hello, Gleam!")
              False -> h1(id.Nil, class.Nil, [], "Hello, World!")
            }
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
  {
    Html(root) ->
      root
      |> should.equal(
        "<!DOCTYPE html><html lang=\"en\"><head><title>Hello, Gleam!</title><meta name=\"description\" content=\"A Gleam program that generates HTML.\"></head><body class=\"grid\" id=\"main-content\"><header ></header><h1 >Hello, World!</h1><ul ><li >This is a list item</li><li >This is another list item</li></ul><form ><label >Name:</label><input type=\"text\" placeholder=\"name\" /><input type=\"submit\" placeholder=\"submit\" /><button >Click me!</button></form></body></html>",
      )
    _ -> panic("Expected Html")
  }
}
