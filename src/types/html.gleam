import gleam/list
import gleam/string
import types/class
import types/id
import types/input
import utils/check.{illegal_string_check}

/// Similar to a pair, but uniquely named
pub type Attribute {
  Attribute(key: String, value: String)
}

/// Exists to prevent strings from being passed to select
pub opaque type Option {
  Option(String)
}

/// Exists to prevent strings from being passed to ul and ol
pub opaque type ListItem {
  ListItem(String)
}

/// Exists to prevent strings from being passed to forms
pub opaque type Input {
  Input(String)
  Label(String)
  Element(String)
}

/// Exists to prevent strings from being passed to engines
///
/// Engines should require `Html` or `Component`
pub opaque type Html {
  Html(String)
  Component(String)
}

/// Check Html enum
///  - `@param` html: The Html enum
///  - `@returns`: True if the Html enum is Html, False if it is Component
pub fn is_html(html: Html) -> Bool {
  case html {
    Html(_) -> True
    Component(_) -> False
  }
}

/// Head is a type that represents the head of an HTML document
pub opaque type Head {
  Meta(String)
  Title(String)
  Link(String)
  Style(String)
  Script(String)
}

/// Converts Html enum to a string
pub fn html_to_string(html: Html) -> String {
  case html {
    Html(content) -> content
    Component(content) -> content
  }
}

/// Element is part of an opaque type, so it can't be accessed directly
///
/// This function is used to create an Element
///  - `@param` content: The content of the element
///  - `@returns`: An Element
pub fn new_element(content: String) -> Input {
  Element(content)
}

/// This function is used to create an Attribute
///  - `@param` key: The key of the attribute
///  - `@param` value: The value of the attribute
///  - `@returns`: An Attribute
pub fn attribute(key: String, value: String) -> Attribute {
  Attribute(key, value)
}

/// This function is used to create a ListItem
///  - `@param` content: The content of the list item
///  - `@returns`: A ListItem
pub fn render_attribute(attribute: Attribute) -> String {
  let Attribute(key, value) = attribute
  key <> "=\"" <> value <> "\""
}

/// This creates a string that represents a div element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` child: The child of the element
///  - `@returns`: A string that represents the HTML element
pub fn div(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  child: String,
) -> String {
  // I'm too lazy, so I'm going to add id to the attributes list
  let att_str =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(a: Attribute) -> String {
        render_attribute(Attribute(
          illegal_string_check(a.key),
          illegal_string_check(a.value),
        ))
      },
    )
    |> string.join(" ")
  case class {
    class.Class(class) -> {
      let class = illegal_string_check(class)
      "<div class=\"" <> class <> "\" " <> att_str <> ">" <> child <> "</div>"
    }
    class.Nil -> "<div " <> att_str <> ">" <> child <> "</div>"
  }
}

/// This creates a string that represents an image element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` src: The source of the image
///  - `@param` alt: The alt text of the image
///  - `@param` attributes: The attributes of the element
///  - `@returns`: A string that represents the HTML element
pub fn img(
  id: id.Id,
  class: class.Class,
  src: String,
  alt: String,
  attributes: List(Attribute),
) -> String {
  let att_str =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(a: Attribute) -> String {
        render_attribute(Attribute(
          illegal_string_check(a.key),
          illegal_string_check(a.value),
        ))
      },
    )
    |> string.join(" ")
  case class {
    class.Class(class) -> {
      let class = illegal_string_check(class)
      "<img src=\""
      <> src
      <> "\" alt=\""
      <> alt
      <> "\" class=\""
      <> class
      <> "\" "
      <> att_str
      <> "/>"
    }
    class.Nil ->
      "<img src=\"" <> src <> "\" alt=\"" <> alt <> "\" " <> att_str <> "/>"
  }
}

/// This creates a string that represents an anchor element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` href: The href of the anchor
///  - `@param` attributes: The attributes of the element
///  - `@param` child: The child of the element
///  - `@returns`: A string that represents the HTML element
pub fn a(
  id: id.Id,
  class: class.Class,
  href: String,
  attributes: List(Attribute),
  child: String,
) -> String {
  let att_str =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(a: Attribute) -> String {
        render_attribute(Attribute(
          illegal_string_check(a.key),
          illegal_string_check(a.value),
        ))
      },
    )
    |> string.join(" ")
  case class {
    class.Class(class) -> {
      let class = illegal_string_check(class)
      "<a href=\""
      <> href
      <> "\" class=\""
      <> class
      <> "\" "
      <> att_str
      <> ">"
      <> child
      <> "</a>"
    }
    class.Nil ->
      "<a href=\"" <> href <> "\" " <> att_str <> ">" <> child <> "</a>"
  }
}

