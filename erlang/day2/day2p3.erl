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

% rowFinder currently returns everything reversed. so, reversing the input
% Board gives us everything back in the right order.
rows(Board) -> rowFinder(lists:reverse(Board), []).
			
run() -> 
	io:write(testBoard()),
	io:fwrite("\n"),
	io:write(rows(testBoard())),
	io:fwrite("\n").
	