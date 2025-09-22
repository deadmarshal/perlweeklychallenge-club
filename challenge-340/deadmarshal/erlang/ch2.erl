-module(ch2).
-export([ascending_numbers/1,main/0]).

-spec is_ascending([integer()]) -> boolean().
is_ascending([]) -> true;
is_ascending([_]) -> true;
is_ascending([X,Y|Xs]) -> X < Y andalso is_ascending([Y|Xs]).

-spec is_digit(char()) -> boolean().
is_digit(C) -> C >= $0 andalso C =< $9.

-spec ascending_numbers(string()) -> boolean().
ascending_numbers(Str) ->
  L = [list_to_integer(W) || W <- string:lexemes(Str,"\t\n\r\f\s"),
			     lists:all(fun is_digit/1,W)],
  is_ascending(L).

main() ->
  io:format("~p~n~p~n~p~n~p~n~p~n",
	    [ascending_numbers("The cat has 3 kittens 7 toys 10 beds"),
	     ascending_numbers("Alice bought 5 apples 2 oranges 9 bananas"),
	     ascending_numbers("I ran 1 mile 2 days 3 weeks 4 months"),
	     ascending_numbers("Bob has 10 cars 10 bikes"),
	     ascending_numbers("Zero is 0 one is 1 two is 2")]).

