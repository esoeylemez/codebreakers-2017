
Gruppentheorie
==============

Relationen
----------

Eine *Relation* "~" über der Menge A ist eine Untermenge von A².

    X = {1, 2, 3}
    X² = { (1, 1), (1, 2), (1, 3),
           (2, 1), (2, 2), (2, 3),
           (3, 1), (3, 2), (3, 3) }

    ~ = { (1, 2), (1, 3), (2, 2), (2, 3) }

Normale Elementschreibweise:

    "(1, 2) ∈ ~"

Kurzschreibweise für Relationen:

    1 ~ 2
    1 ~ 3
    2 ~ 2
    2 ~ 3
    Nicht (1 ~ 1)
    Nicht (2 ~ 1)
    Nicht (3 ~ 2)


### Beispiele

Relation über ℕ:

    "=" = { (0, 0), (1, 1), (2, 2), (3, 3), ...

    0 = 0,
    1 = 1,
    2 = 2,
    3 = 3,
    Nicht (2 = 3),
    Nicht (5 = 17),
    ...


Äquivalenzrelationen
--------------------

Eine *Äquivalenzrelation* ~ über A ist eine Relation über A, sodass:

  * Reflexivität:  ∀ x,     x ~ x
  * Symmetrie:     ∀ x y,   (x ~ y) → (y ~ x)
  * Transitivität: ∀ x y z, (x ~ y, y ~ z) → (x ~ z)

### Beispiel: Gleichheit

### Beispiel: Gleichwertigkeit modulo n

Die Gleichwertigkeit ≡(mod 10) modulo 10 ist eine Relation über ℤ:

    "(2, 12) ∈ ≡(mod 10)"

    2 ≡ 12 (mod 10)

    ≡(mod 10) = { ..., (-1, -21), (-1, -11), (-1, -1), (-1, 9), (-1, 19), ...
                  ..., (0, -20), (0, -10), (0, 0), (0, 10), (0, 20), ...
                  ..., (1, -19), (1,  -9), (1, 1), (1, 11), (1, 21), ...

Im Allgemeinen: n > 1

#### Reflexiv?

    x ≡ y (mod n) <=> ∃ (k ∈ ℤ), x - y = k*n

    ∀ x, x ≡ x (mod n)?

      ∀ x, ∃ k, x - x = k*n
    → ∀ x, ∃ k, 0     = k*n
    → ∀ x, k = 0

#### Symmetrisch?

    ∀ x y, x ≡ y → y ≡ x

    ∀ x y, (∃ k', x - y = k'*n) → ∃ k, y - x = k*n

    ∀ x y k', x - y = k'*n →
        ∃ k, y - x = k*n
        ∃ k, x - y = -k*n
        ∃ k, k'*n = -k*n
        ∃ k, k' = -k
        k = -k'

#### Transitivität

    ∀ x y z, (x ≡ y, y ≡ z) → x ≡ z

    ∀ x y z, ((∃ k1, x - y = k1*n), (∃ k2, y - z = k2*n)) → ∃ k, x - z = k*n

    ∀ x y z k1 k2, (x - y = k1*n, y - z = k2*n) →
        ∃ k, x - z = k*n
        ∃ k, x - y + y - z = k*n
        ∃ k, k1*n + k2*n = k*n
        ∃ k, (k1 + k2)*n = k*n
        ∃ k, k1 + k2 = k
        k = k1 + k2


Halbgruppen
-----------

A, ~ Äquivalenzrelation über A, ⋄ : A² → A

Eine Halbgruppe über (A, ~) ist eine Funktion ⋄ : A² → A, sodass:

    Assoziativität:
    ∀ (x y z ∈ A), x ⋄ (y ⋄ z) ~ (x ⋄ y) ⋄ z

und:

    Kongruenz:
    ∀ (x1 x2 y1 y2 ∈ A),
      x1 ~ x2, y1 ~ y2 →
      x1 ⋄ y1 ~ x2 ⋄ y2.

Beispiele:

  * (ℕ, =, *): Ja, Halbgruppe.
  * (ℕ, =, +): Ja.
  * (ℕ, =, -): Nein, keine Halbgruppe.
  * (ℝ, =, +): Ja.
  * (ℝ\{0}, =, +): Blödsinn.
        + : (ℝ\{0})² → ℝ\{0}
        1 + (-1) = ?
  * (ℝ+, =, +): Ja.
  * (A*, =, ++): Ja (Listenverkettung).
  * (ℝ+\{0}, =, +): Ja.
  * (ℝ, =, /): Blödsinn (Division nicht definiert).
  * (ℝ\{0}, =, /): Nein.
  * (A → A, =, ∘): Ja.
        f ∘ (g ∘ h) = (f ∘ g) ∘ h
        ∀ x, (f ∘ (g ∘ h))(x) = ((f ∘ g) ∘ h)(x)
             f((g ∘ h)(x))    = (f ∘ g)(h(x))
             f(g(h(x)))       = f(g(h(x)))

Monoide
-------

Ein Monoid (A, ~, ⋄) ist eine Halbgruppe, sodass:

    ∃ id, ∀ x, id ⋄ x ~ x,
               × ⋄ id ~ x.

id ist ein neutrales Element.

Beispiele:

  * (ℕ, =, *): Ja: id = 1.
        1 * x = x
        x * 1 = x.
  * (ℕ, =, +): Ja. id = 0.
  * (ℝ, =, +): Ja. id = 0.
  * (ℝ+, =, +): Ja. id = 0.
  * (A*, =, ++): Ja. id = [].
  * (ℝ+\{0}, =, +): Nein.
  * (A → A, =, ∘): Ja. id(x) = x.

        f ∘ id = f
        → ∀ x, (f ∘ id)(x) = f(x)
               f(id(x))    = f(x)
               f(x)        = f(x)

        ∀ x, (id ∘ f)(x) = f(x)
             id(f(x))    = f(x)
             f(x)        = f(x)


Morphismen (alias Homomorphismen)
---------------------------------

Halbgruppe G = (A, ~, ⋄),
Halbgruppe H = (B, ≈, ♥).

Erfüllt f : A → B folgende Bedingung, dann ist f ein
Halbgruppen-Morphismus von G nach H:

    Strukturerhaltung:
    ∀ x y, f(x ⋄ y) ≈ f(x) ♥ f(y).

Beispiel:

    G = (ℂ, =, +)
    H = (ℂ, =, *)

    f(x) = 2^x

    ∀ x y, 2^(x + y) = 2^x * 2^y.

Beispiel:

    G = (ℂ\{0}, =, *)
    H = (ℂ, =, +)

    f = log

    ∀ x y, log(x * y) = log(x) + log(y)

Beispiel:

    G = (L*, =, ++)
    H = (ℕ, =, +)

    len("abcd") = 4

    ∀ x y, len(x ++ y) = len(x) + len(y)

Beispiel:

    Potenzmenge:
        P(A) = { U | U ⊆ A }

    Beispiel:
        P({1,2,3}) = { {}, {1}, {2}, {3},
                       {1,2}, {1,3}, {2,3}, {1,2,3} }

    Für endliche Menge A:

    G = (P(A), =, ∪)
    H = (ℕ, =, +)

    Mächtigkeitsfunktion:

    card({x,y,z}) = 3
    card({})      = 0

    Strukturerhaltend?

    ∀ A B, card(A ∪ B) = card(A) + card(B)
    card({x} ∪ {x}) = card({x}) = 1
    card({x}) + card({x}) = 1 + 1 = 2
    1 ≠ 2

    Nein.


Gruppe
------

Ein Monoid (A, ~, ⋄) ist eine Gruppe, wenn:

    ∀ x, ∃ y, x ⋄ y ~ id,
              y ⋄ x ~ id.

Beispiele:

  * (ℕ, =, *): Nein.
  * (ℕ, =, +): Nein.
  * (ℝ, =, +): Ja.
  * (ℝ+, =, +): Nein.
  * (A*, =, ++): Nein.
  * (ℝ → ℝ, =, ∘): Nein.
        double(x) = 2*x

        ∀ x, (half ∘ double)(x) = id(x)
        ∀ x, (2*x)*1/2 = x

        square(x) = x²
  * (ℤ, =, +): Ja.
  * (ℚ\{0}, =, *): Ja.


Diffie-Hellman über beliebigen Gruppen
--------------------------------------

DH über (ℤ, ≡(mod n), *)

Gemeinsame Werte: g, n

Alice:      xA, yA ≡ g^xA
Bob:        xB, yB ≡ g^xB
Öffentlich: yA, yB
Alice:      sA ≡ yB^xA
Bob:        sB ≡ yA^xB

sA ≡ sB

Verallgemeinert:

    Gruppe: (A, ~, ⋄)

    ^ : (A, ℤ) → A
    1. a^x | x < 0 := 1/(a^(-x))
    2. a^x | x > 0 := a ⋄ a^(x - 1)
    3. a^0 := id.

DH über einer beliebigen Gruppe (A, ~, ⋄):

    Gemeinsam: g

    Alice:      xA ∈ ℤ, yA ~ g^xA ∈ A
    Bob:        xB ∈ ℤ, yB ~ g^xB ∈ A
    Öffentlich: yA, yB
    Alice:      sA ~ yB^xA ∈ A
    Bob:        sB ~ yA^xB ∈ A

    sA ~ sB
