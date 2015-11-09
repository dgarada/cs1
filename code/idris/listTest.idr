module listTest

import list
import nat
import person

l0 : list nat
l0 = nil

l1: list nat
l1 = O:: nil

l2: list nat
l2 = ((S O):: ((S(S O)):: nil))

l3: list nat
l3 = ((S O):: ((S(S O)):: ((S(S(S O))):: nil)))

l4: list nat
l4 = ((S O):: nil)

l5: list nat
l5 = ((S(S(S(S(S(S O)))))):: nil)

l6: list nat
l6 = ((S(S(S(S(S(S(S O))))))):: nil)

len: list a -> nat
len (l2 :: l3') = S (len l3')
len nil = O

t: list nat
t = map evenb (O::(S O) :: (S (S O)) :: (S(S(S(S O)))) nil)
