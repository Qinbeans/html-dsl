pub type InputType {
  Button
  Checkbox
  Color
  Date
  DatetimeLocal
  Email
  File
  Hidden
  Image
  Month
  Number
  Password
  Radio
  Range
  Reset
  Search
  Submit
  Tel
  Text
  Time
  Url
  Week
}

pub fn input_type_to_attribute(input_type: InputType) -> String {
  "type=\""
  <> case input_type {
    Button -> "button"
    Checkbox -> "checkbox"
    Color -> "color"
    Date -> "date"
    DatetimeLocal -> "datetime-local"
    Email -> "email"
    File -> "file"
    Hidden -> "hidden"
    Image -> "image"
    Month -> "month"
    Number -> "number"
    Password -> "password"
    Radio -> "radio"
    Range -> "range"
    Reset -> "reset"
    Search -> "search"
    Submit -> "submit"
    Tel -> "tel"
    Text -> "text"
    Time -> "time"
    Url -> "url"
    Week -> "week"
  }
  <> "\""
}
