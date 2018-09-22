module Lib
    ( printResults
    , printEither
    ) where

import Lib.Types
import Data.Aeson
import Data.Text as T
import Data.ByteString.Lazy as B
import Data.ByteString.Lazy.Char8 as BC
import GHC.Generics
import Control.Monad


printResults :: Maybe [NOAAResult] -> IO ()
printResults Nothing = print "error loading data"
printResults (Just results) = do
  forM_ results (print . name)


printEither :: Either String [NOAAResult] -> IO ()
printEither (Left msg) = print msg
printEither (Right results) = do
  forM_ results (print . name)
