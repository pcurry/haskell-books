main = putStrLn myHtml

myHtml = makeHtml "Hello World Title" "Hello, World"

wrapHtml :: String -> String
wrapHtml content = html_ (body_ content)

html_ :: String -> String
html_ content = "<html>" <> content <> "</html>"

body_ :: String -> String
body_ content = "<body>" <> content <> "</body>"

head_ :: String -> String
head_ content = "<head>" <> content <> "</head>"

title_ :: String -> String
title_ content = "<title>" <> content <> "</title>"


makeHtml :: String -> String -> String
makeHtml title body = html_ (head_ (title_ title) <> (body_ body))

el :: String -> String -> String
el tag content = "<" <> tag <> ">" <> content <> "</" <> tag <> ">"

