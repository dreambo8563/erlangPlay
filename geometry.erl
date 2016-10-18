-module(geometry).
%% add the module, then other module can invoke the func
-export([area/1]).
%% export the func others can use

%% func define in this module
area({rectangle,Width,Ht}) -> Width*Ht;
area({circle,R})           ->3.14159*R*R;
area({square,X})           ->X*X.

