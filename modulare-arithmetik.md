
Uhrzeigerarithmetik
===================

Wir unterscheiden nicht zwischen zwei Ganzzahlen, deren Differenz ein
Vielfaches von 12 ist.  Beispiele:

      3 und  15, weil:   3 -  15 =  -12 =  -1*12
    120 und 240, weil: 120 - 240 = -120 = -10*12
     17 und   5, weil:  17 -   5 =   12 =   1*12
      5 und   5, weil:   5 -   5 =    0 =   0*12

Gegenbeispiel:

    6 und 7, weil: 6 - 7 = -1

    k*12 = -1?  Ganzzahl k existiert nicht


Notation
--------

Für die Aussage "x ist gleichwertig zu y" verwenden wir die
Schreibweise:

    x ≡ y (mod 12)

Gesprochen: "x und y sind gleichwertig modulo 12".

    Es existiert eine Ganzzahl k, sodass:
        x - y = k*12

Symbolische Schreibweise:

    ∃ (k ∈ ℤ). x - y = k*12


Beispiele
---------

Richtig oder falsch?

     6 ≡ 18 (mod 12)?  Ja.  Beweis: k = -1
    18 ≡  6 (mod 12)?  Ja.  Beweis: k = 1
     3 ≡ 16 (mod 12)?  Nein.


Eigenschaften der Gleichwertigkeit
----------------------------------

      3 ≡   3 (mod 12).  Ja.  k = 0
      4 ≡   4 (mod 12).  Ja.  k = 0
    500 ≡ 500 (mod 12).  Ja.  k = 0

oder kurz:

    ∀ (a ∈ ℝ). a ≡ a (mod 12).  Ja.  k = 0
