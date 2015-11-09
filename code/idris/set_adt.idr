module set_spec

import bool
import list
import option
import nat
import ite
import pair
import eq
import Serialize

data set: (a: Type) -> Type

--The empty set a
emptySet: set a

--If s is empty then return true, otherwise false
isEmpty: (s: set a) -> bool

-- Return the set, s union {v}
set_insert: (eq a) => a -> set a -> set a


-- Return the set, s - {v}
set_remove: (eq a) => (v: a) -> (s: set a) -> set a


-- Return the number of elements in s
set_cardinality: (s: set a) -> nat


-- If v is in s return true, otherwise false
set_member: (eq a) => (v: a) -> (s: set a) -> bool


-- Return union of s1 and s2
set_union: (eq a) => (s1: set a) -> (s2: set a) -> set a


-- Return the intersection of s1 and s2
set_intersection: (eq a) => (s1: set a) -> (s2: set a) -> set a


-- Return the set difference, s1 minus s2
set_difference: (eq a) => (s1: set a) -> (s2: set a) -> set a


-- Return true p is true for every v in s, otherwise false
set_forall: (p: a -> bool) -> (s: set a) -> bool


-- Return true if p is true for some v in s, otherwise else false
set_exists: (p: a -> bool) -> (s: set a) -> bool

-- If (set_exists p s), return (some v) such that (p v) is true, else
-- return none. We need to return an option because there might not be
-- an element in s with property p.  If there is such an element, we
-- call it a "witness to the property p."
set_witness: (p: a -> bool) -> (s: set a) -> option a


-- Return the cartesian product of s1 and s2. That is, return the
-- set of all pairs whose first element is taken from s1 and whose
-- second element is taken from s2. For example, the product of the
-- sets {1, 2} and {a, b} is { (1, a), (1, b), (2, a), (2, b) }.
set_product: (s1: set a) -> (s2: set b) -> set (pair a b)


-- Extra credit: Return the set of all sets of elements of s.
-- For example, the powerset of {1, 2, 3} is the following set:
-- { {}, {1}, {2}, {3}, {1, 2}, {1, 3}, {2, 3}, {1, 2, 3} }. The
-- cardinality of the powerset of a set of cardinality n is 2^n.
set_powerset: (s: set a) -> set (set a)


-- return true if s1 and s2 are equal, else false
set_eql: (eq a) => (s1: set a) -> (s2: set a) -> bool


-- Return a string representation of s
set_toString: (Serialize a) => set a -> String

--Doesn't need implementation
instance (eq a) => eq (set a) where
  eql s1 s2 = set_eql s1 s2

--Doesn't need implementation
instance (Serialize a) => Serialize (set a) where
  toString s = set_toString s
---------------------------------------------------------------------------

data set a = mkSet (list a)

--The empty set (list)
emptySet = mkSet nil

--If s is empty then return true, otherwise false
isEmpty (mkSet nil) = true
isEmpty _ = false

-- set_insert: (v: a) -> (s: set a) -> set a
-- Return the set, s union {v}
set_insert v (mkSet l) = list.ite (member v l)
                             (mkSet l)
                             (mkSet (v::l))

-- helper function: return list l without value v
list_remove: (eq a) => (v: a) -> (l: list a) -> list a
list_remove v nil = nil
list_remove v (h::t) = list.ite (eql v h)
                        (list_remove v t)
                        (h:: list_remove v t)

-- set_remove: (eq a) => (v: a) -> (s: set a) -> set a
-- Return the set, s - {v}
set_remove v (mkSet l) = mkSet (list_remove v l)

-------------------------------------

-- Return the number of elements in s
-- set_cardinality: (s: set a) -> nat
-- relies on rep invariant
set_cardinality (mkSet (nil)) = O
set_cardinality (mkSet l) = length l

-------------------------------------

-- If v is in s return true, otherwise false
--set_member: (v: a) -> (s: set a) -> bool
set_member v (mkSet l) = (member v l)

-------------------------------------

-- Return union of s1 and s2
-- set_union: (s1: set a) -> (s2: set a) -> set a
-- hint, write a function, combine, that combines two
-- lists into one, avoiding duplicate elements

combine: (eq a) => list a -> list a -> list a
combine nil nil = nil
combine nil (h::t) = (h::t)
combine (h::t) nil = (h::t)
combine (h::t) (l2) = list.ite (member h l2)
                       (combine t l2)
                       (h:: combine t l2)

set_union (mkSet l1) (mkSet l2) = mkSet (combine (l1) (l2))

-- here we provide you with an incomplete helper function

intersect: (eq a) => list a -> list a -> list a
intersect nil _ = nil
intersect (h::t) l2 = list.ite (member h l2)
                      (h:: intersect t l2 )
                      (intersect t l2)

