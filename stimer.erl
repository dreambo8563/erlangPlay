%%%-------------------------------------------------------------------
%%% @author  <Vincent@VINCENT>
%%% @copyright (C) 2016, 
%%% @doc
%%%
%%% @end
%%% Created : 21 Oct 2016 by  <Vincent@VINCENT>
%%%-------------------------------------------------------------------
-module(stimer).

%% API
-export([start/2,cancel/1]).

%%%===================================================================
%%% API
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% @spec
%% @end
%%--------------------------------------------------------------------

%%%===================================================================
%%% Internal functions
%%%===================================================================


%% create the process and return the Pid
start(Time, Fun)->
    spawn(fun()-> timer(Time, Fun) end).

%% send the cancel message 
cancel(Pid)->
    Pid ! cancel.



%% in Time, if receive the cancel message just end the process, if not cancel then execute the fun.
timer(Time, Fun)->
    receive
        cancel ->
            io:format("canceled this process"),  
        void
    after Time ->
            Fun()
    end.
