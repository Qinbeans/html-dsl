import gleam/list
import gleam/string

/// Checks a given string for illegal characters and replaces them with their HTML entity
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
