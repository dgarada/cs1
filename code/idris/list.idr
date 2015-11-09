module list

import nat
import bool
import eq
import Serialize

infixr 7 ::

data list a = nil | (::) a (list a)


||| return the length of any given list
length : list a -> nat
length nil = O
length (n::l') = S (length l')

||| return the result of appending two lists
(++) : list a -> list a -> list a
(++) nil x' = x'
(++) (h::t') x' = h:: (t' ++ x')

map: (a -> b) -> list a -> list b
map f nil = nil
map f (h :: t) = (f h) :: (map f t)

||| if then
ite: bool -> a -> a -> a
ite true tb fb = tb
ite false tb fb = fb

||| give a list and a predicate on elements return the sublist of elements for which the predicate is true
filter: (a -> bool) -> list a -> list a
filter f nil = nil
filter f (h::t) = ite (f h)
                      (h::(filter f t))
                          (filter f t)

fancyplus: list nat -> nat
fancyplus nil = O
fancyplus (h::t) = add h (fancyplus t)

fancymult: list nat -> nat
fancymult nil = (S O)
fancymult (h::t) = mult h (fancymult t)

--binary operator, identity element, type of list element
fancy : (a -> a -> a) -> a -> (list a) -> a
fancy f id nil = id
fancy f id (h::t) = f (h) (fancy f id t)

fancyappend: list String -> String
fancyappend nil = ""
fancyappend (h::t) = h ++ (fancyappend t)

foldr: (a -> a -> a) -> a -> list a -> a
foldr f id nil = id
foldr f id (h::t) = f h (list.foldr f id t)

member : (eq a) => a -> list a -> bool
member v nil = false
member v (h::t) = ite (eql v h)
                    true
                    (member v t)

instance (eq a) => eq (list a) where
  eql nil nil = true
  eql (h::t) nil = false
  eql nil (h::t) = false
  eql (h1::t1) (h2::t2) = and (eql h1 h2) (eql t1 t2)

subset_elements: (eq a) => list a -> list a -> bool
subset_elements nil l2 = true
subset_elements (h::t) l2 = and
                            (member h l2)
                            (subset_elements t l2)

same_elements: (eq a) => list a -> list a -> bool
same_elements l1 l2 = and (subset_elements l1 l2) (subset_elements l2 l1)

toStringList: (Serialize a) => list a -> String
toStringList nil = ""
toStringList (h::nil) = (toString h)
toStringList (h::t) = (toString h) ++ "," ++ (toStringList t)

instance (Serialize a) => Serialize (list a) where
  toString nil = "[]"
  toString l = "[" ++ (toStringList l) ++ "]"
