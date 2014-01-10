% OK this is my own solution to the eight queens problem - I really don't
% like the rows() thing in the book's solution, it's fiddly and horrible.
% Unfortunately I suppose it makes the code more generic and scaleable - it's
% much easier to change it to more rows/columns.

% First, let's ignore diagonals:

eight_queens2(Board) :- 
	Board = [(1, C1), (2, C2), (3, C3), (4, C4),
		 (5, C5), (6, C6), (7, C7), (8, C8)],
	Columns = [C1, C2, C3, C4, C5, C6, C7, C8],
	fd_domain(Columns, 1, 8),
	fd_all_different(Columns).

% OK, so the above code just gives me "1..8" for each column when I run it.
% Cannot understand why - surely they're not different at that stage, and I
% specifically said all Columns must be different?

% Let's try a simpler test:

columns(Cols, Length) :- 
	length(Cols, Length),
	fd_all_different(Cols),
	fd_domain(Cols, 1, Length).

% does the same.. I guess it's not 'grounded' but it's really hard to find
% documentation on what makes something 'grounded' or not. Perhaps I need to
% read up on basic logic.

% OK, let's try again without the fd_domain thing:

valid_columns(Cols) :- 
	length(Cols, 8),
	permutation(Cols, [1,2,3,4,5,6,7,8]),
	fd_all_different(Cols).

% Right, lets try again with the queens:

eight_queens3(Board) :- 
	Board = [(1, C1), (2, C2), (3, C3), (4, C4),
		 (5, C5), (6, C6), (7, C7), (8, C8)],
	Columns = [C1, C2, C3, C4, C5, C6, C7, C8],
	valid_columns(Columns).

% Great! that works, but now we have to deal with diagonals, which is trickier.
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
eight_queens4(Board) :- 
	Board = [(1, C1), (2, C2), (3, C3), (4, C4),
		 (5, C5), (6, C6), (7, C7), (8, C8)],
	
	Columns = [C1, C2, C3, C4, C5, C6, C7, C8],
	valid_columns(Columns),
	
	diags1(Board, Diags1),
	diags2(Board, Diags2),
	
	fd_all_different(Diags1),
	fd_all_different(Diags2).
	
% Finally! 'eight_queens4(What).' works!!
% Pretty quick too, on my macbook pro.

% One last go, this time see if the fd_domain thing is able to work
% now we've got the diagonal constraints in place:

eight_queens5(Board) :- 
	Board = [(1, C1), (2, C2), (3, C3), (4, C4),
		 (5, C5), (6, C6), (7, C7), (8, C8)],
	
	Columns = [C1, C2, C3, C4, C5, C6, C7, C8],
	fd_domain(Columns, 1, 8),
	
	diags1(Board, Diags1),
	diags2(Board, Diags2),
	
	fd_all_different(Columns),
	fd_all_different(Diags1),
	fd_all_different(Diags2).

% Nope, still fails - eight_queens4() is the way to go. I guess that gives
% concrete ('grounded'?) possible values for "Columns".

% NOTE: My eight_queens4() method finds all solutions in 3.3 seconds.
% The optimized one from the book takes 52 seconds. I win :)
%
% FURTHER NOTE: switched to using "permutation" - now takes <150ms !!!

