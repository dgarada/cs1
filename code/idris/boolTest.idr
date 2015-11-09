module boolTest

import bool
import pair

||| a test expecting true
a1: bool
a1 = and true true

||| a test expecting false
a2: bool
a2 = and true false

||| a test expecting false
b1: bool
b1 = or false false

||| a test expecting true
b2: bool
b2 = or false true

||| a test expecting true
c1: bool
c1 = nand false true

||| a test expecting true
d1: bool
d1 = xor true true

||| a test expecting true
d2: bool
d2 = xor false true

||| a test expecting false
d3: bool
d3 = xor false false
