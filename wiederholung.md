Wiederholung vom 28.07.2017
===========================

Wie lautet der Kehrwert 1/x von x (modulo n)?

    x * 1/x ≡ 1 (mod n)

Beispiel mit n = 17.  Der Kehrwert von 3:

    3 * 1/3 ≡  1 (mod 17)
    3 * 1/3 ≡ 18 (mod 17)
    3 *   6 ≡ 18 (mod 17)

    1/3 ≡ 6  (mod 17)

Beispiel mit n = 31.  Der Kehrwert von 21:

    21 * 1/21 ≡  1 (mod 31)
    21 * 1/21 ≡ 63 (mod 31)
    21 *    3 ≡ 63 (mod 31)

    1/21 ≡ 3 (mod 31)

Für alle x, y: Ist x der Kehrwert von y, dann ist auch y der Kehrwert
von x:

    ∀ x y, x * y ≡ 1 (mod n) → y * x ≡ 1 (mod n).
    Beweis: x*y = y*x

Sei n = 11.

    1 * 1/1 ≡ 1 (mod 11) → 1/1 ≡ 1
    2 * 1/2 ≡ 1 (mod 11) → 1/2 ≡ 6
    3 * 1/3 ≡ 1 (mod 11) → 1/3 ≡ 4
     1/4 ≡  3  (mod 11)
     1/5 ≡  9  (mod 11)
     1/6 ≡  2  (mod 11)
     1/7 ≡  8  (mod 11)
     1/8 ≡  7  (mod 11)
     1/9 ≡  5  (mod 11)
    1/10 ≡ 10  (mod 11)
    1/11 existiert nicht.

    gcd(11, 11) = 11

Der Kehrwert zu x existiert genau dann, wenn gcd(x, n) = 1.

(GCD = "greatest common divisor"
 dt. ggT = "größter gemeinsamer Teiler")

Ganzzahlen: Kehrwert von x:  x * 1/x = 1.

    1/-2 gibt's nicht
    1/-1 = -1
    1/0 gibt's nicht
    1/1 = 1
    1/2 gibt's nicht
