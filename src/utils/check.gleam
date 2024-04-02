import gleam/list
import gleam/string

pub fn illegal_string_check(str: String) -> String {
  string.split(str, "")
  |> list.map(fn(str: String) -> String {
    case str {
      ">" -> "&gt;"
      "<" -> "&lt;"
      "&" -> "&amp;"
      "\\" -> "&#92;"
      "'" -> "&#39;"
      "\"" -> "&#34;"
      _ -> str
    }
  })
  |> string.join("")
}
