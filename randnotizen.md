
  * Neuromorphe Computer, Spinnaker, Uni Heidelberg


Turing-Maschine (Alan Turing)
=============================


Lambda-Kalkül (Alonzo Church)
=============================

Lambda-Ausdrücke:

  * Variablen:      a, b, c, d, …
  * Applikationen:  A B
  * Abstraktion:    λa. A

Beispiele:

  f
  j
  f j
  (f j) (f j)
  (f j) f
  f (f f)

Konvention:

  (f x) y = f x y

Beispiele:

  λx. v
  λx. x
  λx. x x

Beta-Reduktion:

      ((λv. v v x) z) m
    → (z z x) m
    → (z z x) m

       -----A----- B
      ((λv. v v x) z) m

Noch ein Beispiel (Y-Kombinator):

      λf. (λx. f (x x)) (λx. f (x x))
    → λf. f ((λx. f (x x)) (λx. f (x x)))

    Y f = f (f (f (f (f (f ...

    f x = x

    f (Y f) = Y f
