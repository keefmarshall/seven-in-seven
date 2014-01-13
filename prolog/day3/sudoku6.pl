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
	

% To make this more generic and more easily scaled to 9, I need to figure
% out how to generate the column arrays from the rows.
% I found the GNU-prolog 'nth()' clause, which might be of use here.
% I've also found a transpose() function online which will do the job for me!

:-include('transpose').

sudoku6(Puzzle, Solution) :-
	length(Puzzle, N),
        Solution = Puzzle,
        Puzzle = [
	        	[S11, S12, S13, S14, S15, S16],
	        	[S21, S22, S23, S24, S25, S26],
	        	[S31, S32, S33, S34, S35, S36],
	        	[S41, S42, S43, S44, S45, S46],
	        	[S51, S52, S53, S54, S55, S56],
	        	[S61, S62, S63, S64, S65, S66]
       	],
        
        transpose(Puzzle, Columns),
        
        Squares = [
        		[S11, S12, S13, S21, S22, S23],
        		[S14, S15, S16, S24, S25, S26],
        		[S31, S32, S33, S41, S42, S43],
        		[S34, S35, S36, S44, S45, S46], 
        		[S51, S52, S53, S61, S62, S63],
        		[S54, S55, S56, S64, S65, S66]
        	],
        
        valid(Puzzle, N),
        valid(Columns, N),
	valid(Squares, N).
        
% example:
% sudoku6([[1,2,_,_,_,_], [6,_,_,_,_,2], [_,_,_,6,_,_],  [_,_,4,_,_,1], [_,_,_,2,_,3], [_,5,_,_,6,_]], What).
% solution is:
% What = [[1,2,5,4,3,6],[6,4,3,5,1,2],[2,3,1,6,4,5],[5,6,4,3,2,1],[4,1,6,2,5,3],[3,5,2,1,6,4]]
