-module(ch1).
-export([duplicate_removals/1,main/0]).

-spec duplicate_removals(string()) -> string().
duplicate_removals(Str) ->
  duplicate_removals(Str,[]).

duplicate_removals([],Stk) ->
  lists:reverse(Stk);
duplicate_removals([X|Xs],[]) ->
  duplicate_removals(Xs,[X]);
duplicate_removals([X|Xs],[S|Stk]) when S =:= X -> 
  duplicate_removals(Xs,Stk);
duplicate_removals([X|Xs],[S|Stk]) -> 
  duplicate_removals(Xs,[X,S|Stk]).

main() ->
  io:format("~p~n~p~n~p~n~p~n~p~n",
	    [duplicate_removals("abbaca"),
	     duplicate_removals("azxxzy"),
	     duplicate_removals("aaaaaaaa"),
	     duplicate_removals("aabccba"),
	     duplicate_removals("abcddcba")]).

