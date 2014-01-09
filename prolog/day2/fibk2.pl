% Keith's attempt at a fibonacci sequence generator in Prolog
% - attempting to use tail recursion this time

% So how do we define the value V for Fibonacci sequence number N?

% the previous tail recursion steps used an extra variable to store progress
% - not sure what that should store for Fibonacci. I guess we need the last two
% numbers.. but how to kick off the sequence?

% I only solved this by looking at the solution here:
% http://en.literateprograms.org/Fibonacci_numbers_%28Prolog%29
% Hopefully I'll get better at this as I go..
%
% When we reach a depth of zero, we should have found our number.

fibk2(0, V, _, V).

% For any given depth, we need to know the last two numbers
% Here 'N' is the depth, it goes in reverse
% P1 and P2 are the previous two numbers
% V is the value we're looking for
% We keep recursing until N reaches 0, at this point P2 is our value!
fibk2(N, P1, P2, V) :- 
	N > 0,
	N1 is N - 1,
	Next is P1 + P2,
	fibk2(N1, P2, Next, V).

% this is just a nice shorthand so we don't have to construct our initial
% query with four parameters. They could have done this with factorial2.
% We always start the Fibonacci series with 0 and 1.
fibk2(N, V) :- fibk2(N, 0, 1, V).
