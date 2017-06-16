
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
