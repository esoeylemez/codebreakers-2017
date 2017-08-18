
(* Coq *)

Require Import ZArith.
Require Import Unicode.Utf8.

Open Scope Z_scope.

Section ModArith.

Variable (n : Z).

(* 3 ≡ 18 (mod 5) *)

Definition modEq x y :=
  ∃ (k : Z), x - y = k*n.

Infix "≡" := modEq (at level 70).

(* 3 ≡ 8 (mod n) *)
(* n = 5 → 3 ≡ 8 *)

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
  intros x y z [k0 H0] [k1 H1].
  unfold modEq.
  exists (k0 + k1).
  SearchRewrite (_*_ + _*_).
  rewrite Z.mul_add_distr_r.
  rewrite <- H0.
  rewrite <- H1.
  ring.
Qed.

Theorem mod_add_cong :
  ∀ x1 x2 y1 y2,
    x1 ≡ x2 →
    y1 ≡ y2 →
    x1 + y1 ≡ x2 + y2.
Proof.
  intros x1 x2 y1 y2 [k0 H0] [k1 H1].
  unfold modEq.
  exists (k0 + k1).
  rewrite Z.mul_add_distr_r.
  rewrite <- H0.
  rewrite <- H1.
  ring.
Qed.

Goal n = 17 → 3 + 11 ≡ (-14) + 28.
Proof.
  intros.
  apply mod_add_cong; unfold modEq; rewrite H.
  exists 1. ring.
  exists (-1). ring.
Qed.


Hypothesis mod_mul_cong :
  ∀ x1 x2 y1 y2,
    x1 ≡ x2 →
    y1 ≡ y2 →
    x1*y1 ≡ x2*y2.
(* Proof. *)
(*   intros x1 x2 y1 y2 [k0 H0] [k1 H1]. *)
(*   unfold modEq. *)
(*   exists (k0*(-k1)*n). *)
(*   replace (k0 * (-k1) * n  * n) *)
(*     with ((k0 * n) * -(k1 * n)) *)
(*     by ring. *)
(*   rewrite <- H0. *)
(*   rewrite <- H1. *)
(*   replace ((x1 - x2) * - (y1 - y2)) *)
(*     with (-x1*y1 + x2*y1 + x1*y2 - x2*y2) *)
(*     by ring. *)


