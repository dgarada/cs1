module nat

import bool
import pair

data nat = O | S nat


|||returns true if the argument is (represents) zero, otherwise false
isZero: nat -> bool
isZero O = true
isZero _ = false


|||returns the successor of  any given nat
succ: nat-> nat
succ n = S n


|||returns the predecessor of any given nat
pred: nat -> nat
pred O = O
pred (S n) = n

|||returns true if the argument is even otherwise false
evenb: nat -> bool
evenb O = true
evenb (S O) = false
evenb (S (S n)) = evenb n


oddb: nat -> bool
oddb n = not (evenb n)

add : nat -> nat -> nat
add O m = m
add (S n) m = S (add n m)

fact: nat -> nat -> nat
fact O = S O
fact (S n) = mult (S n) (fact n)

mult: nat -> nat -> nat
mult O m = O
mult (S n) m = add m (mult n m)

sub: nat -> nat -> nat
sub O m = O
sub n O = n
sub (S n) (S m) = sub n m

lepp: nat -> (nat -> bool)
lepp O m = true
lepp (S n) O = false
lepp (S n) (S m) = lepp n m

expp: nat -> nat -> nat
expp O n = O
expp (S n) O = S O
expp n (S O) = S O
expp (S n) (S m) = mult (S n) (expp (S n) (S n))

eqpp: nat -> (nat -> bool)
eqpp O m = true
eqpp (S n) O = false
eqpp (S n) (S m) = not (and true false)

gepp: nat -> (nat -> bool)
gepp O m = true
gepp (S n) O = true
gepp (S n) (S m) = gepp n m

gtpp: nat -> (nat -> bool)
gtpp O m = false
gtpp (S n) O = true
gtpp (S n) (S m) = not (lepp n m)

ltpp: nat -> (nat -> bool)
ltpp O m = false
ltpp (S n) O = false
ltpp (S n) (S m) = not (gepp n m)
