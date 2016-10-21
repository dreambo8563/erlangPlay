%%%-------------------------------------------------------------------
%%% @author  <Vincent@VINCENT>
%%% @copyright (C) 2016, 
%%% @doc
%%%
%%% @end
%%% Created : 21 Oct 2016 by  <Vincent@VINCENT>
%%%-------------------------------------------------------------------
-module(area_server1).

%% API
-export([loop/0,rpc/2,start/0]).

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

%% the client send the request
rpc(Pid, Request)->
    %% send message to server
    Pid ! {self(),Request},
    receive
        %% receive the response from server, pattern match the Pid which is exactly what you wait 
        {Pid, Response} ->
            io:format("output response"),
            Response
    end.


loop()->
    receive
        %% pattern match the message from client
        {From,{rectangle,Width,Ht}} ->
            io:format("receive rectangle message,will response now ~n"),
            %% send the response  back to client
            From ! {self(),Width * Ht},
            loop();
        {From,{circle,R}}->
            io:format("receive circle message, will response now ~n"),
            From ! {self(),3.14159 *R *R},
            loop();
        {From,Other}->
            io:format("receive Other message, will response now ~n"),
            From ! {self(
                     ),{error,Other}},
            loop()
    end.

%% create a process and return the Pid
start()->
    spawn(fun loop/0).
