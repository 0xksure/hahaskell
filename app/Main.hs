module Main where

import Control.Monad
import Happstack.Server (dir, nullConf, ok, simpleHTTP)
import Lib (addition, helloHandler, lolfunc, noHandler)
import System.Environment (getArgs)

main :: IO ()
main = simpleHTTP nullConf $ msum [dir "hello" $ ok noHandler, dir "no" $ ok helloHandler]
