-module(try_test).
-export([generate_exeception/1,demo1/0]).
generate_exeception(1)->
    a;
generate_exeception(2) ->
    throw(a);
generate_exeception(3) ->
    exit(a);
generate_exeception(4) ->
    {'EXIT',a};
generate_exeception(5) ->
    erlang:error(a).

demo1()->
    [catcher(I) || I <- [1,2,3,4,5]].
catcher(N)->
    try generate_exeception(N) of
        Val -> {N,normal,Val}
    catch
        throw:X ->
            {N, caught, thrown,X};
        exit:X ->
            {N, caught, exit,X};
        error:X->
            {N,caught, error,X}
    end.
