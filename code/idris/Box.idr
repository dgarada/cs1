module Box

import eq
import Serialize

data Box t = mkBox t

unbox: Box t -> t
unbox (mkBox b) = b

instance (eq a) => eq (Box a) where
  eql (mkBox d1) (mkBox d2) = eql d1 d2

instance (Serialize a) => Serialize (Box a) where
  toString (mkBox b) = "(" ++ (toString b) ++ ", )"
