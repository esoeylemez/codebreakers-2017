-- |
-- Copyright:  (c) 2017 Ertugrul Söylemez
-- License:    BSD3
-- Maintainer: Ertugrul Söylemez <esz@posteo.de>

{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import Codebreakers
import Data.Text.Lazy (Text)
import qualified Data.Text.Lazy as Tl
import Rapid
import Rapid.Term


experiment :: Crypto ()
experiment = do
    put ("Dies ist ein Geheimtext.\n" <>
         "Ein sehr langer Geheimtext.")
    let k1 = 5
        k2 = 0
        k3 = 10
    zoom (blocks 3) $ do
        ix 0 . letter += k1
        ix 1 . letter += k2
        ix 2 . letter += k3


experiment2 :: Search Text
experiment2 = do
    put "Iiox sxt jix Gomesrtoct.\nEss cjhb lksgow Qjhonmdjxd."

    (k1,k2,k3) <-
        lift [(9 - 4, 19 - 4, 14 - 4),
              (9 - 8, 19 - 4, 14 - 4),
              (9 - 4, 19 - 8, 14 - 4),
              (9 - 4, 19 - 4, 14 - 8),
              (9 - 8, 19 - 8, 14 - 4),
              (9 - 8, 19 - 4, 14 - 8),
              (9 - 4, 19 - 8, 14 - 8),
              (9 - 13, 19 - 4, 14 - 4),
              (9 - 4, 19 - 13, 14 - 4),
              (9 - 4, 19 - 19, 14 - 4)]

    zoom (blocks 3) $ do
        ix 0 . letter -= k1
        ix 1 . letter -= k2
        ix 2 . letter -= k3

    result <- get
    pure (Tl.pack (show (k1,k2,k3)) <> " " <> result)


main :: IO ()
main =
    rapid 0 $ \r -> do
        termRef <- createRef r "term-ref" newTermRef
        start r "term" (runTerm (urxvtAt "/home/never/.nix-profile/bin/urxvt") termRef)
        restart r "app" . terminal termRef $ runSearch experiment2
