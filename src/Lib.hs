module Lib
  ( someFunc,
    lolfunc,
    addition,
    helloHandler,
    noHandler,
  )
where

someFunc :: IO ()
someFunc = putStrLn "someFunc"

lolfunc :: String -> IO ()
lolfunc lol = putStrLn lol

addition :: Int -> Int -> Int
addition a b = (+) a b

helloHandler :: String
helloHandler = "lol"

noHandler :: String
noHandler = "nonononono"