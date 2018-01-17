-module(day1).
-export([answer/1]).

repeats([H | R], [H | R2], Sum) ->
    repeats(R,R2, Sum + H);
repeats([H | R], [H2 | R2], Sum) ->
    repeats(R,R2, Sum);
repeats([], [], Sum) ->
    Sum.

shift_by(0, List) ->
    List;
shift_by(Offset, List) ->
    [H | R] = List,
    shift_by(Offset - 1, R ++ [H]).

answer(Input) ->
    Tokens = [list_to_integer([X]) || X <- Input],
    Offset = length(Tokens) div 2,
    repeats(Tokens, shift_by(Offset, Tokens), 0).
