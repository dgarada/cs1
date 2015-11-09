module DNA

import list
import nat

data base = A | T | C | G

data pair a b = mkPair a b

adenine: pair base base
adenine = mkPair A T

thyamine: pair base base
thyamine = mkPair T A

guainine: pair base base
guainine = mkPair G C

cytosine: pair base base
cytosine = mkPair C G

complement_base: base -> base
complement_base A = T
complement_base T = A
complement_base G = C
complement_base C = G

complement_strand: list base -> list base
complement_strand (h::t) = map complement_base (h::t)

strand1: list (pair base base) -> list base
strand1 (adenine::guainine::thyamine::cytosine::nil) = (A::G::T::C::nil)
strand1  (mkPair a b::mkPair c d::mkPair e f::mkPair g h::nil) = (a::c::e::g::nil)

strand2: list (pair base base) -> list base
strand2 (adenine::guainine::thyamine::cytosine::nil) = (T::C::A::G::nil)
strand2 (mkPair a b::mkPair c d::mkPair e f::mkPair g h::nil) = (b::d::f::h::nil)

complete: list base -> list (pair base base)
complete nil = nil
complete (h::t) = (mkPair h (complement_base h)) :: (complete t)
