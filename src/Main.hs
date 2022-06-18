module Main where

import Web.Scotty
import Routes

main :: IO ()
main = do
  putStrLn "Starting Server..."
  scotty 8888 routes 