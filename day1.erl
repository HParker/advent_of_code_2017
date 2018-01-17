-module(day1).
-export([answer/1]).

repeats([H, H | R], Sum) ->
    repeats([H | R], Sum + H);
repeats([H, J | R], Sum) ->
    repeats([J | R], Sum);
repeats([Last | []], Sum) ->
    Sum.

rollover(Tokens) ->
    [H | R] = Tokens,
    L = lists:last(R),
    if
        H =:= L -> H;
        true -> 0
    end.

answer(Input) ->
    Tokens = [list_to_integer([X]) || X <- Input],
    repeats(Tokens, 0) + rollover(Tokens).
