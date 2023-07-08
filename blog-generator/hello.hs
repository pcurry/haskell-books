-- hello.hs

import Html
import Markup


main :: IO ()
main = putStrLn (render myHtml)


myHtml :: Html
myHtml = html_
  "Hello World Title"
  ( <>
    (h1_ "Hello, World")
    ( <>
      (p_ "Let's learn some Haskell! (which will probably read with a lisp)")
      (p_ "And try to make a blog generator.")
    ))

example1 :: Document
example1 =
  [ Paragraph "Hello, world!"
  ]

example2 :: Document
example2 =
  [ Heading 1 "Welcome"
  , Paragraph "To this tutorial about Haskell."
  ]

example3 :: Document
example3 =
  [ Paragraph "Remember that multiple lines with no separation are grouped together into a single paragraph but list items remain separate."
  , OrderedList
    [ "Item 1 of a list"
    , "Item 2 of a list"
    ]
  ]
  
example4 :: Document
example4 =
  [ Heading 1 "Compiling programs with ghc"
  , Paragraph "Running ghc invokes the Glasgow Haskell Compiler (GHC), and can be used to compile Haskell modules and programs into native executables and libraries."
  , Paragraph "Create a new Haskell source file named hello.hs, and write  the following code in it:"
  ]
