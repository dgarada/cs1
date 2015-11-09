import set_adt
import bool
import nat
import list
import eq
import option
import pair
import Serialize

--return a set containing 1,2,3
t1: set nat
t1 = set_insert (S O) (mkSet ((S(S O))::(S(S(S O)))::nil))

--return a set containing only false
t2: set bool
t2 = set_remove true (mkSet (true::false::true::nil))

--return length of set ; 4
t3: nat
t3 = set_cardinality (mkSet (true::false::true::false::nil))

--return true
t4: bool
t4 = set_member false (mkSet (true::false::true::nil))

-- return (1,2,3,4)
t5: set nat
t5 = set_union (mkSet ((S O)::(S(S O))::nil)) (mkSet ((S(S(S O)))::(S(S(S(S O))))::nil))

--return a set containing false
t6: set bool
t6 = set_intersection (mkSet (true::false::true::nil)) (mkSet (false::false::nil))

--return a set containing 2,3,4
t7: set nat
t7 = set_difference (mkSet ((S O)::(S(S O))::(S(S(S O)))::nil)) (mkSet ((S O)::(S(S(S(S O))))::nil))

-- return false
t8: bool
t8 = set_forall evenb (mkSet ((S O)::(S(S O))::(S(S(S(S O))))::nil))

-- return true
t9: bool
t9 = set_exists evenb (mkSet ((S O)::(S(S O))::(S(S(S(S O))))::nil))

-- return (some, 2)
t10: option nat
t10 = set_witness evenb (mkSet ((S O)::(S(S O))::(S(S(S(S O))))::nil))

-- return (1,false) (1,true) (1, false) (2,false) (2,true) (2,false) (3,false) (3,true) (3,false)
t11: set (pair nat bool)
t11 = set_product (mkSet ((S O)::(S(S O))::(S(S(S O)))::nil)) (mkSet (false::true::false::nil))

-- return true
t12: bool
t12 = set_eql (mkSet (false::true::false::nil)) (mkSet (true::false::nil))

--return (True,False,True)
t13: String
t13 = set_toString (mkSet (true::false::true::nil))
