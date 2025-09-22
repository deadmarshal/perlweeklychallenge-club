signature CH1 =
sig
  val duplicateRemovals : string -> string
end

structure Ch1 : CH1 =
struct
fun duplicateRemovals str =
    let fun go stk [] = rev stk
	  | go [] (x::xs) = go [x] xs
	  | go (s::stk) (x::xs) =
	    if s = x then go stk xs
	    else go (x::s::stk) xs
	val res = go [] (String.explode str)
    in
      String.implode res
    end
end  
  
