-module(ch2).
-export([alternating_vowels_consonants/1]).
-include_lib("eunit/include/eunit.hrl").

-spec is_vowel(C) -> R when
    C :: char(),
    R :: boolean().
is_vowel(C) -> lists:member(C,"aeiou").

-spec tails(L) -> R when
    L :: [term()],
    R :: [[term()]].
tails([]) -> [];
tails(L=[_|T]) -> [L|tails(T)].

-spec alt_run(L) -> R when
    L :: [string()],
    R :: [string()].
alt_run([]) -> [];
alt_run([H|T]) -> [H|run(H,T)].

-spec run(Prev,Rest) -> R when
    Prev :: string(),
    Rest :: [string()],
    R :: [string()].
run(_,[]) -> [];
run(Prev,[C|Rest]) -> 
  case is_vowel(Prev) =/= is_vowel(C) of
    true -> [C|run(C,Rest)];
    false -> []
  end.

-spec prefixes(L) -> R when
    L :: [term()],
    R :: [[term()]].
prefixes(L) -> [lists:sublist(L,N) || N <- lists:seq(1,length(L))].

-spec alternating_vowels_consonants(L) -> R when
    L :: [string()],
    R :: [string()].
alternating_vowels_consonants(L) ->
  Sorted = lists:sort(fun(A,B) -> length(A) =< length(B) end,
		      [string:lowercase(S) || S <- L]),
  [Src|Others] = Sorted,
  Candidates = [P || T <- tails(Src), P <- prefixes(alt_run(T))],
  Common = [P || P <- Candidates,
		 P =/= "",
		 lists:all(fun(O) -> string:find(O,P) =/= nomatch end, 
			   Others)],
  case Common of
    [] -> [];
    _ ->
      Max = lists:max([length(P) || P <- Common]),
      lists:usort([P || P <- Common,length(P) =:= Max])
  end.

-ifdef(TEST).
alternating_vowels_consonants_test_() ->
  [
   {"Example 1",?_assertEqual(["locate"],
			      alternating_vowels_consonants(
				["relocate","delocate","allocate"]))},
   {"Example 2",?_assertEqual([],
			      alternating_vowels_consonants(
				["apple","banana","cherry"]))},
   {"Example 3",?_assertEqual(["avi"],
			      alternating_vowels_consonants(
				["navigate","cavity","gravity"]))},
   {"Example 4",?_assertEqual(["peda"],
			      alternating_vowels_consonants(
				["pedalgia","pedalboard","pedantic"]))},
   {"Example 5",?_assertEqual(["ho","ol"],
			      alternating_vowels_consonants(
				["schoolmaster","schoolhouse","schooling"]))}
  ].
-endif.

