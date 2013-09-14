-module(demo).

-export([twice/1]).

twice(N) -> 2 * N.

%% Tests

-ifdef('TEST').
-include_lib("eunit/include/eunit.hrl").

api_1_test() ->
    ?assert(2 =:= twice(1)).

api_2_test() ->
    ?assert(3 =:= twice(2)).

-endif.