/// This creates a string that represents an h1 element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` child: The child of the element
///  - `@returns`: A string that represents the HTML element
pub fn h1(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  child: String,
) -> String {
  let att_str =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(a: Attribute) -> String {
        render_attribute(Attribute(
          illegal_string_check(a.key),
          illegal_string_check(a.value),
        ))
      },
    )
    |> string.join(" ")
  case class {
    class.Class(class) -> {
      let class = illegal_string_check(class)
      "<h1 class=\"" <> class <> "\" " <> att_str <> ">" <> child <> "</h1>"
    }
    class.Nil -> "<h1 " <> att_str <> ">" <> child <> "</h1>"
  }
}

/// This creates a string that represents an h2 element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` child: The child of the element
///  - `@returns`: A string that represents the HTML element
pub fn h2(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  child: String,
) -> String {
  let att_str =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(a: Attribute) -> String {
        render_attribute(Attribute(
          illegal_string_check(a.key),
          illegal_string_check(a.value),
        ))
      },
    )
    |> string.join(" ")
  case class {
    class.Class(class) -> {
      let class = illegal_string_check(class)
      "<h2 class=\"" <> class <> "\" " <> att_str <> ">" <> child <> "</h2>"
    }
    class.Nil -> "<h2 " <> att_str <> ">" <> child <> "</h2>"
  }
}

/// This creates a string that represents an h3 element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` child: The child of the element
///  - `@returns`: A string that represents the HTML element
pub fn h3(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  child: String,
) -> String {
  let att_str =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(a: Attribute) -> String {
        render_attribute(Attribute(
          illegal_string_check(a.key),
          illegal_string_check(a.value),
        ))
      },
    )
    |> string.join(" ")
  case class {
    class.Class(class) -> {
      let class = illegal_string_check(class)
      "<h3 class=\"" <> class <> "\" " <> att_str <> ">" <> child <> "</h3>"
    }
    class.Nil -> "<h3 " <> att_str <> ">" <> child <> "</h3>"
  }
}

/// This creates a string that represents an h4 element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` child: The child of the element
///  - `@returns`: A string that represents the HTML element
pub fn h4(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  child: String,
) -> String {
  let att_str =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(a: Attribute) -> String {
        render_attribute(Attribute(
          illegal_string_check(a.key),
          illegal_string_check(a.value),
        ))
      },
    )
    |> string.join(" ")
  case class {
    class.Class(class) -> {
      let class = illegal_string_check(class)
      "<h4 class=\"" <> class <> "\" " <> att_str <> ">" <> child <> "</h4>"
    }
    class.Nil -> "<h4 " <> att_str <> ">" <> child <> "</h4>"
  }
}

/// This creates a string that represents an h5 element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` child: The child of the element
///  - `@returns`: A string that represents the HTML element
pub fn h5(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  child: String,
) -> String {
  let att_str =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(a: Attribute) -> String {
        render_attribute(Attribute(
          illegal_string_check(a.key),
          illegal_string_check(a.value),
        ))
      },
    )
    |> string.join(" ")
  case class {
    class.Class(class) -> {
      let class = illegal_string_check(class)
      "<h5 class=\"" <> class <> "\" " <> att_str <> ">" <> child <> "</h5>"
    }
    class.Nil -> "<h5 " <> att_str <> ">" <> child <> "</h5>"
  }
}

/// This creates a string that represents an h6 element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` child: The child of the element
///  - `@returns`: A string that represents the HTML element
pub fn h6(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  child: String,
) -> String {
  let att_str =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(a: Attribute) -> String {
        render_attribute(Attribute(
          illegal_string_check(a.key),
          illegal_string_check(a.value),
        ))
      },
    )
    |> string.join(" ")
  case class {
    class.Class(class) -> {
      let class = illegal_string_check(class)
      "<h6 class=\"" <> class <> "\" " <> att_str <> ">" <> child <> "</h6>"
    }
    class.Nil -> "<h6 " <> att_str <> ">" <> child <> "</h6>"
  }
}

