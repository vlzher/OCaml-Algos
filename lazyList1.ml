type 'a llist = LNil | LCons of 'a * (unit -> 'a llist);;  

let rec toLazyList l =
  match l with
  | [] -> LNil
  | x::xs -> LCons (x, fun () -> toLazyList xs);;


let rec length l =
  match l with
  | LNil -> 0
  | LCons (_, tl) -> 1 + length (tl ())
;;


let rec filterByLength llist n =
  match llist with
  | LNil -> LNil
  | LCons (x, tl) -> if (length x) <= n then LCons (x, fun () -> filterByLength (tl ()) n) else filterByLength (tl ()) n;;

  let arr = toLazyList['a','b','c'];;
  let arr1 = toLazyList[2,3];;
  let arr2 = toLazyList[5.0,6.0];;
  let arrFinal = toLazyList [arr,arr1,arr2];;

  
  filterByLength arrFinal 3;;



