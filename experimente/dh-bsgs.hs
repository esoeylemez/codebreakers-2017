-- |
-- Copyright:  (c) 2017 Ertugrul Söylemez
-- License:    BSD3
-- Maintainer: Ertugrul Söylemez <esz@posteo.de>

{-# LANGUAGE BangPatterns #-}

module Main (main) where

import Data.Bits
import Data.HashMap.Strict (HashMap)
import qualified Data.HashMap.Strict as Mh
import GHC.Integer.GMP.Internals
import System.Environment


-- | Baby-Step-Giant-Step-Algorithmus
--
-- 'size' ist die Größe der Giant-Step-Tabelle.

bsgs :: Int -> Integer -> Integer -> Integer -> IO Integer
bsgs size n g y0 = do
    putStrLn "Computing giant-step table"
    exps `seq` putStrLn "Searching"

    let search | g == 2    = go2
               -- | g == 11   = go11
               | otherwise = go
            where
            go !dx y =
                case Mh.lookup y exps of
                  Just x  -> pure (mod (x - dx) (n - 1))
                  Nothing -> go (dx + 1) (mod (g*y) n)

            go2 !dx y =
                case Mh.lookup y exps of
                  Just x  -> pure (mod (x - dx) (n - 1))
                  Nothing -> go2 (dx + 1) (next2 y)

            go11 !dx y =
                case Mh.lookup y exps of
                  Just x  -> pure (mod (x - dx) (n - 1))
                  Nothing -> go11 (dx + 1) (next11 y)

        next2 y =
            let -- Wenn g = 2: y' = 2*y
                y' = 2*y
            in if y' >= n then y' - n else y'

        next11 y =
            let -- Wenn g = 11: y' = 8*y + 2*y + y
                y' = shiftL y 3 + shiftL y 1 + y
            in mod y' n


    search 0 y0

    where
    -- Schrittgröße: ~(n / size)
    dxGiant = round (fromInteger n / fromIntegral size)
    dyGiant = powModInteger g dxGiant n

    exps :: HashMap Integer Integer
    exps =
        Mh.fromList . take size $
        iterate (\(y, x) -> (mod (y*dyGiant) n, x + dxGiant))
                (1, 0)


main :: IO ()
main = do
    let n = 2^41 + 27
        g = 2

        x = 100
        y = powModInteger g x n

    size : _ <- map read <$> getArgs
    bsgs size n g y >>= print
