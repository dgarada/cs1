module Practice

data Practice =  Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday | True | False

data pair a b = mkPair a b

fst: pair a b -> a
fst (mkPair f s) = f
fst (mkPair Monday True) = Monday
