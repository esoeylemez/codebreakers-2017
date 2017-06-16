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


experiment :: Search Text
experiment = do
    put "Dies ist eine Geheimnachricht."
    let k1 = 8
        k2 = 12
        k3 = 2
        k4 = 17

    -- Verschlüsselung
    zoom (blocks 4) $ do
        ix 0 . letter += k1
        ix 1 . letter += k2
        ix 2 . letter += k3
        ix 3 . letter += k4

    -- Angriff: Häufigkeitsanalyse
    -- ENIRSTAH
    zoom (blocks 3) $ do
        ix 1 . letter -= 5
        -- ix 0 . letter -= 0
        -- ix 1 . letter -= 16
        -- ix 2 . letter -= 9
        -- ix 3 . letter -= 20
        pure ()

    -- Angriff: Durchprobieren aller Schlüssel
    -- Komplexität: ca. 390000
    -- zoom (blocks 4) $ do
    --     ix 0 . letter -= 1
    --     ix 1 . letter -= 1
    --     ix 2 . letter -= 2
    --     ix 3 . letter -= 1

    get


main :: IO ()
main =
    rapid 0 $ \r -> do
        termRef <- createRef r "term-ref" newTermRef
        start r "term" (runTerm (urxvtAt "/home/never/.nix-profile/bin/urxvt") termRef)
        restart r "app" . terminal termRef $ runSearch experiment
