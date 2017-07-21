
Modulare Arithmetik
===================

Falsch: 21 = 9

Äquivalenz:

    21 ≡  9  | 21 -   9  =  1*12
    22 ≡ 10  | 22 -  10  =  1*12
    24 ≡ 12  | 24 -  12  =  1*12
     4 ≡ 16  |  4 -  16  = -1*12
    24 ≡  0  | 24 -   0  =  2*12
     3 ≡ -9  |  3 - (-9) =  1*12

120003 ≡ 3
120003 ≡ -9

  120003 ≡  3
       3 ≡ -9
→ 120003 ≡ -9

120003 - 3 = 120000 = 10000*12

10000*12


4 ≡ 4, weil: 4 - 4 = 0*12
5 ≡ 5, weil: 5 - 5 = 0*12
120000 ≡ 120000, weil: 120000 - 120000 = 0*12

0 ≡ 0, weil: 0 - 0 = 0*12

3 ≢ 4, 3 - 4 = -(1/12)*12

Wahr: 3 ≡ 15
Wahr: 15 ≡ 3

Wahr:  7 ≡ 19
Wahr: 19 ≡  7

Wahr: -3 ≡  9, weil: -3 -  9 = -1*12
Wahr:  9 ≡ 21, weil:  9 - 21 = -1*12
Wahr: -3 ≡ 21, weil: -3 - 21 = -2*12

Reflexivität:
Wahr: x ≡ x           x = x

Symmetrie:
Wahr: x ≡ y           x = y
Wahr: y ≡ x           y = x

Transitivität:
Wahr: x ≡ y           a = 3
Wahr: y ≡ z           3 = b
Wahr: x ≡ z           a = b

"∀ x. ..." = "Für alle x gilt: ..."

Beispiel: ∀ x. x = x

"∃ x. ..." = "Es existiert ein x, sodass ..."

Beispiel:      ∃ x. 2*x = 4
Gegenbeispiel: ∃ x. 2*x = 3

Beispiel:  ∃ x. x*x = 1

Beispiel:  Nicht (∀ x. x = 0)

Beispiel:
  ∀ x y.
    x + y = y + x und
    x * y = y * x

  ∀ x. x = x oder 0 = 1

  3 = 3 oder 0 = 1
  Nicht (3 = 3 und 0 = 1)

Beispiel:
  ∀ x. ∃ y. x + y = 0

    x = 7 → y = -7
    x = 2 → y = -2

Beispiel:
  ∃ x. (∀ y. ∃ z. y + z = x)
  ∃ z. (∀ x. ∃ y. x + y = z)  -- gleiche Aussage

  "Es existiert ein x, sodass für alle y ein z existiert,
   sodass: y + z = x."

Beispiel:
  0 = 0

Beispiel:
  ∃ x. x = x
  ∃ x. x = 0


Kryptografie mit modularer Arithmetik
-------------------------------------

Wir rechnen "modulo 26" ("auf einer 26-Stunden-Uhr"):

  ∀ k x. dec(k, enc(k, x)) ≡ x  (mod 26)

  enc(k, x) := x + k
  dec(k, y) := y - k

--------------------------

3 + 7    ≡ 0  (mod 10)
3 + (-3) ≡ 0  (mod 10)

7 ≡ -3  (mod 10)

∀ x. x + 3 + 7 ≡ x  (mod 10)


1 + 9    ≡ 0  (mod 10)
1 + (-1) ≡ 0  (mod 10)

9 ≡ -1  (mod 10)


       -1          0          1          2          3
        0987654321 0123456789 0123456789 0123456789 0123456789
    ... QRSTUVWXYZ ABCDEFGHIJ KLMNOPQRST UVWXYZABCD EFGHIJKLMN ...

Verschlüsselung:

    'B' → 1
    enc(x) := x + 13
    enc(1) = 14
    14 → 'O'

Entschlüsselung:

    'O' → 14
    dec(x) := x + 13
    dec(14) = 27
    27 → 'B'

Verschlüsselung:

    'T' → 19
    enc(19) = 19 + 13 = 32
    32 ≡ 6 (mod 26)
    6 → 'G'

Entschlüsselung:

    'G' → 6
    dec(6) = 6 + 13 = 19
    19 → 'T'

Feststellung:

    ∀ x. (x + 13) + 13 ≡ x (mod 26)
    ∀ x. x + (13 + 13) ≡ x (mod 26)
    ∀ x. x + 26 ≡ x        (mod 26)
    ∀ x. x + 26 ≡ x + 0    (mod 26)
    ∀ x. x + 26 ≡ x + 52   (mod 26)

Wenn wir in einer Addition Zahlen durch gleichwertige Zahlen ersetzen,
bleibt die Gleichwertigkeit erhalten:

    x ≡ 31 + 17 (mod 26)
    x ≡  5 + 17 (mod 26)
    x ≡      22 (mod 26)
    x ≡      -4 (mod 26)

Auch bei der Multiplikation dürfen wir das:

    x ≡   24·7 (mod 26)
    x ≡ (-2)·7 (mod 26)
    x ≡    -14 (mod 26)
    x ≡     12 (mod 26)

    x ≡   17·9 (mod 10)
    x ≡    7·9 (mod 10)  | weil:     17 ≡    7 (mod 10)
    x ≡ 7·(-1) (mod 10)  | weil:      9 ≡ (-1) (mod 10)
    x ≡     -7 (mod 10)  | weil: 7·(-1) ≡   -7 (mod 10)
    x ≡      3 (mod 10)  | weil:     -7 ≡    3 (mod 10)

    x ≡ 18 +    8·15 (mod 11)
    x ≡  7 + (-3)· 4 (mod 11) | weil: 18 ≡ 7, 8 ≡ -3, 15 ≡ 4 (mod 11)
    x ≡  7 +   (-12) (mod 11)
    x ≡  7 +    (-1) (mod 11) | weil: -12 ≡ -1 (mod 11)
    x ≡            6 (mod 11)

Modulare Inverse
----------------

∃ x. 5 + x ≡ 0 (mod 10), weil: x = -15, x = -5, x = 5, x = 15, …

∃ x. 7 + x ≡ 0 (mod 19), weil: x = -26, x = -7, x = 12, x = 31, …

(11 + 7) + 12 ≡ 11 (mod 19)
11 + (7 + 12) ≡ 11 (mod 19)
11 +        0 ≡ 11 (mod 19)

∃ x. 2·x ≡ 1 (mod 19);  x = -28, x = -9, x = 10, x = 29, x = 48, …

  5·2 ≡  10 (mod 19)
10·10 ≡ 100 (mod 19)
  100 ≡ 100 - 5·19 (mod 19)
  100 ≡   5 (mod 19)

(5·2)·10 ≡ 5 (mod 19)
5·(2·10) ≡ 5 (mod 19)
5·     1 ≡ 5 (mod 19)

  (6·2)·10 ≡ 6 (mod 19)
     12·10 ≡ 6 (mod 19)
       120 ≡ 6 (mod 19)
120 - 6·19 ≡ 6 (mod 19)

(6·2)·10 ≡ 6 (mod 19)
6·(2·10) ≡ 6 (mod 19)
6·    20 ≡ 6 (mod 19)
6·     1 ≡ 6 (mod 19)

∃ (x ∈ ℤ). 3·x ≡ 1 (mod 19);  x ≡ 13 (mod 19)

3·13 ≡ 1 (mod 19)

 1/3 ≡        13 (mod 19)
 4/3 ≡      4·13 (mod 19)
16/9 ≡    4²·13² (mod 19)
  16 ≡ 3²·4²·13² (mod 19)
