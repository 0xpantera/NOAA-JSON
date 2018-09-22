module Main where

import Lib
import Lib.Types
import Data.Aeson
import Data.Text as T
import Data.ByteString.Lazy as B
import Data.ByteString.Lazy.Char8 as BC
import GHC.Generics

main :: IO ()
main = do
  jsonData <- B.readFile "noaa-data.json"
  let noaaResponse = eitherDecode jsonData :: Either String  NOAAResponse
  let noaaResults = results <$> noaaResponse
  printEither noaaResults
