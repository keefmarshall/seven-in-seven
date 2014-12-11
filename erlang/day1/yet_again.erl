% Variables (immutable) start with capital letters
% semi-colon to continue a function definition with multiple matches
% every statement must end with a period.

-module(yet_again).
-export([fact/1]).
-export([fib/1]).

fact(0) -> 1;
fact(N) -> N * fact(N-1).


fib(0) -> 1;
fib(1) -> 1; 
fib(N) -> fib(N-2) + fib(N-1).
