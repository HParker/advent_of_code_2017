-module(day2).
-export([answer/1]).

answer(Input) ->
    Rows = [[list_to_integer(Elem) || Elem <- string:split(Row, " ", all)] || Row <- string:split(Input, "\n", all)],
    checksum(Rows, 0).

checksum([H | R], Sum) ->
    Hi = lists:filter(fun(X) ->
                         lists:any(fun(Y) ->
                                           (X rem Y =:= 0) and (X /= Y)
                                   end, H) or
                         lists:any(fun(Y) ->
                                           (Y rem X =:= 0) and (X /= Y)
                                   end, H)
                 end, H),
    io:fwrite("~p ~n", [Hi]),
    Min = lists:min(Hi),
    Max = lists:max(Hi),
    checksum(R, (Sum + (Max div Min)));
checksum([], Sum) ->
    Sum.
