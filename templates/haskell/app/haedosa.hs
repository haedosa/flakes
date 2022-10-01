
module Main where

import Haedosa (who)

main :: IO ()
main = print $ "Hello " ++ who ++ "!"
