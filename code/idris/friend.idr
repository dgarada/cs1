module frined

import bool

||| A friend is someone who is or isn't trustworthy, who has a name, and who has an age in years.

data friend = mkFriend bool String Nat

f1: friend
f1 = mkFriend true "Spencer" 21

f2: friend
f2 = mkFriend false "Calum" 19

getAge: friend -> Nat
getAge (mkFriend b s n) = n

getName: friend -> String
getName (mkFriend b s n) = s

getTrust: friend -> bool
getTrust (mkFriend b s n) = b
