;; Original file: bu_9.smt2
(set-logic HORN)
(declare-fun inv ((Array Int Int) Int Int Int) Bool)

(assert (forall ((a (Array Int Int)) (N Int)
                 (x Int) (y Int)) (=> (and (= x 0) (= y 7)) (inv a x y N))))
(assert (forall ((a (Array Int Int))
         (i Int)
         (val Int)
         (N Int)
         (a1 (Array Int Int))
         (i1 Int))
    (=> (and (inv a i val N)
                  (<= i N)
                  (= a1 (ite (= val i) (store a i 0) (store a i i)))
                  (= i1 (+ i 1))) (inv a1 i1 val N))))
(assert (forall ((a (Array Int Int)) (i Int) (val Int) (N Int) (i1 Int) (fail Bool))
  (=> (and (inv a i val N) (> i N) (<= 0 i1) (<= i1 N) (> (select a i1) val))
      false)))
(check-sat)
