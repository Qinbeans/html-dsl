import gleam/list
import gleam/string
import types/class
import types/id
import types/input

pub type Attribute {
  Attribute(String, String)
}

pub type ListItem {
  ListItem(String)
}

pub type Input {
  Input(String)
  Label(String)
  Element(String)
}

pub type Html {
  Html(String)
  Component(String)
}

pub type Head {
  Meta(String)
  Title(String)
  Link(String)
  Style(String)
  Script(String)
}

pub fn attribute(key: String, value: String) -> Attribute {
  Attribute(key, value)
}

pub fn render_attribute(attribute: Attribute) -> String {
  let Attribute(key, value) = attribute
  key <> "=\"" <> value <> "\""
}

// This creates a string that represents the HTML element
pub fn div(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  child: String,
) -> String {
  // I'm too lazy, so I'm going to add id to the attributes list
  let att =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(attribute: Attribute) -> String { render_attribute(attribute) },
    )

  let att_str = string.join(att, " ")
  case class {
    class.Class(class) ->
      "<div class=\"" <> class <> "\" " <> att_str <> ">" <> child <> "</div>"
    class.Nil -> "<div " <> att_str <> ">" <> child <> "</div>"
  }
}

pub fn img(
  id: id.Id,
  class: class.Class,
  src: String,
  alt: String,
  attributes: List(Attribute),
) -> String {
  let att =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(attribute: Attribute) -> String { render_attribute(attribute) },
    )

  let att_str = string.join(att, " ")
  case class {
    class.Class(class) ->
      "<img src=\""
      <> src
      <> "\" alt=\""
      <> alt
      <> "\" class=\""
      <> class
      <> "\" "
      <> att_str
      <> "/>"
    class.Nil ->
      "<img src=\"" <> src <> "\" alt=\"" <> alt <> "\" " <> att_str <> "/>"
  }
}

pub fn a(
  id: id.Id,
  class: class.Class,
  href: String,
  attributes: List(Attribute),
  child: String,
) -> String {
  let att =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(attribute: Attribute) -> String { render_attribute(attribute) },
    )

  let att_str = string.join(att, " ")
  case class {
    class.Class(class) ->
      "<a href=\""
      <> href
      <> "\" class=\""
      <> class
      <> "\" "
      <> att_str
      <> ">"
      <> child
      <> "</a>"
    class.Nil ->
      "<a href=\"" <> href <> "\" " <> att_str <> ">" <> child <> "</a>"
  }
}

pub fn h1(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  child: String,
) -> String {
  let att =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(attribute: Attribute) -> String { render_attribute(attribute) },
    )

  let att_str = string.join(att, " ")
  case class {
    class.Class(class) ->
      "<h1 class=\"" <> class <> "\" " <> att_str <> ">" <> child <> "</h1>"
    class.Nil -> "<h1 " <> att_str <> ">" <> child <> "</h1>"
  }
}

pub fn h2(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  child: String,
) -> String {
  let att =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(attribute: Attribute) -> String { render_attribute(attribute) },
    )

  let att_str = string.join(att, " ")
  case class {
    class.Class(class) ->
      "<h2 class=\"" <> class <> "\" " <> att_str <> ">" <> child <> "</h2>"
    class.Nil -> "<h2 " <> att_str <> ">" <> child <> "</h2>"
  }
}

pub fn h3(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  child: String,
) -> String {
  let att =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(attribute: Attribute) -> String { render_attribute(attribute) },
    )

  let att_str = string.join(att, " ")
  case class {
    class.Class(class) ->
      "<h3 class=\"" <> class <> "\" " <> att_str <> ">" <> child <> "</h3>"
    class.Nil -> "<h3 " <> att_str <> ">" <> child <> "</h3>"
  }
}

pub fn h4(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  child: String,
) -> String {
  let att =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(attribute: Attribute) -> String { render_attribute(attribute) },
    )

  let att_str = string.join(att, " ")
  case class {
    class.Class(class) ->
      "<h4 class=\"" <> class <> "\" " <> att_str <> ">" <> child <> "</h4>"
    class.Nil -> "<h4 " <> att_str <> ">" <> child <> "</h4>"
  }
}

pub fn h5(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  child: String,
) -> String {
  let att =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(attribute: Attribute) -> String { render_attribute(attribute) },
    )

  let att_str = string.join(att, " ")
  case class {
    class.Class(class) ->
      "<h5 class=\"" <> class <> "\" " <> att_str <> ">" <> child <> "</h5>"
    class.Nil -> "<h5 " <> att_str <> ">" <> child <> "</h5>"
  }
}

pub fn h6(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  child: String,
) -> String {
  let att =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(attribute: Attribute) -> String { render_attribute(attribute) },
    )

  let att_str = string.join(att, " ")
  case class {
    class.Class(class) ->
      "<h6 class=\"" <> class <> "\" " <> att_str <> ">" <> child <> "</h6>"
    class.Nil -> "<h6 " <> att_str <> ">" <> child <> "</h6>"
  }
}

