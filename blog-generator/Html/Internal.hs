-- Html/Internal.hs

module Html.Internal where


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
      ( el "head" ( el "title" (escape title))
        <> el "body" (getStructureString body)))


tag_escaped :: String -> String -> Structure
tag_escaped tag = Structure . el tag . escape

p_ :: String -> Structure
p_ = tag_escaped "p"

h1_ :: String -> Structure
h1_ = tag_escaped "h1"

code_ :: String -> Structure
code_ = tag_escaped "pre"

escape :: String -> String
escape =
  let
    escapeChar c =
      case c of
        '<'  -> "&lt;"
        '>'  -> "&gt;"
        '&'  -> "&amp;"
        '"'  -> "&quot;"
        '\'' -> "&#39;"
        _    -> [c]
  in
    concat . map escapeChar


lister :: String -> String -> [Structure] -> Structure
lister listtype element = Structure . el listtype . concat . map (el element . getStructureString)


ul :: [Structure] -> Structure
ul = lister "ul" "li"


ol :: [Structure] -> Structure
ol = lister "ol" "li"

dl :: [Structure] -> Structure
dl = lister "dl" "dd"

