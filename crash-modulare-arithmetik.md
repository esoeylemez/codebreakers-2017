
Crashkurs: Modulare Arithmetik
==============================

        x ≡ y (mod n)
    <=> x mod n = y mod n
    <=> ∃ (k ∈ ℤ), x - y = k*n

Beispiele:

    Nicht (5 ≡ 16 (mod 10)), weil 5 - 16 = -11 ≠ k*10.

    Nicht (7 ≡ 16 (mod 11)), weil 7 - 16 = -9 ≠ k*11.

    5 ≡ 207 (mod 101), weil 5 - 207 = -202 = -2*101.

Kurzzusammenfassung:

      73 + 41
    ≡ 63 + 31
    ≡  3 +  1
    ≡  4 (mod 10)

      99   * 102
    ≡ (-1) *   2
    ≡ -2
    ≡ 8
      (mod 10)

    Assoziativgesetz:  ∀ x y z, (x + y) + z ≡ x + (y + z) (mod n)
    Kommutativgesetz:  ∀ x y,   x + y       ≡ y + x       (mod n)
    Distributivgesetz: ∀ x y z, (x + y)*z   ≡ x*z + y*z   (mod n)

    x^a * x^b ≡ x^(a + b) (mod n)
    (x^a)^b ≡ x^(a*b) (mod n)

Eulersche ϕ-Funktion
====================

Sonderfall:

    ∀ (p ∈ ℕ), p prim,
    ϕ(p) = p - 1

Inversion
=========

2 + x ≡  0 (mod 10)
2 + 8 ≡ 10
7 + 8 ≡  5
x + (-x) ≡ 0

3 * x ≡  1 (mod 10)
3 * x ≡ 21 (mod 10)
3 * 1/3 ≡ 1

6 * 7 ≡ 6 * 1/3 ≡ 6/3 ≡ 2 ≡ 42 ≡ 2*1/7*1/3

    ϕ(10) = ϕ(2*5) = ϕ(2)*ϕ(5) = 1*4 = 4

    (-1) * (-1) ≡ 1

Einheiten modulo 10:

    1, 3, 7, 9

Produkt von Einheiten:

    (x1*x2) * (1/x1 * 1/x2) ≡ 1 (mod n)