pub fn p(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  child: String,
) -> String {
  let att =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(attribute: Attribute) -> String { render_attribute(attribute) },
    )

  let att_str = string.join(att, " ")
  case class {
    class.Class(class) ->
      "<p class=\"" <> class <> "\" " <> att_str <> ">" <> child <> "</p>"
    class.Nil -> "<p " <> att_str <> ">" <> child <> "</p>"
  }
}

pub fn span(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  child: String,
) -> String {
  let att =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(attribute: Attribute) -> String { render_attribute(attribute) },
    )

  let att_str = string.join(att, " ")
  case class {
    class.Class(class) ->
      "<span class=\"" <> class <> "\" " <> att_str <> ">" <> child <> "</span>"
    class.Nil -> "<span " <> att_str <> ">" <> child <> "</span>"
  }
}

pub fn li(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  child: String,
) -> ListItem {
  let att =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(attribute: Attribute) -> String { render_attribute(attribute) },
    )

  let att_str = string.join(att, " ")
  case class {
    class.Class(class) ->
      ListItem(
        "<li class=\"" <> class <> "\" " <> att_str <> ">" <> child <> "</li>",
      )
    class.Nil -> ListItem("<li " <> att_str <> ">" <> child <> "</li>")
  }
}

pub fn ul(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  children: List(ListItem),
) -> String {
  let att =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(attribute: Attribute) -> String { render_attribute(attribute) },
    )

  let att_str = string.join(att, " ")
  let children_str =
    list.map(children, fn(list_item: ListItem) -> String {
      case list_item {
        ListItem(child) -> child
      }
    })
  case class {
    class.Class(class) ->
      "<ul class=\""
      <> class
      <> "\" "
      <> att_str
      <> ">"
      <> string.join(children_str, "")
      <> "</ul>"
    class.Nil ->
      "<ul " <> att_str <> ">" <> string.join(children_str, "") <> "</ul>"
  }
}

pub fn ol(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  children: List(ListItem),
) -> String {
  let att =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(attribute: Attribute) -> String { render_attribute(attribute) },
    )

  let att_str = string.join(att, " ")
  let children_str =
    list.map(children, fn(list_item: ListItem) -> String {
      case list_item {
        ListItem(child) -> child
      }
    })
  case class {
    class.Class(class) ->
      "<ol class=\""
      <> class
      <> "\" "
      <> att_str
      <> ">"
      <> string.join(children_str, "")
      <> "</ol>"
    class.Nil ->
      "<ol " <> att_str <> ">" <> string.join(children_str, "") <> "</ol>"
  }
}

pub fn br() -> String {
  "<br>"
}

pub fn hr() -> String {
  "<hr>"
}

pub fn script(src: String) -> Head {
  Script("<script src=\"" <> src <> "\"></script>")
}

pub fn link(rel: String, href: String, attributes: List(Attribute)) -> Head {
  let att =
    list.map(attributes, fn(attribute: Attribute) -> String {
      render_attribute(attribute)
    })
    |> string.join(" ")
  Link("<link rel=\"" <> rel <> "\" href=\"" <> href <> "\" " <> att <> ">")
}

pub fn style(src: String) -> Head {
  Style("<link rel=\"stylesheet\" href=\"" <> src <> "\">")
}

pub fn meta(name: String, content: String) -> Head {
  Meta("<meta name=\"" <> name <> "\" content=\"" <> content <> "\">")
}

pub fn title(content: String) -> Head {
  Title("<title>" <> content <> "</title>")
}

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

pub fn body(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  children: String,
) -> String {
  let att =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(attribute: Attribute) -> String { render_attribute(attribute) },
    )

  let att_str = string.join(att, " ")
  case class {
    class.Class(class) ->
      "<body class=\""
      <> class
      <> "\" "
      <> att_str
      <> ">"
      <> children
      <> "</body>"
    class.Nil -> "<body " <> att_str <> ">" <> children <> "</body>"
  }
}

pub fn html(lang: String, children: String) -> Html {
  Html("<!DOCTYPE html><html lang=\"" <> lang <> "\">" <> children <> "</html>")
}

