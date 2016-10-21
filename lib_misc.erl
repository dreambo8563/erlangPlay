-module(lib_misc).
-export([for/3,qsort/1,pythag/1,perms/1,listGuade/1,odds_and_evens/1,odds_and_evens_acc/1,sleep/1,flush_buffer/0,test_flush/0,priority_receive/0,test_priority/0]).

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

%% sleep T time and return.
sleep(T)->
    receive
        %% if in T times sleep didn't get any message matched, just return true
    after T->true
    end.

%% immedidatly excute "clear mailbox"
%% if we comment the after clause, this func will endless waiting for message when the mailbox empty.
%% if mailbox is not empty, this func will deal with each one until empty. that's why we call this flush buffer.
flush_buffer()->
    io:format("test start"),
    receive
        _ -> io:format("will flush buffer"), flush_buffer()
    after 0 -> true
    end.
test_flush()->
    Pid = spawn(fun flush_buffer/0),
    Pid!{test},
    Pid.

%% after create the process in 0 seconds, if no message matched, then output not matched any value itself  &  end the process.
%% if one message matched just after create the process, then output matched.
priority_receive()->
    receive
        {alarm,X}->
            io:format("matched ~p",[X])
    after 0 ->
            receive
                Any ->
                    io:format("not matched"),
                    Any
            end
    end.

test_priority()->
    Pid = spawn(fun priority_receive/0),
    Pid! {alarm,testgooo},    
    Pid! {alarmnonon},
    Pid.
