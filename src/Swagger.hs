module Swagger where

import Data.Aeson (ToJSON)
import GHC.Generics

data Swagger = Swagger { method :: String, api :: String, description :: String, response :: String} deriving (Show, Generic)
instance ToJSON Swagger

allSwaggers :: [Swagger]
allSwaggers = [ 
  Swagger { method = "GET", api = "/swagger", description = "swagger", response = "All swagger info is below"},
  Swagger { method = "GET", api = "/version", description = "version info", response = "0.0.1"},
  Swagger { method = "GET", api = "/contents", description = "version info", response = "[{ contentId: 1, desc: The Cases of Pronouns}, { contentId: 8, desc: General Observations about Pronouns}]"}, 
  Swagger { method = "GET", api = "/contents/1", description = "version info", response = "{ contentId: 8, desc: General Observations about Pronouns}"}
  ]