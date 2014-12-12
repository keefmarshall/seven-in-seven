% Write a program that reads a tic-tac-toe board presented as a list or a
% tuple of size nine. Return the winner (x or o) if a winner has been determined,
% cat if there are no more possible moves, or no_winner if no player
% has won yet.

-module(day2p3).
-on_load(run/0).
-define(BOARDSIZE, 3).

testBoard() -> [x, o, x,
				o, x, o,
				x, x, o].

% Perhaps if I get better at foldLeft I can avoid writing all
% these tail-recursive accumulation functions. Not sure.
% This is currently quite insane, in my opinion. And I wrote it.
rowFinder(PartialBoard, Acc) -> 
	case PartialBoard of
		[] -> Acc;
		[X | Remainder] ->
			case Acc of
				[] -> rowFinder(Remainder, [[X]]);
				[CurRow | Tail] ->
					if 
						length(CurRow) >= ?BOARDSIZE -> 
							rowFinder(Remainder, [ [X] | Acc ]);
						length(CurRow) < ?BOARDSIZE -> 
							rowFinder(Remainder, [ [X | CurRow] | Tail ])
					end
			end
	end.

rowFinder2(Board) ->
	Seq = lists:seq(0, ?BOARDSIZE - 1),
	[ [lists:nth(I + N, Board) || I <- Seq  ] || N <- lists:seq(1, ?BOARDSIZE * ?BOARDSIZE, ?BOARDSIZE) ].
	
colFinder(Board) ->
	Seq = lists:seq(1, ?BOARDSIZE),
	[ [lists:nth(I, Board) || I <- lists:seq(N, ?BOARDSIZE * ?BOARDSIZE, ?BOARDSIZE) ] || N <- Seq ].
	
% rowFinder currently returns everything reversed. so, reversing the input
% Board gives us everything back in the right order.
rows(Board) -> rowFinder(lists:reverse(Board), []).

% This converts the board to be in column order, then uses the rows() function to
% extract columns. Its quite insane.
cols(Board) -> 
	Rows = rows(Board),
	rows([ lists:nth(N, Row) || N <- lists:seq(1, ?BOARDSIZE), Row <- Rows ]).

diag1(Board) ->
	[ lists:nth(N, Board) || N <- lists:seq(1, ?BOARDSIZE * ?BOARDSIZE, ?BOARDSIZE + 1)].

diag2(Board) ->
	[ lists:nth(N, Board) || N <- lists:seq(?BOARDSIZE, (?BOARDSIZE * ?BOARDSIZE) - 1, ?BOARDSIZE - 1)].

run() -> 
	io:write(testBoard()),
	io:fwrite("\n"),
	io:write(rowFinder2(testBoard())),
	io:fwrite("\n"),
	io:write(colFinder(testBoard())),
	io:fwrite("\n"),
	io:write(diag1(testBoard())),
	io:fwrite("\n"),
	io:write(diag2(testBoard())),
	io:fwrite("\n").
	