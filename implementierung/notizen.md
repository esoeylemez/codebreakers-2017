% Notizen


Aufgabe
=======

Ziel: Implementierung von Diffie-Hellman mit einem geeigneten Protokoll,
um gemeinsame Geheimnisse über das Netzwerk zu vereinbaren.

  * Primzahltest: Fermat-Test
      * Modulare Potenzierung
  * Safe primes
  * Basis finden


Fermat-Primzahltest
===================

∀ a, a^ϕ(n) ≡ 1 (mod n)

Wenn p eine Primzahl ist:

∀ a, a^(p - 1) ≡ 1 (mod p)


Safe primes
===========

Die tatsächliche Sicherheit des Moduls p ist bestimmt durch den größten
Primfaktor von p - 1.  Beispiel:

    p = 103

    103 - 1 = 2*3*17

Scheinbare Sicherheit:   103 (bzw. 6.69 Bit)
Tatsächliche Sicherheit:  17 (bzw. 4.09 Bit)

Eine "safe prime" ist eine Primzahl p = 2*q + 1, wobei q auch eine
Primzahl ist.  Dann bezeichnet man q als eine Sophie-Germain-Primzahl
(von Marie-Sophie Germain).


Suche nach safe primes
----------------------

Test ob n prim, und ob (n - 1)/2 prim.


Basis finden
============

Gegeben: safe prime p = 2*q + 1.

ord(g^ℤ, ≡(mod p), *) = ord(ℤ, ≡(mod p), *)

Beispiel: p = 107 = 2*53 + 1:

    ord(ℤ, ≡(mod 107), *) = 106

Untergruppen dieser Gruppe haben eine Ordnung aus:

    1, 2, 53, 106

Test:  Ist b ein Generator der gesamten Gruppe, dann gilt:

    b^q ≢ 1
