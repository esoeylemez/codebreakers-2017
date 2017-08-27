Algorithmen
===========

Potenzierungsalgorithmus:

    n = 10007

      2^630
    ≡ 2^(2*315)
    ≡ (2^315)^2
    ≡ (2 * 2^314)^2
    ≡ (2 * 2^(2*157))^2
    ≡ ...

      2^630
    ≡ (2^2)^315
    ≡ 4^315
    ≡ 4 * 4^314
    ≡ 4 * (4^2)^157
    ≡ 4 * 16^157
    ≡ 4 * 16 * 16^156
    ≡ 4 * 16 * (16^2)^78
    ≡ 4 * 16 * 256^78
    ≡ 4 * 16 * (256^2)^39
    ≡ 4 * 16 * 5494^39
    ≡ 4 * 16 * 5494 * 5494^38
    ≡ ...
    ≡ 1389

Anzahl der Multiplikationen:

    630 = 1001110110b

So viele wie es Bits gibt plus so viele wie es Einsen in der
Binärdarstellung gibt.

Algorithmus:

 1. `g^(2*e)     ≡ (g*g)^e     (mod n)`
 2. `g^(2*e + 1) ≡ g * (g*g)^e (mod n)`
 3. `g^0         ≡ 1           (mod n)`
