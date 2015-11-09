import eq
import bool
import nat
import unit
import list

b: bool
b = (eql true true)

b2: bool
b2 = (eql true false)

n: bool
n = (eql O O)

u: bool
u = (eql u v)

isThree: bool
isThree = (member (S(S(S O))) l2)
