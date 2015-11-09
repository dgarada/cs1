module  relation

import pair
import list
import bool

query: (list tuple) -> (tuple -> bool) -> (tuple -> value) ->
        (value -> value -> value) -> value -> value
query relation select project reduce id = list.foldr reduce id (map project (filter select relation))

countOne: a -> Nat
countOne v = 1

count_rel: (list tuple) -> (tuple -> bool) -> Nat
count_rel relation select = query relation select countOne plus 0

sum_rel: (list tuple) -> (tuple -> bool) -> (tuple -> Nat) -> Nat
sum_rel relation select project = query relation select project plus 0

ave_rel:(list tuple) -> (tuple -> bool) -> (tuple -> Nat) -> pair Nat Nat
ave_rel relation select project = mkPair (sum_rel relation select project) (count_rel relation select)
