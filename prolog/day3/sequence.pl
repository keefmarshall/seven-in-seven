% generate an array containing a sequence of numbers 1..N
%
% 	sequence(-Array, +N)

sequence([N], N, N).
sequence([Start|Tail], Start, End) :-
	Next is Start + 1,
	array(Tail, Next, End).

sequence(Array, N) :- array(Array, 1, N).
