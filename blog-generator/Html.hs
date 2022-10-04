module Html
  ( Html
  , Title
  , Structure
  , html_
  , p_
  , h1_
  , append_
  , render
  )
  where


type Title = String

newtype Html = Html String

render :: Html -> String
render html =
  case html of
    Html str -> str


newtype Structure = Structure String

getStructureString :: Structure -> String
getStructureString struct =
  case struct of
    Structure str -> str

append_ :: Structure -> Structure -> Structure
append_ (Structure x) (Structure y) =
  Structure (x <> y)


el :: String -> String -> String
el tag content = "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

html_ :: Title -> Structure -> Html
html_ title body =
  Html
    ( el "html"
      ( el "head" ( el "title" title)
        <> el "body" (getStructureString body)))

p_ :: String -> Structure
p_ = Structure . el "p"

h1_ :: String -> Structure
h1_ = Structure . el "h1"
