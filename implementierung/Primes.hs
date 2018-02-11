-- |
-- Copyright:  (c) 2017 Ertugrul Söylemez
-- License:    BSD3
-- Maintainer: Ertugrul Söylemez <esz@posteo.de>

module Primes
    ( -- * Primality tests
      isProbablyPrime,
      searchSafePrime
    )
    where

import Control.Exception
import System.Progress


-- | Compute ridiculously inefficiently:
--
-- > modExpVeryBad n b e = b^e `mod` n

modExpVeryBad :: Integer -> Integer -> Integer -> Integer
modExpVeryBad n b 0 = 1
modExpVeryBad n b e = mod (b * modExpVeryBad n b (e - 1)) n


-- | Compute efficiently:
--
-- > modExp n b e = b^e `mod` n

modExp :: Integer -> Integer -> Integer -> Integer
modExp n = go 1
    where
    go _ _ e | e < 0 = error "Negative exponent"
    go y _ 0 = y
    go y b e = y `seq` go (if even e then y else b*y `mod` n) b2 e'
        where
        b2 = b*b `mod` n
        e' = div e 2


-- (x^y)^z = x^(y*z)

-- b^0         ≡ 1            (mod n)
-- b^(2*e)     ≡ (b^2)^e      (mod n)
-- b^(2*e + 1) ≡ (b^2)^e * b  (mod n)


-- | This function checks the following property for its argument @n@:
--
-- > ∀ a, a^ϕ(n) ≡ 1 (mod n)
--
-- assuming that @n@ is prime and therefore @ϕ(n) = n - 1@, with a small
-- collection of values for @a@.

isFermatPseudoPrime :: Integer -> Bool
isFermatPseudoPrime n =
    all (\a -> modExp n a (n - 1) == 1)
        (takeWhile (< n) [2..21])


-- | Test against a set of small primes, fall back to
-- 'isFermatPseudoPrime'.

isProbablyPrime :: Integer -> Bool
isProbablyPrime n =
    all (\p -> n `mod` p /= 0) ps &&
    isFermatPseudoPrime n

    where
    ps = [2,3,5,7,11,13,17,19]


searchSafePrime :: Int -> IO Integer
searchSafePrime b | b < 3 = throwIO (userError "b < 3")
searchSafePrime b =
    withProgress_ "" id $ \pm ->
        let go i = do
                let n = 2^b - i
                setMeter pm ("Testing: 2^" ++ show b ++ " - " ++ show (-i))
                if isProbablyPrime n && isProbablyPrime (div (n - 1) 2)
                  then pure n
                  else go (i - 2)
        in go 1
