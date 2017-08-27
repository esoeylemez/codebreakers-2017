-- |
-- Copyright:  (c) 2017 Ertugrul Söylemez
-- License:    BSD3
-- Maintainer: Ertugrul Söylemez <esz@posteo.de>

module Main (main) where

import Control.Monad
import Data.List (find)
import Data.Maybe
import Utils


dhLogFast :: Integer -> Integer -> Integer -> Maybe Integer
dhLogFast n g y =
    fmap fst .
    find (\(_, y') -> y' == y) .
    zip [0..] .
    take (fromInteger n - 1) .
    iterate (\y' -> mod (y'*g) n) $
    1

dhLogSemifast :: Integer -> Integer -> Integer -> Maybe Integer
dhLogSemifast n g y =
    listToMaybe $ do
        x <- [0 .. n - 1]
        guard (modExp n g x == y)
        pure x


dhLogSlow :: Integer -> Integer -> Integer -> Maybe Integer
dhLogSlow n g y =
    listToMaybe $ do
        x <- [0 .. n - 1]
        guard (g^x `mod` n == y)
        pure x


main :: IO ()
main = pure ()