/// This creates a string that represents a paragraph element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` child: The child of the element
///  - `@returns`: A string that represents the HTML element
pub fn p(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  child: String,
) -> String {
  let att_str =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(a: Attribute) -> String {
        render_attribute(Attribute(
          illegal_string_check(a.key),
          illegal_string_check(a.value),
        ))
      },
    )
    |> string.join(" ")
  case class {
    class.Class(class) -> {
      let class = illegal_string_check(class)
      "<p class=\"" <> class <> "\" " <> att_str <> ">" <> child <> "</p>"
    }
    class.Nil -> "<p " <> att_str <> ">" <> child <> "</p>"
  }
}

/// This creates a string that represents a span element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` child: The child of the element
///  - `@returns`: A string that represents the HTML element
pub fn span(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  child: String,
) -> String {
  let att_str =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(a: Attribute) -> String {
        render_attribute(Attribute(
          illegal_string_check(a.key),
          illegal_string_check(a.value),
        ))
      },
    )
    |> string.join(" ")
  case class {
    class.Class(class) -> {
      let class = illegal_string_check(class)
      "<span class=\"" <> class <> "\" " <> att_str <> ">" <> child <> "</span>"
    }
    class.Nil -> "<span " <> att_str <> ">" <> child <> "</span>"
  }
}

/// This creates a string that represents a list item element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` child: The child of the element
///  - `@returns`: A ListItem
pub fn li(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  child: String,
) -> ListItem {
  let att_str =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(a: Attribute) -> String {
        render_attribute(Attribute(
          illegal_string_check(a.key),
          illegal_string_check(a.value),
        ))
      },
    )
    |> string.join(" ")
  case class {
    class.Class(class) -> {
      let class = illegal_string_check(class)
      ListItem(
        "<li class=\"" <> class <> "\" " <> att_str <> ">" <> child <> "</li>",
      )
    }
    class.Nil -> ListItem("<li " <> att_str <> ">" <> child <> "</li>")
  }
}

/// This creates a string that represents an unordered list element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` children: a list of ListItems
///  - `@returns`: A string that represents the HTML element
pub fn ul(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  children: List(ListItem),
) -> String {
  let att_str =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(a: Attribute) -> String {
        render_attribute(Attribute(
          illegal_string_check(a.key),
          illegal_string_check(a.value),
        ))
      },
    )
    |> string.join(" ")
  let children_str =
    list.map(children, fn(list_item: ListItem) -> String {
      case list_item {
        ListItem(child) -> child
      }
    })
  case class {
    class.Class(class) -> {
      let class = illegal_string_check(class)
      "<ul class=\""
      <> class
      <> "\" "
      <> att_str
      <> ">"
      <> string.join(children_str, "")
      <> "</ul>"
    }
    class.Nil ->
      "<ul " <> att_str <> ">" <> string.join(children_str, "") <> "</ul>"
  }
}

/// This creates a string that represents an ordered list element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` children: a list of ListItems
///  - `@returns`: A string that represents the HTML element
pub fn ol(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  children: List(ListItem),
) -> String {
  let att_str =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(a: Attribute) -> String {
        render_attribute(Attribute(
          illegal_string_check(a.key),
          illegal_string_check(a.value),
        ))
      },
    )
    |> string.join(" ")
  let children_str =
    list.map(children, fn(list_item: ListItem) -> String {
      case list_item {
        ListItem(child) -> child
      }
    })
  case class {
    class.Class(class) -> {
      let class = illegal_string_check(class)
      "<ol class=\""
      <> class
      <> "\" "
      <> att_str
      <> ">"
      <> string.join(children_str, "")
      <> "</ol>"
    }
    class.Nil ->
      "<ol " <> att_str <> ">" <> string.join(children_str, "") <> "</ol>"
  }
}

/// This creates a string that represents a break element
///  - `@returns`: A string that represents the HTML element
pub fn br() -> String {
  "<br>"
}

/// This creates a string that represents a horizontal rule element
///  - `@returns`: A string that represents the HTML element
pub fn hr() -> String {
  "<hr>"
}

