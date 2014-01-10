% I thought I'd have my own go at the eight queens problem as the book
% works through it.. but I'm mostly copying from the book :(

% We can express each queen as (Row, Col), a tuple having a row and a column. 
% A Board is a list of tuples. eight_queens(Board) succeeds if we have a valid 
% board. Our query will look like this: eight_queens([(1, 1), (3, 2), ...]).
% • #1 A board has eight queens.
% • #2 Each queen has a row from 1–8 and a column from 1–8.
% • #3 No two queens can share the same row.
% • #4 No two queens can share the same column.
% • #5 No two queens can share the same diagonal (southwest to northeast).
% • #6 No two queens can share the same diagonal (northwest to southeast).

% Rule #1
eight_queens(Board) :- length(Board, 8).

% Rule #2
valid_queen((R,C)) :- 
	Range = [1, 2, 3, 4, 5, 6, 7, 8],
	member(R, Range), member(C, Range).

% sub rule - we need to tie the queens to the board
valid_board([]).
valid_board([Head|Tail]) :-
	valid_queen(Head),
	valid_board(Tail).

% Rule #3: we need to extract a list of all the row values and check it's
% unique:

rows([(R, _)|Tail]) :- 

% .. OK the rest is in the book, can't be bothered to copy/type it all,
% I'd rather have a go myself - see eightqueens2.pl.

