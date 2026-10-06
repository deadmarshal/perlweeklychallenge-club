
structure Ch2 : sig
  val alternatingVowelsConsonants : string list -> string list
end =
struct
  fun isVowel (c : char) : bool = Char.contains "aeiou" c

  fun tails (s : string) : string list =
      List.tabulate (String.size s,
		     fn i => String.extract (s, i, NONE))

  fun prefixes (s : string) : string list =
      List.tabulate (String.size s,
		     fn i => String.substring (s, 0, i + 1))

  fun altRun (s : string) : string =
      if s = "" then ""
      else
	let
	  fun go i =
              if i >= String.size s then i
              else if isVowel (String.sub (s, i - 1)) <>
			      isVowel (String.sub (s, i))
              then go (i + 1)
              else i
	in
	  String.substring (s, 0, go 1)
	end

  fun sortByLength (l : string list) : string list =
      let
	fun ins (x, []) = [x]
	  | ins (x, y :: ys) =
            if String.size y > String.size x then x :: y :: ys
            else y :: ins (x, ys)
      in
	List.foldl ins [] l
      end

  fun usort (l : string list) : string list =
      let
	fun ins (x, []) = [x]
	  | ins (x, y :: ys) =
            case String.compare (x, y) of
              LESS => x :: y :: ys
            | EQUAL => y :: ys
            | GREATER => y :: ins (x, ys)
      in
	List.foldl ins [] l
      end

  fun alternatingVowelsConsonants (l : string list) : string list =
      let
	val lowered = List.map (String.map Char.toLower) l
	val sorted = sortByLength lowered
	val (src, others) =
	  case sorted of
            s :: rest => (s, rest)
	  | [] => raise Match
	val candidates =
	  List.concat (List.map
			 (fn t => prefixes (altRun t)) (tails src))
	val common =
	  List.filter
            (fn p =>
               p <> "" andalso
               List.all
		 (fn other => String.isSubstring p other) others)
            candidates
      in
	case common of
	  [] => []
	| _ =>
          let
            val maxLen = List.foldl
			   (fn (p, m) => Int.max (String.size p, m))
			   0
			   common
          in
            usort (List.filter
		     (fn p => String.size p = maxLen) common)
          end
      end
end

val _ =
  let
    fun printStringList xs =
	print(String.concatWith ", " xs ^ "\n")
    val l = List.map Ch2.alternatingVowelsConsonants
		     [["relocate","delocate","allocate"],
		      ["apple","banana","cherry"],
		      ["navigate","cavity","gravity"],
		      ["pedalgia","pedalboard","pedantic"],
		      ["schoolmaster","schoolhouse","schooling"]]
  in
    List.app printStringList l;
    print("\n")
  end

