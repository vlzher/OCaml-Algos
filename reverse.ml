let odwroc l =
  let rec odwroc1 l1 acc = 
    match acc with
    | [] -> l1
    | hd::tl -> odwroc1 (hd::l1) tl
  in 
  odwroc1 [] l;;

odwroc [5;4;3;2];;



