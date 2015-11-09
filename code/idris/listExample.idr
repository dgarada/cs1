module listExample

import banger
import list
import bool

record bangers where
      constructor mkBeatRow
      name : String
      banger : bool
      price : Nat

n1': list bangers
n1' = (French_toast :: true) (20 :: nil')
