module dnaTest

import dna

|||expecting T
v: base
v = complement_base A

||| expecting A
c: base
c = complement_base T

|||expecting G
f: base
f = complement_base C

||| expecting C
z: base
z = complement_base G
