module naturalTest

import natural
import pair
import bool

--zero

z: nat
z = O

--one
o: nat
o = S O

--two
t: nat
t = S (S O)

--three
r: nat
r = S t

--four
fr: nat
fr = S (S t)

--five
fv: nat
fv = S (S (S t))

a: bool
a = evenb O
b: bool
b = evenb (S O)
c: bool
c = evenb (S (S O))
d: bool
d = evenb r
e: bool
e = evenb (S r)

x: bool
x = isZero r
y: nat
y = (succ O)

|||a test, expecting O
h1: nat
h1 = add O O

|||a test, expecting S (S O)
h2: nat
h2 = add  O (S (S O))

|||a test, expecting (S O)
h3: nat
h3 = add (S O) O

|||a test, expecting (S (S (S (S (S O)))))
h4: nat
h4 = add (S (S O)) (S (S (S O)))

||| a test, expecting true
g1: bool
g1 = lepp O O

||| a test, expecting false
g2: bool
g2 = lepp (S O) O

||| a test, expecting false
g3: bool
g3 = lepp (S(S(S O))) (S(S O))

||| a test expecting O
d1: nat
d1 = expp O O

||| a test expecting (S O)
d2: nat
d2 = expp (S(S(S O))) (S O)

||| a test expecting (S(S(S(S(S(S(S(S O))))))))
d3: nat
d3 = expp (S(S O)) (S(S(S O)))

||| a test expecting true
f1: bool
f1 = eqpp O O

||| a test expecting false
f2: bool
f2 = eqpp  (S O) O

||| a test expecting false
f3: bool
f3 = eqpp (S O) (S(S O))

||| a test expecting true
s1: bool
s1 = gepp O O

||| a test expecting true
s2: bool
s2 = gepp (S O) O

||| a test expecting false
s3: bool
s3 = gepp (S(S O)) (S(S(S O)))

||| a test expecting false
k1: bool
k1 = gtpp O O

||| a test expecting true
k2: bool
k2 = gtpp (S O) O

||| a test expecting true
k3: bool
k3 = gtpp (S(S(S O))) (S(S O))

||| a test expecting false
v1: bool
v1 = ltpp O O

||| a test expecting false
v2: bool
v2 = ltpp (S O) O

||| a test expecting false
v3: bool
v3 = ltpp (S(S(S O))) (S(S O)))
