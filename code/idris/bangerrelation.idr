module banger_relation

import relation
import banger
import bangers
import list
import bool
import pair

number: Nat
number = query songs bangers countOne plus 0

totaltempo: Nat
totaltempo = query songs bangers banger.tempo mult 1

names: String
names = query songs bangers name (++) ""

aveAge: pair Nat Nat
aveAge = ave_rel songs bangers banger.tempo
