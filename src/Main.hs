module Main where

import Web.Scotty

main :: IO ()
main = do
  putStrLn "Starting Server..."
  scotty 8188 routes

 
routes :: ScottyM ()
routes = do
  get "/version" $ do
    text "0.0.1"
