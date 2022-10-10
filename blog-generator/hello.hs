-- hello.hs

import Html

main :: IO ()
main = putStrLn (render myHtml)


myHtml :: Html
myHtml = html_
  "Hello World Title"
  ( append_
    (h1_ "Hello, World")
    ( append_
      (p_ "Let's learn some Haskell! (which will probably read with a lisp)")
      (p_ "And try to make a blog generator.")
    ))
