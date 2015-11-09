module Bit

--Data type 
data Bit = one | zero 

--Functions
change: Bit -> Bit 
change zero = one 
change one = zero 
