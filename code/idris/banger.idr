module banger

import bool
import list

||| record type that is equivalent to: (data bangers = mkBeatRow String bool Nat) but where we give names to fields. A beat has a  beat name, a tempo and if its a banger.

record Bangers where
      constructor mkbeatRow
      name : String
      bangers : bool
      tempo : Nat

b1: Bangers
b1 = mkbeatRow "French" true 78

b2: Bangers
b2 = mkbeatRow "Amor" true 62

b3: Bangers
b3 = mkbeatRow "Lucy" false 81

b4: Bangers
b4 = mkbeatRow "Fore" true 81

t: Nat
t = tempo b1
-- expect 78

-- Here we get the name of person p.
n: String
n = name b1
-- expect "French_toast"

beatName: Bangers -> String
beatName (mkbeatRow name banger tempo) = name

bangerstatus: Bangers -> bool
bangerstatus (mkbeatRow name banger tempo) = banger

tempo: Bangers -> Nat
tempo (mkbeatRow name banger tempo) = tempo
