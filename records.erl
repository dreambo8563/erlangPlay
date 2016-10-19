
-module(records).
-export([todo/0,printStatus/1]).
-record(todo,{status=reminder,who=joe,text}).

todo()->
    #todo{status=done}.
printStatus(#todo{status=S,who=_,text=_})->
    S.
