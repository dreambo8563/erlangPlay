-module(shop1).
-export([total/1]).

%% Pattern Match
%% [H | T] means Head & Tail of the list

total([{What,N}| T]) ->
    %% invoke the func exported from another module
    %% moduleName:funcName(Args)
    shop:cost(What)* N + total(T);

total([])            ->0.

