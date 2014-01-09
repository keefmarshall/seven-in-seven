% Keith's attempt at a fibonacci sequence generator in Prolog

% first we need a rule for zero
fibk(0, 0).

% we definitely need one for 1 to get us started
fibk(1, 1).

% So how do we define the value V for Fibonacci sequence number N?
fibk(N, V) :-
	N > 1, % apply for numbers greater than 1
	N1 is N - 1, % we need the last two numbers in the sequence
	N2 is N - 2, % we need the last two numbers in the sequence
	fibk(N1, V1),
	fibk(N2, V2),
	V is V1 + V2. % sum of the last two numbers
	