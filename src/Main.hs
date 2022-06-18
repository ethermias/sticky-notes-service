module Main where

import Web.Scotty
import Content
import Swagger

main :: IO ()
main = do
  putStrLn "Starting Server..."
  scotty 8888 routes
 
routes :: ScottyM ()
routes = do
  get "/swagger" $ do
    json allSwaggers
  get "/version" $ do
    text "0.0.1"
  get "/contents" $ do
    json allContents
  get "/contents/:contId" $ do
    contId <- param "contId"
    json (filter (matchesId contId) allContents)  