-- |
-- Copyright:  (c) 2017 Ertugrul Söylemez
-- License:    BSD3
-- Maintainer: Ertugrul Söylemez <esz@posteo.de>

module Utils
    ( -- * Arithmetic
      modExp
    )
    where


-- modExp n g e = g^e `mod` n

modExp :: Integer -> Integer -> Integer -> Integer
modExp n g 0 = 1
modExp n g e
    | even e    = modExp n g2 (div e 2)
    | otherwise = g * modExp n g2 (div e 2) `mod` n
    where
    g2 = g*g `mod` n
