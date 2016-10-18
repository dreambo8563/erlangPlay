%%%-------------------------------------------------------------------
%%% @author  <Vincent@VINCENT>
%%% @copyright (C) 2016, 
%%% @doc
%%%
%%% @end
%%% Created : 18 Oct 2016 by  <Vincent@VINCENT>
%%%-------------------------------------------------------------------
-module(shop2).

%% API
-export([total/1,total2/1]).
%% import funcs in other modules, then when we try to invoke the func, just type the func name
-import(mylists,[map/2,sum/1]).
-import(shop,[cost/1]).

%%%===================================================================
%%% API>
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% @spec
%% @end
%%--------------------------------------------------------------------

%%%===================================================================
%%% Internal functions
%%%===================================================================
total(L)->
    sum(map(fun({What,N})-> cost(What)*N end, L)).

%% this is an example of list comprehension
%% [doSomeThingWithVar || Var <- List]

total2(L)->
    sum([cost(What)*N||{What,N}<-L]).
