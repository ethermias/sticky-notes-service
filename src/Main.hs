module Main where

import Web.Scotty
import Routes
import System.IO
import Content

main :: IO ()
main = do
  putStrLn "Starting Server..."  
  name <- tableOfContents
  scotty 8888 $ routes name 

tableOfContents :: IO String
tableOfContents = do 
                handle <- openFile "tableOfContents.yaml" ReadMode  
                contents <- hGetContents handle 
                return contents 