/// This creates a string that represents a script element
///  - `@param` src: The source of the script
///  - `@returns`: A Head
pub fn script(src: String) -> Head {
  let src = illegal_string_check(src)
  Script("<script src=\"" <> src <> "\"></script>")
}

/// This creates a string that represents a link element
///  - `@param` rel: The relationship of the link
///  - `@param` href: The href of the link
///  - `@param` attributes: The attributes of the link
///  - `@returns`: A Head
pub fn link(rel: String, href: String, attributes: List(Attribute)) -> Head {
  let att_str =
    list.map(attributes, fn(a: Attribute) -> String {
      render_attribute(Attribute(
        illegal_string_check(a.key),
        illegal_string_check(a.value),
      ))
    })
    |> string.join(" ")
  let rel = illegal_string_check(rel)
  let href = illegal_string_check(href)
  Link("<link rel=\"" <> rel <> "\" href=\"" <> href <> "\" " <> att_str <> ">")
}

/// This creates a string that represents a special link element for stylesheets
///  - `@param` src: The source of the stylesheet
///  - `@returns`: A Head
pub fn style(src: String) -> Head {
  let src = illegal_string_check(src)
  Style("<link rel=\"stylesheet\" href=\"" <> src <> "\">")
}

/// This creates a string that represents a meta element
///  - `@param` name: The name of the meta
///  - `@param` content: The content of the meta
///  - `@returns`: A Head
pub fn meta(name: String, content: String) -> Head {
  let name = illegal_string_check(name)
  Meta("<meta name=\"" <> name <> "\" content=\"" <> content <> "\">")
}

/// This creates a string that represents a title element
///  - `@param` content: The content of the title
///  - `@returns`: A Head
pub fn title(content: String) -> Head {
  let content = illegal_string_check(content)
  Title("<title>" <> content <> "</title>")
}

/// This creates a string that represents the head of an HTML document
///  - `@param` children: A list of Head elements
///  - `@returns`: A string that represents the HTML element
pub fn head(children: List(Head)) -> String {
  "<head>"
  <> string.join(
    list.map(children, fn(head: Head) -> String {
      case head {
        Meta(meta) -> meta
        Title(title) -> title
        Link(link) -> link
        Style(style) -> style
        Script(script) -> script
      }
    }),
    "",
  )
  <> "</head>"
}

/// This creates a string that represents the body of an HTML document
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` children: The children of the element
///  - `@returns`: A string that represents the HTML element
pub fn body(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  children: String,
) -> String {
  let att_str =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(a: Attribute) -> String {
        render_attribute(Attribute(
          illegal_string_check(a.key),
          illegal_string_check(a.value),
        ))
      },
    )
    |> string.join(" ")

  case class {
    class.Class(class) -> {
      let class = illegal_string_check(class)
      "<body class=\""
      <> class
      <> "\" "
      <> att_str
      <> ">"
      <> children
      <> "</body>"
    }
    class.Nil -> "<body " <> att_str <> ">" <> children <> "</body>"
  }
}

/// This creates a string that represents an HTML document
///  - `@param` lang: The language of the document
///  - `@param` children: The children of the document
///  - `@returns`: A string that represents the HTML element
pub fn html(lang: String, children: String) -> Html {
  let lang = illegal_string_check(lang)
  Html("<!DOCTYPE html><html lang=\"" <> lang <> "\">" <> children <> "</html>")
}

/// This creates a string that represents a component
///  - `@param` content: The content of the component
///  - `@returns`: A Component
pub fn component(content: String) -> Html {
  Component(content)
}

/// This creates a string that represents an input element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` input_type: The type of the input
///  - `@param` placeholder: The placeholder of the input
///  - `@returns`: An Input
pub fn input(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  input_type: input.InputType,
  placeholder: String,
) -> Input {
  let att_str =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(a: Attribute) -> String {
        render_attribute(Attribute(
          illegal_string_check(a.key),
          illegal_string_check(a.value),
        ))
      },
    )
    |> string.join(" ")

  Input(case class {
    class.Class(class) -> {
      let class = illegal_string_check(class)
      "<input "
      <> input.input_type_to_attribute(input_type)
      <> " placeholder=\""
      <> placeholder
      <> "\" class=\""
      <> class
      <> "\" "
      <> att_str
      <> "/>"
    }
    class.Nil ->
      "<input "
      <> input.input_type_to_attribute(input_type)
      <> " placeholder=\""
      <> placeholder
      <> "\" "
      <> att_str
      <> "/>"
  })
}

