-module(day3).
-export([answer/1]).

answer(Input) ->
    Ring = get_ring(Input, 0),
    MinDistance = Ring,
    DistanceToCenter = distance_to_corner(Input, Ring),
    io:fwrite("~p + ~p ~n", [Ring, DistanceToCenter]),
    MinDistance + DistanceToCenter.

distance_to_corner(Input, Ring) ->
    RingMin = math_word(Ring - 1) + 2,
    RingMax = math_word(Ring) + 1,
    Index = index_of(Input, lists:seq(RingMin, RingMax)),
    io:fwrite("Index: ~p Ring: ~p Range: ~p...~p ~n", [Index, Ring, RingMin, RingMax]),
    if
        (Index rem Ring =:= 0) and (Index rem (Ring * 2) =:= 0) ->
            io:fwrite("I should get here for 13. ~n"),
            Ring;
        true ->
            Index rem Ring
    end.



math_word(Num) when Num >= 1 ->
    8 * Num + math_word(Num - 1);
math_word(_) ->
    0.

index_of(Item, List) -> index_of(Item, List, 1).

index_of(_, [], _)  -> not_found;
index_of(Item, [Item|_], Index) -> Index;
index_of(Item, [_|Tl], Index) -> index_of(Item, Tl, Index+1).

get_ring(Number, RingGuess) ->
    NextRingMax = math_word(RingGuess) + 1,
    if Number =< NextRingMax ->
            RingGuess;
       true ->
            get_ring(Number, RingGuess + 1)
    end.
