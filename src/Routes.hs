module Routes where

import Web.Scotty
import Content
import Swagger
import qualified Data.Text.Lazy as T
 
import Data.Aeson (FromJSON, ToJSON)
import GHC.Generics

routes :: [String] -> ScottyM ()
routes name = do
  get "/" $ do
            json $ listOfTuple $ fromList name
  get "/swagger" $ json allSwaggers
  get "/version" $ text "0.0.1"
  get "/contents" $ json allContents
  get "/contents/:contId" $ do
    contId <- param "contId"
    json (filter (matchesId contId) allContents)  

data Table = Table { name :: String,  nameList :: [String] } deriving (Show, Generic)
instance ToJSON Table
instance FromJSON Table
 
listOfTuple :: [[String]] -> [Table]
listOfTuple ys  = map (\(x:xs) -> Table {name = x, nameList= xs }) ys

fromList :: [String] -> [[String]]
fromList (x:xs) = reverse $ foldl (\a@(y:ys) v ->
    if isNode v
        then [v]:a
        else (y ++ [v]):ys
    ) [[x]] xs

isNode :: String -> Bool
isNode [] = False
isNode (n:_) 
        | n /= ' ' = True 
        | otherwise = False