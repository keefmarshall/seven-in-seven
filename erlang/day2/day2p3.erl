% Write a program that reads a tic-tac-toe board presented as a list or a
% tuple of size nine. Return the winner (x or o) if a winner has been determined,
% cat if there are no more possible moves, or no_winner if no player
% has won yet.

-module(day2p3).
-on_load(run/0).
-define(BOARDSIZE, 3).
%-define(BOARDSIZE, 4).

testBoard() -> [x, o, x,
				o, x, o,
				x, x, o].

%testBoard() -> [x, o, x, x,
%				o, x, o, x,
%				x, x, x, o,
%				o, o, o, o].

rows(Board) ->
	Seq = lists:seq(0, ?BOARDSIZE - 1),
	[ [lists:nth(I + N, Board) || I <- Seq  ] || N <- lists:seq(1, ?BOARDSIZE * ?BOARDSIZE, ?BOARDSIZE) ].
	
cols(Board) ->
	Seq = lists:seq(1, ?BOARDSIZE),
	[ [lists:nth(I, Board) || I <- lists:seq(N, ?BOARDSIZE * ?BOARDSIZE, ?BOARDSIZE) ] || N <- Seq ].
	
diag1(Board) ->
	[ lists:nth(N, Board) || N <- lists:seq(1, ?BOARDSIZE * ?BOARDSIZE, ?BOARDSIZE + 1)].

diag2(Board) ->
	[ lists:nth(N, Board) || N <- lists:seq(?BOARDSIZE, (?BOARDSIZE * ?BOARDSIZE) - 1, ?BOARDSIZE - 1)].

allLines(Board) ->
	[ diag1(Board) | [ diag2(Board) | rows(Board) ++ cols(Board) ]].
	
checkLineForWinner(Line) ->
	lists:all( fun(X) -> X == lists:nth(1, Line) end, Line).

checkAllLinesForWinner(Board) -> lists:any(fun checkLineForWinner/1, allLines(Board)).


print(Thing) -> 
	io:write(Thing),
	io:fwrite("\n").

run() -> 
	print(testBoard()),
	print(rows(testBoard())),
	print(cols(testBoard())),
	print(diag1(testBoard())),
	print(diag2(testBoard())),
	print(allLines(testBoard())),
	print(checkLineForWinner([x,x,o])),
	print(checkLineForWinner([x,x,x])),
	print(checkAllLinesForWinner(testBoard())).
	