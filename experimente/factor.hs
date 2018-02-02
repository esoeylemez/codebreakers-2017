module Main where

import Data.Foldable
import System.Environment


trialDiv :: Integer -> Maybe Integer
trialDiv n =
    case filter (\p -> n `mod` p == 0) factors of
      p : _ -> Just p
      _     -> Nothing

    where
    factors = 2 : [3,5..n - 1]


main :: IO ()
main =
    map read <$> getArgs >>=
    traverse_ (print . trialDiv)
