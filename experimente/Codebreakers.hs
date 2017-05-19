-- |
-- Copyright:  (c) 2017 Ertugrul Söylemez
-- License:    BSD3
-- Maintainer: Ertugrul Söylemez <esz@posteo.de>

{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE RankNTypes #-}

module Codebreakers
    ( -- * Utilities
      Crypto,
      Search,
      blocks,
      evalSearch,
      execCrypto,
      letter,
      runCrypto,
      runSearch,
      textFiltered,
      upper,
      write,
      writeState,
      writeText,

      -- * Reexports
      module Control.Lens,
      module Control.Monad.State.Strict,
      module Data.Char,
      module Data.Monoid,
      module Data.Text.Lazy.Lens
    )
    where

import Control.Applicative
import Control.Lens
import Control.Monad.Reader
import Control.Monad.State.Strict
import Data.Char
import Data.Foldable
import Data.Monoid
import qualified Data.Text.Lazy as Tl
import qualified Data.Text.Lazy.IO as Tl
import Data.Text.Lazy.Lens
import System.IO


type Crypto = StateT Tl.Text (ReaderT Handle IO)

type Search = StateT Tl.Text []


blocks :: Int -> Traversal' Tl.Text Tl.Text
blocks n f = go
    where
    go xs
        | Tl.null xs = pure xs
        | otherwise  =
            let (xs1, xs2) = Tl.splitAt (fromIntegral n) xs
            in liftA2 (<>) (f xs1) (go xs2)


evalSearch :: Search a -> [a]
evalSearch = flip evalStateT mempty


execCrypto :: Crypto a -> IO Tl.Text
execCrypto c = runReaderT (execStateT c mempty) stderr


letter :: Traversal' Char Integer
letter f c
    | isAsciiUpper c =
        (\x -> toEnum $ fromInteger (mod x 26) + fromEnum 'A') <$>
        f (toInteger (fromEnum c - fromEnum 'A'))
    | isAsciiLower c =
        (\x -> toEnum $ fromInteger (mod x 26) + fromEnum 'a') <$>
        f (toInteger (fromEnum c - fromEnum 'a'))
    | otherwise      = pure c


runCrypto :: Crypto a -> Handle -> IO a
runCrypto c h = do
    (x, str) <- runReaderT (runStateT c mempty) h
    hPutStr h "\027[2J\027[H"
    x <$ Tl.hPutStrLn h str


runSearch :: Search Tl.Text -> Handle -> IO ()
runSearch c h = do
    hPutStr h "\027[2J\027[H"
    traverse_ (Tl.hPutStrLn h) (evalStateT c mempty)


textFiltered :: (Char -> Bool) -> Lens' Tl.Text Tl.Text
textFiltered p l xs0 = back xs0 <$> l (Tl.filter p xs0)
    where
    back xs' ys'
        | Just (x, xs) <- Tl.uncons xs', Just (y, ys) <- Tl.uncons ys', p x = Tl.cons y (back xs ys)
        | Just (x, xs) <- Tl.uncons xs'                                     = Tl.cons x (back xs ys')
        | otherwise                                                         = mempty


upper :: Traversal' Char Bool
upper f c
    | isLetter c = (\u -> (if u then toUpper else toLower) c) <$> f (isUpper c)
    | otherwise  = pure c


write :: (Show a, MonadIO m, MonadReader Handle m) => a -> m ()
write = writeText . Tl.pack . show


writeState :: (MonadIO m, MonadReader Handle m, MonadState Tl.Text m) => m ()
writeState = get >>= writeText


writeText :: (MonadIO m, MonadReader Handle m) => Tl.Text -> m ()
writeText str = do
    h <- ask
    liftIO (Tl.hPutStrLn h str)
