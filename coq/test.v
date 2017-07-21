
Require Import ZArith.
Require Import Unicode.Utf8.

Open Scope Z_scope.

Section ModArith.

Variable (n : Z).

(* 3 ≡ 18 (mod 5) *)

Definition modEq x y :=
  ∃ (k : Z), x - y = k*n.

Infix "≡" := modEq (at level 70).

Example test1 : n = 5 → 3 ≡ 8.
Proof.
  intros.
  unfold modEq.
  rewrite H.
  exists (-1).
  ring.
Qed.

(* Reflexivität: *)

Theorem modEq_refl : ∀ x, x ≡ x.
Proof.
  intros.
  unfold modEq.
  exists 0.
  ring.
Qed.

(* Symmetrie: *)

Theorem modEq_sym :
  ∀ (x y : Z), x ≡ y → y ≡ x.

  (* Für alle Ganzzahlen x und y gilt,
     wenn x gleichwertig zu y ist,
     dass auch y gleichwertig zu x ist. *)
Proof.
  intros x y [k0 H].
  unfold modEq.
  exists (-k0).
  (* -(k0 * n) *)
  SearchRewrite (-_ * _).
  rewrite Z.mul_opp_l.
  rewrite <- H.
  ring.
Qed.

Example test3 : n = 5 → 8 ≡ 3.
Proof.
  intros.
  unfold modEq.
  rewrite H.
  exists 1.
  ring.
Qed.

Example test4 : n = 5 → 8 ≡ 13.
Proof.
  intros.
  unfold modEq.
  rewrite H.
  exists (-1).
  ring.
Qed.

(* n = 5 → 8 ≡ 13
   ∃ k. 8 - 13 = k*5

   x ist ein Vielfaches von y, wenn:
   ∃ (k : Z). x = k*y
*)

(* Bis jetzt:
     3 ≡  8
     8 ≡ 13
   Frage: 3 ≡ 13?
*)

Example test5 : n = 5 → 3 ≡ 13.
Proof.
  intros.
  unfold modEq.
  exists (-2).
  rewrite H.
  ring.
Qed.

(* Nach dem Logiker Haskell Curry? *)

Theorem curry :
  ∀ (A B C : Prop),
  (A → (B → C)) <-> (A ∧ B → C).
Proof.
  intros.
  split.
  intros H1 [H2 H3].
  auto.
  intros.
  auto.
Qed.

(* Transitivität: *)

Theorem modEq_trans :
  ∀ x y z,
    x ≡ y → y ≡ z → x ≡ z.
Proof.

(* ¬ P = P → False *)

Theorem lem : ∀ P, not (not P) → P.
Proof.
  unfold not.
  intros.


(* Zermelo-Fraenkel:

   0 = e
   1 = {e}
   2 = {{e}, e}
   3 = {{{e}, e}, {e}, e}

   Immer größere unendliche Mengen:
     Aleph0 ≃ ℕ
     Aleph1
              ℝ ≃ 2^ℕ
   Kontinuumshypothese: Aleph1 ≃ ℝ


   Konstruktive Mathematik:
     Law of the Excluded Middle (LEM):
       ∀ P, P ∨ ¬P
       ∀ P, ¬¬P → P

     (Angenommen ¬P → Widerspruch) → P.

   Youtube:
     Andrej Bauer –
     Five Stages Of Accepting
     Constructive Mathematics

*)


Hypothesis test2 : n = 5 → not (3 ≡ 9).
