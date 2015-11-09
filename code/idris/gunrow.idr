module gunrow

import list

data country = Argentina | Australia | Austria | Honduras | USA

||| A record of this type represents a country and the death rate per 10,000,000 by gun homicides, suicides, unintentional, and other deaths

data gunrow = mkGunrow country Nat Nat Nat Nat

argen: gunrow
argen = mkGunrow Argentina 190 279 64 362

aussie: gunrow
aussie = mkGunrow Australia 11 62 5 8

austr: gunrow
austr = mkGunrow Austria 18 268 1 8

hond: gunrow
hond = mkGunrow Honduras 6480 0 0 0

united: gunrow
united = mkGunrow USA 355 670 16 9

countryName: gunrow -> country
countryName (mkGunrow c h s u o) = c

homicidePer10M: gunrow -> Nat
homicidePer10M (mkGunrow c h s u o) = h

suicidePer10M: gunrow -> Nat
suicidePer10M (mkGunrow c h s u o) = s

unintentionalPer10M: gunrow -> Nat
unintentionalPer10M (mkGunrow c h s u o) = u

otherPer10M: gunrow -> Nat
otherPer10M (mkGunrow c h s u o) = o

g1: list gunrow
g1 = (argen, aussie, austr, hond, united)

v1 : list gunrow
v1 = (cons (Argentina (cons 190 (cons 279 (cons 64 (cons 362 nil))))))

v2: list gunrow
v2 = (cons (Australia (cons 11 (cons 62 (cons 5 (cons 8 nil))))))

v3: list gunrow
v3 = (cons (Austria (cons 18 (cons 268 (cons 1 (cons 8 nil))))))

v4: list gunrow
v4 = (cons (Honduras (cons 6480 (cons 0 (cons 0 (cons 0 nil))))))

v5: list gunrow
v5 = (cons (USA (cons 355 (cons 670 (cons 16 (cons 9 nil))))))
