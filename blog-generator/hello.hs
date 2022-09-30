main = putStrLn myHtml

newtype Html = Html String

newtype Structure = Structure String

getStructureString :: Structure -> String
getStructureString struct =
  case struct of
    Structure str -> str

append_ :: Structure -> Structure -> Structure
append_ (Structure x) (Structure y) =
  Structure (x <> y)


myHtml = makeHtml
  "Hello World Title"
  (getStructureString (append_ (h1_ "Hello, World") (p_ "Let's learn some Haskell!")))

wrapHtml :: String -> String
wrapHtml content = html_ (body_ content)

html_ :: String -> String
html_ = el "html"

body_ :: String -> String
body_ = el "body"

head_ :: String -> String
head_ = el "head"

title_ :: String -> String
title_ = el "title"

p_ :: String -> Structure
p_ = Structure . el "p"

h1_ :: String -> Structure
h1_ = Structure . el "h1"


makeHtml :: String -> String -> String
makeHtml title body =
  html_ (head_ (title_ title) <> body_ body)


el :: String -> String -> String
el tag content = "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

