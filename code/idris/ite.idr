module if_then_else

import bool
import list


||| if then
ite: bool -> a -> a -> a
ite true tb fb = tb
ite false tb fb = fb

map: (a -> b) -> list a -> list b
map f nil = nil
map f (h :: t) = (f h) :: (list.map f t)

||| give a list and a predicate on elements return the sublist of elements for which the predicate is true
filter: (a -> bool) -> list a -> list a
filter f nil = nil
filter f (h::t) = list.ite (f h)
                      (h::(list.filter f t))
                          (list.filter f t)
