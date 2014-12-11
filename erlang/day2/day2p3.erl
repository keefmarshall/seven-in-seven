% Write a program that reads a tic-tac-toe board presented as a list or a
% tuple of size nine. Return the winner (x or o) if a winner has been determined,
% cat if there are no more possible moves, or no_winner if no player
% has won yet.

-module(day2p3).
-on_load(run/0).

board() -> [x, o, x,
			o, x, o,
			x, x, o].

run() -> 
	io:write(board()),
	io:fwrite("\n").
	