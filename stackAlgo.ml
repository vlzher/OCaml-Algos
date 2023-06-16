type eval = Scal of float | Vect of float*float | Neg | Add | Sub | Mul | Prod;;
let instr1 = [Scal 5.; Vect (3.,4.); Mul; Vect( 1., 1.); Prod];;
let instr2 = [Scal 5.; Vect (3.,4.); Mul; Mul];;

let instr3 = [Scal 5.; Scal 5.; Mul];;

type tstack = Scal of float | Vect of float*float;;
let eval (l: eval list) = 
  let rec calculate(e: eval) (s: tstack list) = 
    match e with
    | Scal f -> (Scal f)::s
    | Vect (x,y) -> (Vect (x,y))::s
    | Neg -> (match s with
              | Scal f::s' -> (Scal (-.f))::s'
              | Vect (x,y)::s' -> (Vect (-.x,-.y))::s'
              | [] -> failwith "neg no args")
    | Add -> (match s with
              | Scal f1::Scal f2::s' -> (Scal (f1+.f2))::s'
              | Vect (x1,y1)::Vect (x2,y2)::s' -> (Vect (x1+.x2,y1+.y2))::s'
              | Scal _::Vect (_,_)::_ -> failwith "cant add scal and vect"
              | Vect (_,_)::Scal _::_ -> failwith "cant add scal and vect"
              |_::[] -> failwith "Not enough arguments"
              | [] -> failwith "add no args")
    | Sub -> (match s with
              | Scal f1::Scal f2::s' -> (Scal (f1-.f2))::s'
              | Vect (x1,y1)::Vect (x2,y2)::s' -> (Vect (x1-.x2,y1-.y2))::s'
              | Scal _::Vect (_,_)::_ -> failwith "cant sub scal and vect"
              | Vect (_,_)::Scal _::_ -> failwith "cant sub scal and vect"
              |_::[] -> failwith "Not enough arguments"
              | [] -> failwith "sub no args")
    | Mul -> (match s with
              | Vect (x,y)::Scal f1::s' -> (Vect (f1*.x,f1*.y))::s'
              | Scal f1::Vect (x,y)::s' -> (Vect (f1*.x,f1*.y))::s'
              | Scal _::Scal _::_ -> failwith "wyrazenie jest niepoprawne, typ drugiego argumentu jest niepoprawny"
              | _::[] -> failwith "wyrazenie jest niepoprawne, druga operacja Mul nie ma wystarczajacej liczby argumentow"
              | _ -> failwith "Incorrect multiplication")
    | Prod -> (match s with
               | Vect (x1,y1)::Vect (x2,y2)::s' -> (Scal (x1*.x2+.y1*.y2))::s'
               | Vect _ :: Scal _ :: _ -> failwith "wyrazenie jest niepoprawne, typ drugiego argumentu jest niepoprawny"
               | Scal _ :: _ -> failwith "wyrazenie jest niepoprawne, typ pierwszego argumentu jest niepoprawny"
               | _::[] -> failwith "wyrazenie jest niepoprawne, druga operacja Prod nie ma wystarczajacej liczby argumentow"
               | _ -> failwith "Incorrect product")

  in
  let rec eval_aux(l: eval list) (s: tstack list) = 
    match l with
    | [] -> s
    | e::l' -> eval_aux l' (calculate e s)
  in
  match eval_aux l [] with
  | Scal f::[] -> f
  | Vect (x,y)::[] -> sqrt(x*.x+.y*.y)
  | _ -> failwith "Incorrect last value";;


  eval(instr1);;
  eval(instr2);;
  eval(instr3);;