/// This creates a string that represents a label element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` child: The child of the element
///  - `@returns`: An Input
pub fn label(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  child: String,
) -> Input {
  let att_str =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(a: Attribute) -> String {
        render_attribute(Attribute(
          illegal_string_check(a.key),
          illegal_string_check(a.value),
        ))
      },
    )
    |> string.join(" ")

  Label(case class {
    class.Class(class) -> {
      let class = illegal_string_check(class)
      "<label class=\""
      <> class
      <> "\" "
      <> att_str
      <> ">"
      <> child
      <> "</label>"
    }
    class.Nil -> "<label " <> att_str <> ">" <> child <> "</label>"
  })
}

/// This creates a string that represents a form element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` children: The children of the element
///  - `@returns`: A string that represents the HTML element
pub fn form(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  children: List(Input),
) -> String {
  let att_str =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(a: Attribute) -> String {
        render_attribute(Attribute(
          illegal_string_check(a.key),
          illegal_string_check(a.value),
        ))
      },
    )
    |> string.join(" ")

  let children_str =
    list.map(children, fn(input: Input) -> String {
      case input {
        Input(child) -> child
        Element(child) -> child
        Label(child) -> child
      }
    })

  case class {
    class.Class(class) -> {
      let class = illegal_string_check(class)
      "<form class=\""
      <> class
      <> "\" "
      <> att_str
      <> ">"
      <> string.join(children_str, "")
      <> "</form>"
    }
    class.Nil ->
      "<form " <> att_str <> ">" <> string.join(children_str, "") <> "</form>"
  }
}

/// This creates a string that represents a header element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` children: The children of the element
///  - `@returns`: A string that represents the HTML element
pub fn header(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  children: String,
) -> String {
  let att_str =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(a: Attribute) -> String {
        render_attribute(Attribute(
          illegal_string_check(a.key),
          illegal_string_check(a.value),
        ))
      },
    )
    |> string.join(" ")

  case class {
    class.Class(class) -> {
      let class = illegal_string_check(class)
      "<header class=\""
      <> class
      <> "\" "
      <> att_str
      <> ">"
      <> children
      <> "</header>"
    }
    class.Nil -> "<header " <> att_str <> ">" <> children <> "</header>"
  }
}

/// This creates a string that represents a footer element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` children: The children of the element
///  - `@returns`: A string that represents the HTML element
pub fn footer(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  children: String,
) -> String {
  let att_str =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(a: Attribute) -> String {
        render_attribute(Attribute(
          illegal_string_check(a.key),
          illegal_string_check(a.value),
        ))
      },
    )
    |> string.join(" ")

  case class {
    class.Class(class) -> {
      let class = illegal_string_check(class)
      "<footer class=\""
      <> class
      <> "\" "
      <> att_str
      <> ">"
      <> children
      <> "</footer>"
    }
    class.Nil -> "<footer " <> att_str <> ">" <> children <> "</footer>"
  }
}

/// This creates a string that represents a nav element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` children: The children of the element
///  - `@returns`: A string that represents the HTML element
pub fn nav(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  children: String,
) -> String {
  let att_str =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(a: Attribute) -> String {
        render_attribute(Attribute(
          illegal_string_check(a.key),
          illegal_string_check(a.value),
        ))
      },
    )
    |> string.join(" ")

  case class {
    class.Class(class) -> {
      let class = illegal_string_check(class)
      "<nav class=\""
      <> class
      <> "\" "
      <> att_str
      <> ">"
      <> children
      <> "</nav>"
    }
    class.Nil -> "<nav " <> att_str <> ">" <> children <> "</nav>"
  }
}

/// This creates a string that represents a section element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` children: The children of the element
///  - `@returns`: A string that represents the HTML element
pub fn section(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  children: String,
) -> String {
  let att_str =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(a: Attribute) -> String {
        render_attribute(Attribute(
          illegal_string_check(a.key),
          illegal_string_check(a.value),
        ))
      },
    )
    |> string.join(" ")

  case class {
    class.Class(class) -> {
      let class = illegal_string_check(class)
      "<section class=\""
      <> class
      <> "\" "
      <> att_str
      <> ">"
      <> children
      <> "</section>"
    }
    class.Nil -> "<section " <> att_str <> ">" <> children <> "</section>"
  }
}

