% Trying to see if I can execute the eight_queens thing and print
% out a solution without typing anything into the interpreter
%
% You can run it like this:
%
%    gprolog --consult-file execute_queens.pl 

:-include('eightqueens2.pl').

printSolution([], _).
printSolution([Head|Tail], N) :-
	write(N), write(' '), write(Head), nl,
	NewN is N + 1,
	printSolution(Tail, NewN).
printSolution(Set) :- printSolution(Set, 1).

printSet :- setof(What, eight_queens4(What), Set), printSolution(Set), nl.

:-initialization(printSet).
:-initialization(halt).
