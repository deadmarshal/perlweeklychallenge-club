structure Ch1 : sig
  val alternateCase : string -> int
end =
struct 
  fun upperPositions (s:string):int list =
      let
	fun helper i acc =
	    if i < 0 then acc
	    else
	      let val c = String.sub(s,i)
	      in
		helper (i-1) (if c >= #"A" andalso c <= #"Z"
			      then i :: acc
			      else acc)
	      end
      in
	helper (String.size s - 1) []
      end

  fun cost (upper:int list) (start:int):int =
      let
	fun helper [] _ acc = acc
	  | helper (u::us) t acc = helper us (t+2) (acc + abs(u-t))
      in
	helper upper start 0
      end

  fun alternateCase (s:string):int =
      let val uppers = upperPositions s
      in
	Int.min(cost uppers 0,cost uppers 1)
      end
end

val _ =
  let
    val l = List.map Ch1.alternateCase ["aAbB","AAbb",
					"AAAbbb","aABb",
					"bBBAaa"]
  in
    List.app (fn e => print(Int.toString e ^ " ")) l;
    print("\n")
  end

