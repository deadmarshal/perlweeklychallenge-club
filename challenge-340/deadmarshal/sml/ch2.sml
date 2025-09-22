signature CH2 =
sig
  val ascendingNumbers : string -> bool
end

structure Ch2 : CH2 =
struct
fun words s =
    let fun split [] acc current =
	    if null current then rev acc
	    else rev (implode (rev current) :: acc)
	  | split (c::cs) acc current =
	    if c = #" " then
	      if null current then split cs acc current
	      else split cs (implode (rev current) :: acc) []
	    else split cs acc (c::current)
    in
      split (explode s) [] []
    end
      
fun isAscending [] = true
  | isAscending [_] = true
  | isAscending (x::y::xs) = (x < y) andalso isAscending (y::xs)

fun isDigit c = c >= #"0" andalso c <= #"9"
				 
fun ascendingNumbers str =
    let val ws = words str
	val filtered = List.filter
			 (fn s => List.all isDigit (String.explode s))
			 ws
	val l = map (Option.valOf o Int.fromString) filtered
    in
      isAscending l
    end
end

