
-module(records).
-export([todo/0]).
-record(todo,{status=reminder,who=joe,text}).

todo()->
    #todo{status=done}.
