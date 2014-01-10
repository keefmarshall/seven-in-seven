% I'm going to try with four queens instead of 8 - there is a valid
% solution and it makes debugging and tracing a hell of a lot easier
% - actually two valid solutions: 
%    [(1,2),(2,4),(3,1),(4,3)] and [(1,3),(2,1),(3,4),(4,2)]

valid_columns(Cols) :- 
	length(Cols, 4),
	permutation(Cols, [1,2,3,4]),
	fd_all_different(Cols).

% Great! Now we have to deal with diagonals, which is trickier.
% From the book we know we can represent each diagonal by col+row one way
% and col-row the other way.
% First arg here is the Board, second is a parameter for the Diagonals array
diags1([], []).
diags1([(Row, Col)|Tail], [Dhead|Dtail]) :-
	Dhead is Col + Row,
	diags1(Tail, Dtail).

% and the other direction:
diags2([], []).
diags2([(Row, Col)|Tail], [Dhead|Dtail]) :-
	Dhead is Col - Row,
	diags2(Tail, Dtail).

% Try again...
four_queens(Board) :- 
	Board = [(1, C1), (2, C2), (3, C3), (4, C4)],
	
	Columns = [C1, C2, C3, C4],
	valid_columns(Columns),
	
	diags1(Board, Diags1),
	diags2(Board, Diags2),
	
	fd_all_different(Diags1),
	fd_all_different(Diags2).
	
