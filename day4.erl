-module(day4).
-export([answer/1]).

answer(Input) ->
    Passwords = [string:split(Row, " ", all) || Row <- string:split(Input, "\n", all)],
    GoodPasswords = lists:filter(fun has_uniq_words/1, Passwords),
    io:fwrite("~p ~n", [GoodPasswords]),
    length(GoodPasswords).

has_uniq_words(PasswordUnsorted) ->
    Password = [lists:sort(P) || P <- PasswordUnsorted],
    length(Password) =:= sets:size(sets:from_list(Password)).
