type llist = LNil| LCons of int * (unit -> llist);;
let rec ltake (n, lxs) =
    match (n, lxs) with
    (0, _) -> []
    | (_, LNil) -> []
    | (n, LCons(x,xf)) -> x::ltake(n-1, xf());;
let rec lfrom k = LCons (k, function () -> lfrom (k+1));;
let getHeadValue llist = 
    match llist with
    | LNil -> 0 
    | LCons (x, _) -> x;;
let rec lpowiel1(llist,n) =
    match (llist , n) with
    | (LNil, _) -> LNil
    | (LCons (x, xf), 0) -> LCons (x, function () -> lpowiel1(xf(), getHeadValue(xf())-1))
    | (LCons (x, _), _) -> LCons (x, function () -> lpowiel1(llist, n-1));;   
let  lpowiel llist = lpowiel1(llist, getHeadValue(llist)-1);; 
lpowiel(lfrom 1);;
ltake(6, lpowiel(lfrom 1));;
