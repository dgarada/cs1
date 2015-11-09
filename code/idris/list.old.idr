module list_nat

import pair
import nat

data list_nat = nil | cons nat list_nat

l0 : list_nat
l0 = nil

l1: list_nat
l1 = cons O nil

l2: list_nat
l2 = (cons (S O) (cons (S(S O)) nil))

l3: list_nat
l3 = (cons (S O) (cons (S(S O)) (cons (S(S(S O))) nil)))

l4: list_nat
l4 = (cons (S O) nil)

l5: list_nat
l5 = (cons (S(S(S(S(S(S O)))))) nil)

l6: list_nat
l6 = (cons (S(S(S(S(S(S(S O))))))) nil)

length: list_nat -> nat
length nil = O
length (cons n l') = S (length l')

len_13: nat
len_13 = length l3

append: pair list_nat list_nat -> list_nat
append (mkPair nil l2) = l2
append (mkPair (cons n| 1') |2) = cons n (append (mkPair |1' |2))