pub fn input(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  input_type: input.InputType,
  placeholder: String,
) -> Input {
  let att =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(attribute: Attribute) -> String { render_attribute(attribute) },
    )

  let att_str = string.join(att, " ")

  Input(case class {
    class.Class(class) ->
      "<input "
      <> input.input_type_to_attribute(input_type)
      <> " placeholder=\""
      <> placeholder
      <> "\" class=\""
      <> class
      <> "\" "
      <> att_str
      <> "/>"
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

pub fn label(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  child: String,
) -> Input {
  let att =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(attribute: Attribute) -> String { render_attribute(attribute) },
    )

  let att_str = string.join(att, " ")

  Label(case class {
    class.Class(class) ->
      "<label class=\""
      <> class
      <> "\" "
      <> att_str
      <> ">"
      <> child
      <> "</label>"
    class.Nil -> "<label " <> att_str <> ">" <> child <> "</label>"
  })
}

pub fn form(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  children: List(Input),
) -> String {
  let att =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(attribute: Attribute) -> String { render_attribute(attribute) },
    )

  let att_str = string.join(att, " ")

  let children_str =
    list.map(children, fn(input: Input) -> String {
      case input {
        Input(child) -> child
        Element(child) -> child
        Label(child) -> child
      }
    })

  case class {
    class.Class(class) ->
      "<form class=\""
      <> class
      <> "\" "
      <> att_str
      <> ">"
      <> string.join(children_str, "")
      <> "</form>"
    class.Nil ->
      "<form " <> att_str <> ">" <> string.join(children_str, "") <> "</form>"
  }
}

pub fn header(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  children: String,
) -> String {
  let att =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(attribute: Attribute) -> String { render_attribute(attribute) },
    )

  let att_str = string.join(att, " ")

  case class {
    class.Class(class) ->
      "<header class=\""
      <> class
      <> "\" "
      <> att_str
      <> ">"
      <> children
      <> "</header>"
    class.Nil -> "<header " <> att_str <> ">" <> children <> "</header>"
  }
}

pub fn footer(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  children: String,
) -> String {
  let att =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(attribute: Attribute) -> String { render_attribute(attribute) },
    )

  let att_str = string.join(att, " ")

  case class {
    class.Class(class) ->
      "<footer class=\""
      <> class
      <> "\" "
      <> att_str
      <> ">"
      <> children
      <> "</footer>"
    class.Nil -> "<footer " <> att_str <> ">" <> children <> "</footer>"
  }
}

pub fn nav(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  children: String,
) -> String {
  let att =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(attribute: Attribute) -> String { render_attribute(attribute) },
    )

  let att_str = string.join(att, " ")

  case class {
    class.Class(class) ->
      "<nav class=\""
      <> class
      <> "\" "
      <> att_str
      <> ">"
      <> children
      <> "</nav>"
    class.Nil -> "<nav " <> att_str <> ">" <> children <> "</nav>"
  }
}

pub fn section(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  children: String,
) -> String {
  let att =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(attribute: Attribute) -> String { render_attribute(attribute) },
    )

  let att_str = string.join(att, " ")

  case class {
    class.Class(class) ->
      "<section class=\""
      <> class
      <> "\" "
      <> att_str
      <> ">"
      <> children
      <> "</section>"
    class.Nil -> "<section " <> att_str <> ">" <> children <> "</section>"
  }
}

pub fn article(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  children: String,
) -> String {
  let att =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(attribute: Attribute) -> String { render_attribute(attribute) },
    )

  let att_str = string.join(att, " ")

  case class {
    class.Class(class) ->
      "<article class=\""
      <> class
      <> "\" "
      <> att_str
      <> ">"
      <> children
      <> "</article>"
    class.Nil -> "<article " <> att_str <> ">" <> children <> "</article>"
  }
}

pub fn aside(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  children: String,
) -> String {
  let att =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(attribute: Attribute) -> String { render_attribute(attribute) },
    )

  let att_str = string.join(att, " ")

  case class {
    class.Class(class) ->
      "<aside class=\""
      <> class
      <> "\" "
      <> att_str
      <> ">"
      <> children
      <> "</aside>"
    class.Nil -> "<aside " <> att_str <> ">" <> children <> "</aside>"
  }
}

pub fn main(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  children: String,
) -> String {
  let att =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(attribute: Attribute) -> String { render_attribute(attribute) },
    )

  let att_str = string.join(att, " ")

  case class {
    class.Class(class) ->
      "<main class=\""
      <> class
      <> "\" "
      <> att_str
      <> ">"
      <> children
      <> "</main>"
    class.Nil -> "<main " <> att_str <> ">" <> children <> "</main>"
  }
}

pub fn button(
  id: id.Id,
  class: class.Class,
  attributes: List(Attribute),
  children: String,
) -> String {
  let att =
    list.map(
      case id {
        id.Id(id) -> list.append(attributes, [Attribute("id", id)])
        id.Nil -> attributes
      },
      fn(attribute: Attribute) -> String { render_attribute(attribute) },
    )

  let att_str = string.join(att, " ")

  case class {
    class.Class(class) ->
      "<button class=\""
      <> class
      <> "\" "
      <> att_str
      <> ">"
      <> children
      <> "</button>"
    class.Nil -> "<button " <> att_str <> ">" <> children <> "</button>"
  }
}
