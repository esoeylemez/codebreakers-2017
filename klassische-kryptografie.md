% Klassische Kryptografie

Rot-13
======

Zum Verschlüsseln werden Buchstaben im 26-Buchstaben-Alphabet um 13
Stellen verschoben, also an Hand folgender Tabelle:

    ABCDEFGHIJKLMNOPQRSTUVWXYZ
    NOPQRSTUVWXYZABCDEFGHIJKLM

Beispiel:

       dies ist ein geheimtext
    -> QVRF VFG RVA TRURVZGRKG

Kein sicheres Verfahren, weil ...


Caesar-Chiffre
==============

Wie Rot-13, aber parametrisiert über dem *Schlüssel* k.  Rot-13 ist
also ein Sonderfall von Caesar mit k = 13.  Verschiebungstabelle mit k
= 5:

    ABCDEFGHIJKLMNOPQRSTUVWXYZ
    FGHIJKLMNOPQRSTUVWXYZABCDE

Kein sicheres Verfahren, weil es nur 25 Schlüssel gibt.  Mit anderen
Worten: der *Schlüsselraum* (die Menge aller möglichen Schlüssel) ist
zu klein.


Angriff per Häufigkeitsanalyse
------------------------------

Da alle Buchstaben um dieselbe Anzahl im Alphabet verschoben werden,
wird der häufigste Buchstabe im Chiffretext dem häufigsten Buchstaben
im Klartext entsprechen:

      fünf mal 'R'
      |      |    | |   |
    QVRF VFG RVA TRURVZGRKG
    dies ist ein geheimtext
      |      |    | |   |
      fünf mal 'e'

Der Buchstabe 'e' ist der häufigste im deutschen Gebrauch.  Mit einer
Verschiebung um 13 kommen wir von 'e' auf 'R'.  Hypothese: k = 13.
Eine Überprüfung bestätigt sie, und der Schlüssel ist gebrochen.


Vigenere-Chiffre
================

Text wird in Blöcke aufgeteilt, und jede Position im Block wird mit
einem eigenen Schlüssel Caesar-verschlüsselt.  Es gibt also mehrere
Verschiebungstabellen:

    k1 = 5
    ABCDEFGHIJKLMNOPQRSTUVWXYZ
    FGHIJKLMNOPQRSTUVWXYZABCDE

    k2 = 17
    ABCDEFGHIJKLMNOPQRSTUVWXYZ
    RSTUVWXYZABCDEFGHIJKLMNOPQ

    k3 = 11
    ABCDEFGHIJKLMNOPQRSTUVWXYZ
    LMNOPQRSTUVWXYZABCDEFGHIJK

Beispiel:

    wird mit k1 verschlüsselt
    |
    |wird mit k2 verschlüsselt
    ||
    ||wird mit k3 verschlüsselt
    |||
    die|s i|st |ein| ge|hei|mte|xt
        |||
        ||wird mit k3 verschlüsselt
        ||
        |würde mit k2 verschlüsselt, aber wir ignorieren Nichtbuchstaben
        |
        wird mit k1 verschlüsselt


Angriff gegen Vigenere
----------------------

    k1 = 5
    k2 = 0
    k3 = 10

    1: Ixxj mrc~sj swjnj.  [k1 = 5]
    2: i tiGettE hlg hmx   [k2 = 15]
    3: os xoso.scbkoQodd   [k3 = 10]

    Iio|x s|xt |jix| Go|mes|rto|ct.|
    Es|s c|jhb| lk|sgo|w Q|jho|nmd|jxd|.


Vigenere mit Bits
=================

k1 = 0
k2 = 1
k3 = 1
k4 = 0
k5 = 0
k6 = 1

Klartext:  001010|110110|010100|010000
Schlüssel: 011001|011001|011001|011001

           010011|101111|001101|001001


Exkurs: Exklusiv-Oder (XOR)
---------------------------

"entweder, oder"

     |0 1         | falsch    wahr
    -+---  -------+---------------
    0|0 1  falsch | falsch    wahr
    1|1 0    wahr |   wahr  falsch
