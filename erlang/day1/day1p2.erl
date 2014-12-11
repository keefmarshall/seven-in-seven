% 7in7 Day one: problem 2
-module(day1p2).
-export([count/1]).
-export([countTo/1]).

% Counts from the supplied number to 10. 
% N must be less than 11(!)
count(10) -> [10];
count(N) -> [N | count(N + 1)].

% Counts from 1 to the supplied number.
% N must be greater than 0!
countTo(N) -> countToIter(N, []).

countToIter(0, Tail) -> Tail;
countToIter(N, Tail) -> countToIter(N-1, [N | Tail]).

% Usage:
% count(1).
% countTo(10).
