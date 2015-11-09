module person

import bool
import list

||| A record type that is equivalent to: (data Person = mkPerson String nat) but where we give names to fields. A person has a name and an age in years.

record Person where
    constructor mkPerson
    name : String
    age : Nat
    height : Nat
    gender : bool

p1: Person
p1 = mkPerson "Tom" 18 72 false

p2: Person
p2 = mkPerson "Mary" 21 68 true

t: Nat
t = age p1
-- expect 18

-- Here we get the name of person p.
n: String
n = name p1
-- expect "Tom"

getName: Person -> String
getName (mkPerson name age height gender) = name

getAge: Person -> Nat
getAge (mkPerson name age height gender) = age

getHeight: Person -> Nat
getHeight (mkPerson name age height gender) = height

getGender: Person -> bool
getGender (mkPerson name age height gender) = gender

setName: Person -> String -> Person
setName p n = record { name = n } p


map': (a -> b) -> list a -> list b
map' f nil = nil
map' f (h :: t) = (f h) :: (map f t)
