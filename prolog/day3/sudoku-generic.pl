% Prolog day three problem 1(A) - make the 4x4 Sudoku solver work
% for 6x6 (3x2 rectangles).
%
% Naive solution here - just copy-paste and add more stuff (tedious!!)
%
% Gradually trying to make it shorter


valid([], _).
valid([Head|Tail], N) :- 
	fd_domain(Head, 1, N),
    	fd_all_different(Head), 
    	valid(Tail, N).

valid_board([], _).
valid_board([Head|Tail], N) :-
	length(Head, N),
	valid_board(Tail, N).

% OK, we need logic as to find the bounding box for a "square" - it's not
% so hard for 4x4, 9x9, 16x16 but making it also work for 6x6 is harder.
% For now, let's just do square numbers, we can easily test with 4x4
% 4x4: 1 is (1,1->2,2), 2 is (3,1->4,2), 3 is (1,3->2,4), 4 is (3,3->4,4)
% 9x9: 1 is (1,1->3,3), 2 is (4,1 -> 6,3), 3 is (7,1->9,3), 4 is (1,4->3,6)...
% ... and so on. Need a formula to generate these given only the size of the
% board (length of one side e.g. '4' or '9').


square(_, _, []).
square(Board, SquareNum, [SquareHead|SquareTail]) :-
	length(Board, Size),
	Width is round(sqrt(Size)),
	
	length(SquareTail, TailSize),
	SquarePos is Size - TailSize,
	
	% Calculate position of top corner of square:
	LeftX is (((SquareNum - 1) * Width) + 1) mod Size,
	TopY is (floor((SquareNum - 1) / Width) * Width) + 1,
	
	% Now relative position of SquarePos
	Xpos is LeftX + ((SquarePos - 1) mod Width),
	Ypos is TopY + floor((SquarePos - 1) / Width),
	
	% Find the value - get row from board, move along it xpos
	nth(Ypos, Board, Row),
	nth(Xpos, Row, SquareHead),
	
	% move to next value:
	square(Board, SquareNum, SquareTail).


squares(_, _, []).
squares(Board, N, [Head|Tail]) :-
	length(Board, Size),
	length(Head, Size),
	square(Board, N, Head),
	Next is N + 1,
	squares(Board, Next, Tail).

squares(Board, Squares) :-
	length(Board, Size),
	length(Squares, Size),
	squares(Board, 1, Squares).
	
	
% To make this more generic and more easily scaled to 9, I need to figure
% out how to generate the column arrays from the rows.
% I found the GNU-prolog 'nth()' clause, which might be of use here.
% I've also found a transpose() function online which will do the job for me!

:-include('transpose').

sudoku(Puzzle, Solution) :-
	length(Puzzle, N),
        Solution = Puzzle,
	valid_board(Puzzle, N),
        
        transpose(Puzzle, Columns),
        
        squares(Puzzle, Squares),

        valid(Puzzle, N),
        valid(Columns, N),
       	valid(Squares, N).
        
% example:
% example, size 4: 
%  sudoku([[1,2,_,_], [_,_,_,_], [_,3,_,4], [_,_,_,_]], What).
%  What = [[1,2,4,3],[3,4,2,1],[2,3,1,4],[4,1,3,2]]
%
% example, size 9:
%  sudoku([[1,2,_,_,_,_,_,_,8], [6,_,_,_,_,2,_,_,_], [_,_,_,6,_,_,_,_,_],  [_,_,4,_,_,1,_,_,_], [_,_,_,2,_,3,_,_,_], [_,5,_,_,6,_,_,_,_], [_,_,_,_,_,_,_,_,_], [_,_,_,_,_,_,_,_,_], [_,_,_,_,_,_,5,_,_]], What).