/// This creates a string that represents an article element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` children: The children of the element
///  - `@returns`: A string that represents the HTML element
pub fn article(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  children: String,
) -> String {
  let att_str =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(a: Attribute) -> String {
        render_attribute(Attribute(
          illegal_string_check(a.key),
          illegal_string_check(a.value),
        ))
      },
    )
    |> string.join(" ")

  case class {
    class.Class(class) -> {
      let class = illegal_string_check(class)
      "<article class=\""
      <> class
      <> "\" "
      <> att_str
      <> ">"
      <> children
      <> "</article>"
    }
    class.Nil -> "<article " <> att_str <> ">" <> children <> "</article>"
  }
}

/// This creates a string that represents an aside element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` children: The children of the element
///  - `@returns`: A string that represents the HTML element
pub fn aside(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  children: String,
) -> String {
  let att_str =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(a: Attribute) -> String {
        render_attribute(Attribute(
          illegal_string_check(a.key),
          illegal_string_check(a.value),
        ))
      },
    )
    |> string.join(" ")

  case class {
    class.Class(class) -> {
      let class = illegal_string_check(class)
      "<aside class=\""
      <> class
      <> "\" "
      <> att_str
      <> ">"
      <> children
      <> "</aside>"
    }
    class.Nil -> "<aside " <> att_str <> ">" <> children <> "</aside>"
  }
}

/// This creates a string that represents a main element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` children: The children of the element
///  - `@returns`: A string that represents the HTML element
pub fn main(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  children: String,
) -> String {
  let att_str =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(a: Attribute) -> String {
        render_attribute(Attribute(
          illegal_string_check(a.key),
          illegal_string_check(a.value),
        ))
      },
    )
    |> string.join(" ")

  case class {
    class.Class(class) -> {
      let class = illegal_string_check(class)
      "<main class=\""
      <> class
      <> "\" "
      <> att_str
      <> ">"
      <> children
      <> "</main>"
    }
    class.Nil -> "<main " <> att_str <> ">" <> children <> "</main>"
  }
}

/// This creates a string that represents a button element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` children: The children of the element
///  - `@returns`: A string that represents the HTML element
pub fn button(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  children: String,
) -> String {
  let att_str =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(a: Attribute) -> String {
        render_attribute(Attribute(
          illegal_string_check(a.key),
          illegal_string_check(a.value),
        ))
      },
    )
    |> string.join(" ")

  case class {
    class.Class(class) -> {
      let class = illegal_string_check(class)
      "<button class=\""
      <> class
      <> "\" "
      <> att_str
      <> ">"
      <> children
      <> "</button>"
    }
    class.Nil -> "<button " <> att_str <> ">" <> children <> "</button>"
  }
}

/// This creates a string that represents a select element
///  - `@param` id: The id of the element
///  - `@param` class: The class of the element
///  - `@param` attributes: The attributes of the element
///  - `@param` options: The options of the select
///  - `@returns`: A string that represents the HTML element
pub fn select(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  options: List(Option),
) -> String {
  let att_str =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(a: Attribute) -> String {
        render_attribute(Attribute(
          illegal_string_check(a.key),
          illegal_string_check(a.value),
        ))
      },
    )
    |> string.join(" ")

  let options_str =
    list.map(options, fn(option: Option) -> String {
      case option {
        Option(child) -> child
      }
    })

  case class {
    class.Class(class) -> {
      // remove possible xss attack
      let class = illegal_string_check(class)
      "<select class=\""
      <> class
      <> "\" "
      <> att_str
      <> ">"
      <> string.join(options_str, "")
      <> "</select>"
    }
    class.Nil ->
      "<select "
      <> att_str
      <> ">"
      <> string.join(options_str, "")
      <> "</select>"
  }
}

/// This creates a string that represents an option element
///  - `@param` value: The value of the option
///  - `@param` children: The children of the option
///  - `@returns`: An Option
pub fn option(value: String, children: String) -> Option {
  let value = illegal_string_check(value)
  Option("<option value=\"" <> value <> "\">" <> children <> "</option>")
}
