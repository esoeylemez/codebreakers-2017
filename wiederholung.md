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


Wiederholung vom 04.08.2017
===========================

Einheiten
---------

    20    * 1/20      ≡ 1 (mod 77)
    30    * 1/30      ≡ 1 (mod 77)
    20*30 * 1/(20*30) ≡ 1 (mod 77)

    1/(20*30) ≡ 1/20 * 1/30  (mod 77)

Beweise: Einheiten sind eindeutig.


Einheitenpotenzen und Zyklen
----------------------------

Ist g eine Einheit, enthält die Sequenz

    g^0, g^1, g^2, g^3, ...

nur Einheiten.  Da es höchstens ϕ(n) Einheiten gibt, wiederholt sich die
Folge nach spätestens ϕ(n) Zahlen.

Das Produkt `g^x * g^y` ist ein Element der Folge.  Beweis:

    g^x * g^y ≡ g^(x + y)  (mod n)


Diffie-Hellman-Verfahren
------------------------

n = 10007
g = 2

  Alice       | Öffentlich | Bob
              | n, g       |
  xA          | yA ≡ g^xA  |
              | yB ≡ g^xB  | xB
  sA ≡ yB^xA  |            | sB ≡ yA^xB

Resultat:  sA ≡ sB (mod n)
Beweis:

    sA ≡ yB^xA
       ≡ (g^xB)^xA
       ≡ g^(xB * xA)
       ≡ g^(xA * xB)
       ≡ (g^xA)^xB
       ≡ sB (mod n)

    s ≡ sA ≡ sB


Wiederholung vom 18.08.2017
===========================

Diffie-Hellman
--------------

Alice:
    yA ≡ g^xA (mod n)

Bob:
    yB ≡ g^xB (mod n)

Gemeinsames Geheimnis:
    s ≡ yA^xB ≡ yB^xA (mod n)


Angriffsansatz
--------------

Öffentliche Informationen:

    n, g, yA, yB

Suchen nach xA, sodass:

    yA ≡ g^xA (mod n)


Brute-Force-Angriff
-------------------

Durchprobieren:

    yA ≡ g^0?
    yA ≡ g^1?
    ...
    yA ≡ g^xA

Optimierte Variante:

    y(0)            ≡ g^0
    y(1) ≡ y(0) * g ≡ g^1
    y(2) ≡ y(1) * g ≡ g^2
    y(3) ≡ y(2) * g ≡ g^3

und dann durchtesten:

    yA ≡ y(x) → xA = x


Wiederholung vom 01.09.2017
===========================


      Alice      | Öffentlich        | Bob
    -------------+-------------------+--------------
                 | n = 101           |
                 | g = 2             |
     xA < ϕ(101) |                   |
     xA = 41     |                   |
                 | yA ≡ g^xA (mod n) |
                 |                   | xB < ϕ(101)
                 |                   | xB = 53
                 | yB ≡ g^xB (mod n) |
     sA ≡ yB^xA  |                   | sB ≡ yA^xB

Es stellt sich heraus:

      sA
    ≡ yB^xA
    ≡ (g^xB)^xA
    ≡ g^(xB*xA)
    ≡ g^(xA*xB)
    ≡ (g^xA)^xB
    ≡ yA^xB
    ≡ sB

    → sA ≡ sB

Angenommen:

    log (a^b) = b*log a

      yB = g^xB
    → log yB / log g = log (g^xB) / log g
    → log yB / log g = xB


Diffie-Hellman
==============


      Alice       |  Öffentlichkeit  |  Bob
    -----------------------------------------------
                  |  n = 113         |
                  |  g = 3           |
      xA = 13     |                  |  xB = 78
      yA ≡ g^xA   |                  |  yB ≡ g^xB
                  |  yA, yB          |
      sA ≡ yB^xA  |                  |  sB ≡ yA^xB

Schließlich:

    sA ≡ sB

Beweis:

      yB^xA      | yB ≡ g^xB
    ≡ (g^xB)^xA  | Potenzgesetz
    ≡ g^(xB*xA)  | Kommutativgesetz
    ≡ g^(xA*xB)  | Potenzgesetz
    ≡ (g^xA)^xB  | g^xA ≡ yA
    ≡ yA^xB

Angreifer:

    yA ≡ g^xA

Normaler Logarithmus funktioniert nicht.  Problem: diskreter
Logarithmus.


Gruppentheorie
==============

