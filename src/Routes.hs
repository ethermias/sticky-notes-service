module Routes where

import Web.Scotty
import Content
import Swagger
import qualified Data.Text.Lazy as T
 
routes :: String -> ScottyM ()
routes name = do
  get "/" $ text $ T.pack name
  get "/swagger" $ json allSwaggers
  get "/version" $ text "0.0.1"
  get "/contents" $ json allContents
  get "/contents/:contId" $ do
    contId <- param "contId"
    json (filter (matchesId contId) allContents)  
  