
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
