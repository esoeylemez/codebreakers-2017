Zahlkörpersieb (Exkurs)
=======================

Problem:

    yA ≡ g^xA (mod n)

Wir suchen Relationen der Form:

    g^x0 ≡ 2^a0 * 3^b0 * 5^c0 (mod n)
    g^x1 ≡ 2^a1 * 3^b1 * 5^c1 (mod n)
    g^x2 ≡ 2^a2 * 3^b2 * 5^c2 (mod n)

Wir nehmen auf beiden Seiten den diskreten Logarithmus (zur Basis g):

    x0 ≡ a0*log(2) + b0*log(3) + c0*log(5) (mod ϕ(n))
    x1 ≡ a1*log(2) + b1*log(3) + c1*log(5) (mod ϕ(n))
    x2 ≡ a2*log(2) + b2*log(3) + c2*log(5) (mod ϕ(n))

Das ist ein lineares Gleichungssystem, das wir nach den Unbekannten
log(2), log(3), log(5) auflösen können.

Zurück zum Problem:

    yA ≡ g^xA (mod n)

Wir brauchen eine Relation der Form:

    g^(xA + s) ≡ 2^j * 3^k * 5^l (mod n)

Wieder diskreter Logarithmus auf beiden Seiten:

    xA + s ≡ j*log(2) + k*log(3) + l*log(5) (mod ϕ(n))

Daraus folgt:

    xA ≡ j*log(2) + k*log(3) + l*log(5) - s (mod ϕ(n))
