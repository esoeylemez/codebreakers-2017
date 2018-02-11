-- |
-- Copyright:  (c) 2017 Ertugrul Söylemez
-- License:    BSD3
-- Maintainer: Ertugrul Söylemez <esz@posteo.de>

module Main (main) where

import Control.Monad
import Data.Foldable
import Primes
import System.Environment


main :: IO ()
main =
    map read <$> getArgs >>=
    traverse_ (searchSafePrime >=> print)
