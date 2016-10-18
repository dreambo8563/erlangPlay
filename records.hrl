%%%-------------------------------------------------------------------
%%% @author  <Vincent@VINCENT>
%%% @copyright (C) 2016, 
%%% @doc
%%%
%%% @end
%%% Created : 18 Oct 2016 by  <Vincent@VINCENT>
%%%-------------------------------------------------------------------
-module(records).
-record(todo,{status=reminder,who=joe,text}).
-export([todo/0])

todo()->
    #todo{status=done}.

