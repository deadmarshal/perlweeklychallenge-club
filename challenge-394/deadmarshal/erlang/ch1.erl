-module(ch1).
-export([alternate_case/1]).
-include_lib("eunit/include/eunit.hrl").

-spec upper_positions(S) -> R when
    S :: string(),
    R :: [integer()].
upper_positions(S) ->
  [I || {I,C} <- lists:enumerate(0,S),C >= $A,C =< $Z].

-spec cost(Upper,Start) -> R when
    Upper :: [integer()],
    Start :: integer(),
    R :: integer().
cost(Upper,Start) ->
  lists:sum([abs(U - T) || {T,U} <- lists:enumerate(Start,2,Upper)]).

-spec alternate_case(S) -> R when
    S :: string(),
    R :: integer().
alternate_case(S) ->
  UppersPos = upper_positions(S),
  min(cost(UppersPos,0),cost(UppersPos,1)).

-ifdef(TEST).
alternate_case_test_() ->
  [
   {"Example 1",?_assertEqual(0,alternate_case("aAbB"))},
   {"Example 2",?_assertEqual(1,alternate_case("AAbb"))},
   {"Example 3",?_assertEqual(3,alternate_case("AAAbbb"))},
   {"Example 4",?_assertEqual(1,alternate_case("aABb"))},
   {"Example 5",?_assertEqual(2,alternate_case("bBBAaa"))}
  ].
-endif.


