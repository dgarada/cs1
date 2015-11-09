countBase: list base -> base -> nat
countBase (h::t) = list.foldr map id (h::t)
