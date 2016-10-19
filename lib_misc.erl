-module(lib_misc).
-export([for/3,qsort/1,pythag/1,perms/1,listGuade/1,odds_and_evens/1,odds_and_evens_acc/1]).

%% my custmized for loop
%% control structure
for(Max, Max, F) -> [F(Max)];
for(I, Max, F)   -> [F(I)|for(I+1, Max, F)].

qsort([])        ->
    [];

%% ++ is not a efficiency way to do sort, just sample code
qsort([Pivot|T]) ->
    qsort([X || X<-T,X<Pivot])
        ++ [Pivot] ++
        qsort([X || X<-T,X>=Pivot]).

%% =:= means equal
%% we have a few conditions for the List comprehension 
pythag(N) ->
    [{A,B,C}||A<- lists:seq(1,N),
              B<- lists:seq(1,N),
              C<- lists:seq(1,N),
              A*A + B*B =:= C*C
    ].

%% 排列组合
%% List -- [element]   -> remove the element from the list
perms([])  ->
    [[]];
perms(L) ->
    [[H|T] || H<-L,T<-perms(L -- [H])].



listGuade(M) when is_list(M)->
    M.

%% traverse the list twice
odds_and_evens(L)->
    Odds = [X||X<-L,(X rem 2) =:= 1],
    Evens = [X || X<- L, (X rem 2) =:= 0],
    {Odds, Evens}.


%% only traverse the list once to get two result lists
odds_and_evens_acc(L)->
    odds_and_evens_acc(L,[],[]).
odds_and_evens_acc([H|T],Odds,Evens)->
    case (H rem 2) of
        1 -> odds_and_evens_acc(T,[H|Odds],Evens);
        0-> odds_and_evens_acc(T,Odds,[H|Evens])
    end;

%% lists:reverse just reverse the order of elements in the list
odds_and_evens_acc([],Odds,Evens) ->{lists:reverse(Odds),lists:reverse(Evens)}.
