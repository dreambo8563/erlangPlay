-module(lib_misc).
-export([for/3,qsort/1,pythag/1,perms/1,test/1]).

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