-- Return the intersection of s1 and s2
-- set_intersection: (eq a) => set a -> set a -> set a
set_intersection (mkSet l1) (mkSet l2) = mkSet (intersect (l1) (l2))


-- hint: write and use a list_difference helper function

list_difference: (eq a) => list a ->  list a -> list a
list_difference nil nil = nil
list_difference nil (l2) = (l2)
list_difference (l1) nil = (l1)
list_difference (h::t) (l2) = list.ite (member h l2)
                              (list_difference t (list_remove h l2))
                              (h:: list_difference t l2)

-- Return the set difference, s1 minus s2
--set_difference: (eq a) => (s1: set a) -> (s2: set a) -> set a
set_difference (mkSet l1) (mkSet l2) = mkSet (list_difference (l1) (l2))

-------------------------------------

-- hint: write one line of code using higher-order functions

-- Return true p is true for every v in s, otherwise false
-- set_forall: (p: a -> bool) -> (s: set a) -> bool

set_forall p (mkSet l) = not (member (false) (list.map p l))

-------------------------------------

-- hint: write one line of code using higher-order functions

-- Return true if p is true for some v in s, otherwise else false
-- set_exists: (p: a -> bool) -> (s: set a) -> bool
set_exists p (mkSet l) = (member (true) (list.map p l))

list_exists: (p: a -> bool) -> list a -> bool
list_exists p (h::t) = (member (true) (list.map p (h::t)))


-------------------------------------

--hint: write and use a list version of the witness function

-- If (set_exists p s), return (some v) such that (p v) is true,
-- else return none. We need to return an option because of course
-- in general there might not be an element in s with property p.
-- If there is one, we call it a "witness to the property, p."
-- set_witness: (p: a -> bool) -> (s: set a) -> option a

list_witness: (p: a -> bool) -> list a -> option a
list_witness p (h::t) = list.ite (list_exists p (h::t))
                          (
                              list.ite (p h)
                              (some h)
                              (list_witness p t))
                              (none)

set_witness p (mkSet (h::t)) = list.ite (list_exists p (h::t))
                          (
                            list.ite (p h)
                            (some h)
                            (list_witness p t))
                            (none)
-------------------------------------

-- hint: consider writing two levels of helper functions
-- the first takes two lists and returns a list of all pairs
-- the second takes one element and a list and returns all pairs
-- of that element with elements in the list

-- Return the cartesian product of s1 and s2. That is, return the
-- set of all pairs whose first element is taken from s1 and whose
-- second element is taken from s2. For example, the product of the
-- sets {1, 2} and {a, b} is { (1, a), (1, b), (2, a), (2, b) }.
-- set_product: (s1: set a) -> (s2: set b) -> set (pair a b)

-- pair elt takes an elt h and a list b and returns list of all pairs, ( h, e)
--where e is an elements of the list b

pairelt: a -> list b -> list (pair a b)
pairelt someA nil = nil
pairelt someA (b::tb) = (mkPair someA b)::(pairelt someA tb)

-- given a list of a and a list of b return a list of all a-b pairs
pairlist: list a -> list b -> list (pair a b)
pairlist nil lb = nil
pairlist (h::t) lb = (pairelt h lb) ++ (pairlist t lb)


set_product (mkSet la) (mkSet lb) = mkSet (pairlist la lb)

-------------------------------------

-- Extra credit: Return the set of all sets of elements of s.
-- For example, the powerset of {1, 2, 3} is the following set:
-- { {}, {1}, {2}, {3}, {1, 2}, {1, 3}, {2, 3}, {1, 2, 3} }. The
-- cardinality of the powerset of a set of cardinality n is 2^n.
-- set_powerset: (s: set a) -> set (set a)

-------------------------------------

-- Here you need to provide an implementation of set_eql. We
-- worked that out in class, so you might want to just use what
-- we already did.

-- return true if s1 and s2 are equal, else false
--set_eql: (eq a) => (s1: set a) -> (s2: set a) -> bool

set_eql (mkSet l1) (mkSet l2) = list.same_elements l1 l2

-- Return a string representation of s
--set_toString: (Serialize a) => set a -> String

set_toString (mkSet nil) = "{}"
set_toString (mkSet l) = "{" ++ (list.toStringList l) ++ "}"

-------------------------------------

-- Here you need to provide an implementation of set_toString.
-- Format a set like we did with a list, but use curly braces
-- instead of square brackets. Make sure that commas appear in
-- all and only the right places.

-------------------------------------

-- Yeah, you're done! Ok, not quite: Write tests for all of
-- the functions in this module. Put tests in set_adt_test.idr.
-- Indicate the expected value of each test in a corresponding
-- comment.
