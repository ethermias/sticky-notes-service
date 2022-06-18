module Main where

import Data.Aeson (FromJSON, ToJSON)
import GHC.Generics
import Web.Scotty

main :: IO ()
main = do
  putStrLn "Starting Server..."
  scotty 8888 routes

data Content = Content { contentId :: Int, desc :: String } deriving (Show, Generic)
instance ToJSON Content
instance FromJSON Content



c1 :: Content
c1 = Content { contentId = 1, desc = "Classifying Pronouns"}
c2 :: Content
c2 = Content { contentId = 2, desc = "Recognizing the Various Types of Pronouns"}
c3 :: Content
c3 = Content { contentId = 3, desc = "The Cases of Pronouns"}
c4 :: Content
c4 = Content { contentId = 4, desc = "Pronouns as Nominals"}
c5 :: Content
c5 = Content { contentId = 5, desc = "pronouns after As, Than, and But"}
c6 :: Content
c6 = Content { contentId = 6, desc = "Selecting the Correct Pronoun"}
c7 :: Content
c7 = Content { contentId = 7, desc = "Pronoun Reference"}
c8 :: Content
c8 = Content { contentId = 8, desc = "General Observations about Pronouns"}

allContents :: [Content]
allContents = [ c1, c2, c3, c4, c5, c6, c7, c8 ]

matchesId :: Int -> Content -> Bool
matchesId contId content = contentId content == contId


data Swagger = Swagger { method :: String, api :: String, description :: String, response :: String} deriving (Show, Generic)
instance ToJSON Swagger

s1 :: Swagger
s1 = Swagger { method = "GET", api = "/swagger", description = "swagger", response = "All swagger info is below"}
s2 :: Swagger
s2 = Swagger { method = "GET", api = "/version", description = "version info", response = "0.0.1"}
s3 :: Swagger
s3 = Swagger { method = "GET", api = "/contents", description = "version info", response = "[{ contentId: 1, desc: The Cases of Pronouns}, { contentId: 8, desc: General Observations about Pronouns}]"}
s4 :: Swagger
s4 = Swagger { method = "GET", api = "/contents/1", description = "version info", response = "{ contentId: 8, desc: General Observations about Pronouns}"}

allSwaggers :: [Swagger]
allSwaggers = [ s1 , s2, s3, s4]

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
