-module(mylists).
-export([sum/1,map/2,filter/2,caseFilter/2]).

sum([H|T])           ->
    H+sum(T);
sum([])              ->0.

%% we don't care the F, so just _ as the placeholder
map(_,[])            ->
    [];
map(F,[H|T])         ->[F(H)|map(F,T)].

filter(F,[H|T])      ->
    filter1(F(H),H,F,T);
filter(_,[])         ->[].

filter1(true,H,F,T)  ->
    [H|filter(F,T)];
filter1(false,_,F,T) ->filter(F,T).

caseFilter(F,[H|T])  ->
    case F(H) of
        true -> [H| caseFilter(F,T)];
        false-> caseFilter(F,caseFilter(F,T))
    end;
caseFilter(_,[])->
    [].




