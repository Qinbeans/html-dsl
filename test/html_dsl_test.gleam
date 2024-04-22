// import gleeunit
// import gleeunit/should
// import html_dsl/types/html.{
//   a, body, body_to_string, button, div, h1, header, html, html_to_string, img,
//   is_html, p, span,
// }
// import html_dsl/types/attribute.{add, class, id}
// import html_dsl/types/html/head.{head, meta, title}
// import html_dsl/types/html/form.{Submit, Text, element, form, input, label}
// import html_dsl/types/html/lists.{ul}
// import gleam/option.{None}

// pub fn main() {
//   gleeunit.main()
// }

// // gleeunit test functions end in `_test`
// pub fn html_test() {
//   let html =
//     html(
//       lang: "en",
//       head: head()
//         |> head.end(),
//       body: body(None, ""),
//     )
//     |> html.force()
//   case is_html(html) {
//     True ->
//       html_to_string(html)
//       |> should.equal(
//         "<!DOCTYPE html><html lang=\"en\"><head></head><body></body></html>",
//       )
//     False -> panic as "Expected Html"
//   }
// }

// pub fn body_test() {
//   body(
//     attributes: id(None, "main-content")
//       |> class("container")
//       |> add("hx-boost", "true"),
//     inner: "",
//   )
//   |> body_to_string()
//   |> should.equal(
//     "<body id=\"main-content\" class=\"container\" hx-boost=\"true\"></body>",
//   )
// }

// pub fn div_test() {
//   div(
//     attributes: id(None, "main-content")
//       |> class("container")
//       |> add("hx-boost", "true"),
//     inner: "",
//   )
//   |> should.equal(
//     "<div id=\"main-content\" class=\"container\" hx-boost=\"true\"></div>",
//   )
// }

// pub fn span_test() {
//   span(
//     attributes: id(None, "main-content")
//       |> class("container")
//       |> add("hx-boost", "true"),
//     inner: "",
//   )
//   |> should.equal(
//     "<span id=\"main-content\" class=\"container\" hx-boost=\"true\"></span>",
//   )
// }

// pub fn p_test() {
//   p(
//     attributes: id(None, "main-content")
//       |> class("container")
//       |> add("hx-boost", "true"),
//     inner: "",
//   )
//   |> should.equal(
//     "<p id=\"main-content\" class=\"container\" hx-boost=\"true\"></p>",
//   )
// }

// pub fn a_test() {
//   a(
//     href: "/home",
//     attributes: id(None, "main-content")
//       |> class("container")
//       |> add("hx-boost", "true"),
//     inner: "",
//   )
//   |> should.equal(
//     "<a href=\"/home\" id=\"main-content\" class=\"container\" hx-boost=\"true\"></a>",
//   )
// }

// pub fn img_test() {
//   img(
//     "/home.png",
//     "home",
//     id(None, "main-content")
//       |> class("container")
//       |> add("hx-boost", "true"),
//   )
//   |> should.equal(
//     "<img src=\"/home.png\" alt=\"home\" id=\"main-content\" class=\"container\" hx-boost=\"true\"/>",
//   )
// }

// pub fn complete_test() {
//   let html =
//     html(
//       lang: "en",
//       head: head()
//         |> title("Hello, Gleam!")
//         |> head.end(),
//       body: body(
//         attributes: id(None, "main-content")
//           |> class("grid"),
//         inner: h1(None, "Hello, Gleam!")
//           <> ul(None)
//           |> lists.add(None, "This is a list item")
//           |> lists.add(None, "This is another list item")
//           |> lists.end()
//           <> form(None)
//           |> label(None, "Name:")
//           |> input(None, Text, "name")
//           |> input(None, Submit, "submit")
//           |> element(button(None, "Click me!"))
//           |> form.end(),
//       ),
//     )
//     |> html.force()
//   case is_html(html) {
//     True ->
//       html_to_string(html)
//       |> should.equal(
//         "<!DOCTYPE html><html lang=\"en\"><head><title>Hello, Gleam!</title></head><body id=\"main-content\" class=\"grid\"><h1>Hello, Gleam!</h1><ul><li>This is a list item</li><li>This is another list item</li></ul><form><label>Name:</label><input type=\"text\" placeholder=\"name\"/><input type=\"submit\" placeholder=\"submit\"/><button>Click me!</button></form></body></html>",
//       )
//     False -> panic("Expected Html")
//   }
// }

// pub fn conditional_test() {
//   let html =
//     html(
//       lang: "en",
//       head: head()
//         |> title("Hello, Gleam!")
//         |> meta("description", "A Gleam program that generates HTML.")
//         |> head.end(),
//       body: body(
//         attributes: id(None, "main-content")
//           |> class("grid"),
//         inner: header(None, "")
//           <> case False {
//             True -> h1(None, "True")
//             False -> h1(None, "False")
//           }
//           <> ul(None)
//           |> lists.add(None, "This is a list item")
//           |> lists.add(None, "This is another list item")
//           |> lists.end()
//           <> form(None)
//           |> label(None, "Name:")
//           |> input(None, Text, "name")
//           |> input(None, Submit, "submit")
//           |> element(button(None, "Click me!"))
//           |> form.end(),
//       ),
//     )
//     |> html.force()
//   case is_html(html) {
//     True ->
//       html_to_string(html)
//       |> should.equal(
//         "<!DOCTYPE html><html lang=\"en\"><head><title>Hello, Gleam!</title><meta name=\"description\" content=\"A Gleam program that generates HTML.\"></head><body id=\"main-content\" class=\"grid\"><header></header><h1>False</h1><ul><li>This is a list item</li><li>This is another list item</li></ul><form><label>Name:</label><input type=\"text\" placeholder=\"name\"/><input type=\"submit\" placeholder=\"submit\"/><button>Click me!</button></form></body></html>",
//       )
//     False -> panic("Expected Html")
//   }
// }

// pub fn illegal_test() {
//   // A test to break parser with illegal characters
//   div(
//     attributes: id(None, "\"><script>alert(\"Pwned\")</script><")
//       |> class("container"),
//     inner: "",
//   )
//   |> should.equal(
//     "<div id=\"&#34;&gt;&lt;script&gt;alert(&#34;Pwned&#34;)&lt;/script&gt;&lt;\" class=\"container\"></div>",
//   )
// }
