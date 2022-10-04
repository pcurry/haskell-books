-- hello.hs

import Html

main :: IO ()
main = putStrLn (render myHtml)


myHtml :: Html
myHtml = html_
  "Hello World Title"
  (append_ (h1_ "Hello, World") (p_ "Let's learn some Haskell!"))


