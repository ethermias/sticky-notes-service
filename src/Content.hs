module Content where

import Data.Aeson (FromJSON, ToJSON)
import GHC.Generics

data Content = Content { contentId :: Int, desc :: String } deriving (Show, Generic)
instance ToJSON Content
instance FromJSON Content

allContents :: [Content]
allContents = [ 
  Content { contentId = 1, desc = "Classifying Pronouns"},
  Content { contentId = 2, desc = "Recognizing the Various Types of Pronouns"},
  Content { contentId = 3, desc = "The Cases of Pronouns"},
  Content { contentId = 4, desc = "Pronouns as Nominals"},
  Content { contentId = 5, desc = "pronouns after As, Than, and But"},
  Content { contentId = 6, desc = "Selecting the Correct Pronoun"},
  Content { contentId = 7, desc = "Pronoun Reference"},
  Content { contentId = 8, desc = "General Observations about Pronouns"}
  ]

matchesId :: Int -> Content -> Bool
matchesId contId content = contentId content == contId