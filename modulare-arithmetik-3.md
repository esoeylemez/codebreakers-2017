n = 101

   5*20 =  100 ≡ -1
5*(-20) = -100 ≡  1
   5*81 ≡  405 ≡  1

1/3 := 34
1/5 := -20

3 * 1/3 ≡ 1

15 * 1/3 ≡ 5

--------------------------

 1 = 2^0 * 3^0 * 5^0 * ...
 2 = 2^1 * 3^0 * 5^0 * 7^0 * 11^0 * ...
 3 = 2^0 * 3^1 * ...
 4 = 2^2 * 3^0 * ...
 5 = 2^0 * 3^0 * 5^1 * ...

--------------------------

n = 50
gcd(50, 2) = 2 ≠ 1
gcd(50, 3) = 1

1/2 ≡ [geht nicht]
1/3 ≡ 17

--------------------------

Verschlüsselungsverfahren?

enc(k, x) =     k*x mod 26
dec(k, y) = (1/k)*y mod 26


Der Bereich der *kanonischen* Zahlen modulo n ist die Zahlenmenge von 0
bis n - 1.

Eine Zahl x wird als eindeutig bezüglich einer Aussage P bezeichnet,
wenn gilt:  P(x) und P(y) → x ≡ y.  Beispiel:

    P(x) := "x ist Kehrwert von 3 modulo 11"
    P(4) ist wahr.
    P(26).
    4 ≡ 26.

Zahlen, die einen Kehrwert besitzen, nennen wir *Einheiten*.

Für alle n: es gibt höchstens n - 1 eindeutige Einheiten modulo n.

Für alle n: ist n prim, dann gibt es *genau* n - 1 eindeutige Einheiten
modulo n.

Was ist, wenn n *nicht* prim?  Beispiel (n = 15):

     1/1 ≡  1 (mod 15)
     1/2 ≡  8 (mod 15)
     1/4 ≡  4 (mod 15)
     1/7 ≡ 1/(-8) ≡ -(1/8) ≡ -2 ≡ 13 (mod 15)
     1/8 ≡  2 (mod 15)
    1/11 ≡ 1/(-4) ≡ -(1/4) ≡ -4 ≡ 11 (mod 15)
    1/13 ≡ 1/(-2) ≡ -(1/2) ≡ -8 ≡  7 (mod 15)
    1/14 ≡ -1 (mod 15)

Eulersche ϕ-Funktion
====================

ϕ(n) ist die Anzahl der eindeutigen Einheiten modulo n:

    ϕ( 2) =  1
    ϕ( 3) =  2
    ϕ( 5) =  4
    ϕ( 7) =  6
    ϕ(11) = 10

    ϕ( 4) =  2
    ϕ( 6) =  2
    ϕ( 8) =  4
    ϕ( 9) =  6
    ϕ(10) =  4
    ϕ(12) =  4
    ϕ(14) =  6
    ϕ(15) =  8
    ϕ(16) =  8
    ϕ(18) =  6
    ϕ(20) =  8
    ϕ(21) = 12
    ϕ(22) = 10

Verwandt mit dem Sieb des Eratosthenes:

           2  3 --  5 --  7 -- --
    -- 11 -- 13 -- -- -- 17 -- 19
    -- -- -- 23 -- -- -- -- -- 29
    -- 31 -- -- -- -- -- 37 -- --
    -- 41 -- 43 -- -- -- 47 -- --

Bei n = 15 = 3*5 streiche alle Vielfachen von 3 und von 5.  Es bleiben
genau die Einheiten modulo 15 übrig, da alle Zahlen weggefallen sind,
die einen Teiler mit 15 gemeinsam haben:

    --  1  2 --  4 -- --  7  8 --
    -- 11 -- 13 14

Bei `n = 18 = 2*3*3`:

    --  1 -- -- --  5 --  7 -- --
    -- 11 -- 13 -- -- -- 17

Berechnen der ϕ-Funktion:

 1a. n ist eine Primpotenz p^e:  ϕ(p^e) = (p - 1)*p^(e - 1)
 1b. Sonderfall: n ist prim:     ϕ(n)   = n - 1,
 2.  gcd(x, y) = 1:              ϕ(x*y) = ϕ(x) * ϕ(y)

Beispiele:

    ϕ(15) = ϕ(3*5) = ϕ(3) * ϕ(5) = (3 - 1) * (5 - 1) = 2 * 4 = 8

    ϕ(12) = ϕ(2*6) (wir kommen nicht weiter, weil gcd(2, 6) = 2)
    ϕ(12) = ϕ(2^2             *   3)    | 2.
          = ϕ(2^2)            * ϕ(3)    | 1.
          = (2 - 1)*2^(2 - 1) * (3 - 1)
          = 2                 * 2
          = 4

    ϕ(8) = ϕ(2^3)
         = (2 - 1)*2^(3 - 1)
         = 4

    ϕ(78234526837569189)
        = ϕ(3  *   26078175612523063)
        = ϕ(3) * ϕ(26078175612523063)
        =   2  *   26078175612523062
        = 52156351225046124

