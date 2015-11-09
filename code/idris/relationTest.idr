module relationTest

import person
import people
import relation
import list
import bool
import pair

number: Nat
number = query people gender countOne plus 0

years: Nat
years = query people gender age plus 0
s
totalInches: Nat
totalInches = query people gender height mult 1

names: String
names = query people gender name (++) ""

aveAge: pair Nat Nat
aveAge = ave_rel people gender age
