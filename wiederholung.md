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

Relationen
----------

Eine Relation ~ über einer Menge A ist eine Untermenge von A².

    A = { 1, 2, 3 }
    A² = { (1, 1), (1, 2), (1, 3),
           (2, 1), (2, 2), (2, 3),
           (3, 1), (3, 2), (3, 3) }

    ~ = { (1, 1), (1, 2), (3, 2) }

Kurzschreibweise:

    "(x, y) ∈ ~" <-> "x ~ y"

Äquivalenzrelationen
--------------------

Eine Äquivalenzrelation ~ über A ist eine Relation, die folgende
Eigenschaften besitzt:

  * Reflexivität:  ∀ x,      x ~ x
  * Symmetrie:     ∀ x y,    y ~ x → x ~ y
  * Transitivität: ∀ x y, z, x ~ y, y ~ z → x ~ z

Beispiel:

    A = { 1, 2, 3}

    "=" über A:

    "=" = { (1, 1), (2, 2), (3, 3) }

Beispiel:

    ≡(mod 15) über ℤ

    "x ≡ y (mod 15)" <-> "∃ (k ∈ ℤ), k*15 = x - y"

    ≡(mod 15) = { (1, 1), (2, 2), (2, 17), (17, 2)

    Nicht (2 ≡ 3 (mod 15)).


Wiederholung vom 20.10.2017
---------------------------

### Äquivalenzrelationen

(A, ~), sodass:

  * Reflexivität:  ∀ x, x ~ x
  * Symmetrie:     ∀ x y, x ~ y → y ~ x
  * Transitivität: ∀ x y z, x ~ y und y ~ z → x ~ z

### Halbgruppe

(A, ⋄, ~)

  * Geschlossenheit: ⋄ : A² → A
  * Assoziativität:  ∀ x y z, x ⋄ (y ⋄ z) ~ (x ⋄ y) ⋄ z
  * Kongruenzgesetz: ∀ x1 x2 y1 y2, x1 ~ x2 und y1 ~ y2 → x1 ⋄ y1 ~ x2 ⋄ y2

    Anwendungsbeispiel:

          x ~ 9
          3 ⋄ x ⋄ 7 ~ x ⋄ 5
        → 3 ⋄ 9 ⋄ 7 ~ 9 ⋄ 5

### Monoid

(A, ⋄, ~) Halbgruppe

  * Neutrales Element:

        ∃ id, ∀ x,
          x ⋄ id ~ x und
          id ⋄ x ~ x

Alle neutralen Elemente sind äquivalent zueinander:

    Prämisse:
      id1, id2,
      id1 ≠ id2,
      ∀ x, id1 ⋄ x ~ x,
           x ⋄ id1 ~ x,
      ∀ y, id2 ⋄ y ~ y,
           y ⋄ id2 ~ y

    id1 ~ id2
    id1 ~ id1 ⋄ id2
    id1 ⋄ id2 ~ id2

    id1 ~ id1 ⋄ id2 ~ id2

### Gruppe

(A, ⋄, ~) Monoid

  * Inverse: ∀ x, ∃ 1/x, x ⋄ 1/x ~ id

### Morphismen (Homomorphismen)

#### Halbgruppenmorphismus:

G = (A, ⋄, ~) Halbgruppe
H = (B, ♥, ≈) Halbgruppe

Eine Funktion (f : A → B) ist ein Halbgruppenmorphismus, wenn:

  * Strukturerhaltung: ∀ x y, f(x ⋄ y) ≈ f(x) ♥ f(y)

Beispiel:

    G = (ℤ, +, =)
    H = (ℤ, *, =)

    f : ℤ → ℤ
    f(x) = a^x

    ∀ x y, a^(x + y) = a^x * a^y

Beispiel:

    G = (A, ⋄, ~)
    H = (ℤ, +, =)

    f : A → ℤ
    f(x) := 0

    ∀ x y, f(x ⋄ y) = f(x) + f(y)
      Beweis:
        0 = 0 + 0

Beispiel:

    G = (A, ⋄, ~)
    H = (ℤ, *, =)

    f : A → ℤ
    f(x) := 1
    (neutrales Element)

    g : A → ℤ
    g(x) := 0
    (absorbierendes Element)

Beispiel:

    G = (A, ⋄, ~)
    H = G

    f : A → A
    f(x) := x

    ∀ x y, f(x ⋄ y) ~ f(x) ⋄ f(y)
      Beweis:
        x ⋄ y ~ x ⋄ y


DH klassisch
------------

Öffentlich: n, g
Alice:      xA, yA ≡ g^xA (mod n)
Bob:        xB, yB ≡ g^xB (mod n)
Öffentlich: yA, yB
Alice:      sA ≡ yB^xA (mod n)
Bob:        sB ≡ yA^xB (mod n)
→ sA ≡ sB (mod n)


DH über beliebigen Gruppen
--------------------------

Öffentlich: Gruppe G = (A, ⋄, ~), g ∈ A
Definition:

    (^) bindet stärker als (⋄)

    2^(-5) = 1/(2^5)

    (^) : A × ℤ → A
    x^0 := id
    x^e | e < 0 := (1/x)^(-e)
    x^e := x ⋄ x^(e - 1)

    Eigenschaft: ∀ x e1 e2, (x^e1)^e2 ~ x^(e1 * e2)

Alice:      xA ∈ ℤ, yA ~ g^xA
Bob:        xB ∈ ℤ, yB ~ g^xB
Öffentlich: yA, yB ∈ A
Alice:      sA ~ yB^xA
Bob:        sB ~ yA^xB
