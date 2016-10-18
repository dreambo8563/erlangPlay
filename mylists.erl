-module(mylists).
-export([sum/1,map/2]).

sum([H|T]) ->
    H+sum(T);
sum([])    ->0.

%% we don't care the F, so just _ as the placeholder
map(_,[])->
    [];
map(F,[H|T]) ->[F(H)|map(F,T)].
