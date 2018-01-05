---
title: RSA
...

RSA: Rivest, Shamir, Adleman

15 = 3 * 5
30 = 2 * 3 * 5
77 = 7 * 11
12827 = 101 * 127

Schlüsselgenerierung:

  * Wähle unterschiedliche Primzahlen p, q
  * n = p*q
  * ϕ(n) = ϕ(p*q) = ϕ(p)*ϕ(q) = (p - 1)*(q - 1)
  * Wähle e, d sodass e*d ≡ 1 (mod ϕ(n))
  * Öffentlich: (n, e)
  * Privat:     (n, d)

Verschlüsselung und Entschlüsselung:

  * Geheimnis x → Chiffretext y
  * Verschlüsselung: y ≡ x^e (mod n)
  * Entschlüsselung: x ≡ y^d (mod n)

Beispiel:

    p    = 14437
    q    = 35267
    n    = 509149679
    ϕ(n) = 509099976
    e    = 5
    d    = 407279981

    Öffentlich: (n, e) = (509149679, 5)
    Privat:     (n, d) = (509149679, 407279981)

Verschlüsselung/Entschlüsselung:

    x = 100

    y ≡ 100^5
      ≡ 326156099 (mod n)

    x ≡ y^d
      ≡ 326156099^407279981
      ≡ 100 (mod n)