Einheiten
=========

Einheiten x, y modulo 15:

    ∃ (1/x), x * 1/x ≡ 1 (mod 15)
    ∃ (1/y), y * 1/y ≡ 1 (mod 15)

    (x*y) * 1/(x*y)     ≡ 1 (mod 15)
    (x*y) * (1/x * 1/y) ≡ 1 (mod 15)

    (x*y) * (1/x * 1/y)
        ≡ x * 1/x * y * 1/y
        ≡ 1       *       1
        ≡ 1 (mod 15)

Herausforderung: Finde Einheiten x und y, sodass x*y ≡ 3 (mod 15).

Lösung: Nicht möglich, da das Produkt zweier Einheiten immer eine
Einheit ist.  3 ist keine Einheit.


Einheitenpotenzen und Zyklen
============================

Wenn wir eine Einheit wiederholt mit sich selbst multiplizieren,
erhalten wir einen Zyklus von Einheiten:

    2^0 ≡ 1 (mod 15)
    2^1 ≡ 2 (mod 15)
    2^2 ≡ 4 (mod 15)
    2^3 ≡ 8 (mod 15)
    2^4 ≡ 1 (mod 15)
    2^5 ≡ 2 (mod 15)
    2^6 ≡ 4 (mod 15)
    2^7 ≡ 8 (mod 15)
    2^8 ≡ 1 (mod 15)
    ...

Multiplizieren wir zwei Potenzen von Basis b, erhalten wir wieder eine
Potenz von Basis b:

    2^x * 2^y ≡ 2^(x + y)


Diffie-Hellman-Verfahren
========================

Sei Modul n = 101, Basis g = 2.

Andreas wählt zufällig 0 ≤ xA < 100, berechnet yA ≡ g^xA ≡ 11.
ertes   wählt zufällig 0 ≤ xE < 100, berechnet yE ≡ g^xE ≡ 75.

Andreas berechnet:  yE^xA ≡ 89.
ertes berechnet:    yA^xE ≡ 89.

            yE  ^xA ≡   yA  ^xE
    weil: (g^xE)^xA ≡ (g^xA)^xE
        → g^(xE*xA) ≡ g^(xA*xE)
        → g^(xE*xA) ≡ g^(xE*xA)  (* kommutativ)

Auflösung:

    xA = 13
    xE = 17

Sicherheitsbedingungen
----------------------

### Größe von xA:

    g^xA >= n
    xA   >= log(n)/log(g)

ansonsten (Gleichung, keine Gleichwertigkeit!):

    log(g^xA)/log(g) = xA

und damit algebraisch lösbar.


Angriffe gegen DH
-----------------

Algebraischer Ansatz:

    s ≡ yA^xB (mod n)
    s ≡ yB^xA (mod n)

Zu viele Unbekannte.  Inspiration: bei einer Gleichung könnten wir den
Logarithmus verwenden:

      g^xA = yA
    → log(g^xA) = log(yA)
    → xA*log(g) = log(yA)
    → xA = log(yA)/log(g)

Übertragung auf modulare Gleichwertigkeit:

    g^xA ≡ yA (mod n)

Uns fehlt die Logarithmusfunktion.


Brute-Force-Methode
-------------------

    n = 10007
    g = 5

    yA = 2000

    g^0 ≡ yA (mod n)?
    g^1 ≡ yA (mod n)?
    g^2 ≡ yA (mod n)?
    ...

Problem: die Potenzen werden bei jedem Schritt komplett neu
ausgerechnet, daher quadratische Laufzeit (ca. n² Schritte).

Einfache Optimierung:

    y0 ≡ 1    ≡ g^0
    y1 ≡ g    ≡ g^1
    y2 ≡ y1*g ≡ g^2
    y3 ≡ y2*g ≡ g^3
    ...

Jetzt nur noch lineare Laufzeit (ca. n Schritte).


Baby-Step-Giant-Step
--------------------

Herausforderung (per Brute-Force):

    n = 2^24 - 3
    g = 5

    g^x ≡ 100 (mod n)

Herausforderung (Baby-Step-Giant-Step):

    n = 2^40 - 87
    g = 13

    g^x = 150 (mod n)

Algorithmus in Einzelschritten:

 1. Giant-Step-Tabelle der Größe `size` anlegen:

        dx ≈ (n - 1) / size
        dy ≡ g^dx

        (g^0, 0)
        (g^0 * dy,        dx) = (g^dx, dx)
        (g^dx * dy,     2*dx) = (g^(2*dx), dx)
        (g^(2*dx) * dy, 3*dx) = (g^(3*dx), dx)
        ...

 2. Anfang bei `g^x`, und Suche in Baby-Steps:

        g^x       kommt vor → x
        g^(x + 1) kommt vor → x - 1
        g^(x + 2) kommt vor → x - 2
