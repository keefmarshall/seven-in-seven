% Write a program that reads a tic-tac-toe board presented as a list or a
% tuple of size nine. Return the winner (x or o) if a winner has been determined,
% cat if there are no more possible moves, or no_winner if no player
% has won yet.

%
% Notes: you can define macros with -define(MACRO, DEFINITION)
% - reference macros in code with a question mark e.g. ?MACRO
% [can also do function-like macros, just like C - see docs for syntax]
%
% To pass an internal function as an argument to a higher-order function
% (e.g. lists:foreach) - you must reference it as "fun thing/1" or whatever
%
% You can concatenate lists with the ++ operator, presumably Scala stole that.
%
% lists:seq(a, b) generates a list of numbers from a to b.
%
% You *cannot* use function calls in a "guard" statement - i.e. in an "if" clause
% - which is really annoying, as you can't do: if thing() -> otherThing()
%

-module(day2p3).
-on_load(run/0).
-define(BLANK, blank).
-define(BOARDSIZE, 3).
-export([checkBoardState/1]).
%-define(BOARDSIZE, 4).

% x wins
testBoard() -> [x, o, x,
				o, x, o,
				x, x, o].

%o wins
testBoard2() -> [x, o, o,
				o, x, o,
				x, x, o].

% no_winner				
testBoard3() -> [x, o, x,
				o, ?BLANK, o,
				x, x, o].

% no_winner	- has mostly blanks	
testBoard4() -> [?BLANK, o, x,
				?BLANK, ?BLANK, ?BLANK,
				x, ?BLANK, ?BLANK].

% cat				
testBoard5() -> [x, o, x,
				o, x, o,
				o, x, o].

%testBoard() -> [x, o, x, x,
%				o, x, o, x,
%				x, x, x, o,
%				o, o, o, o].

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

%checkAllLinesForWinner(Board) -> lists:any(fun checkLineForWinner/1, allLines(Board)).

% returns "x" if x wins, "o" if o wins, "no_winner" if there's a blank or
% "cat" is the line is full but mixed.
checkLine(Line) ->
	case checkLineForWinner(Line) of
		true -> 
			case lists:nth(1, Line) of
				?BLANK -> no_winner;
				X -> X
			end;
		false -> 
			case lists:member(?BLANK, Line) of
				true -> no_winner;
				false -> cat
			end
	end.
	

checkBoardState(Board) -> 
	Result = lists:map(fun checkLine/1, allLines(Board)),
	HasWinner = lists:member(x, Result) or lists:member(o, Result),
	case HasWinner of
		true -> 
			case lists:member(x, Result) of
				true -> x;
				false -> o
			end;
		false ->
			case lists:member(no_winner, Result) of
				true -> no_winner;
				false -> cat
			end
	end.
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

print(Thing) -> 
	io:write(Thing),
	io:fwrite("\n").

run() -> 
%	print(testBoard()),
%	print(rows(testBoard())),
%	print(cols(testBoard())),
%	print(diag1(testBoard())),
%	print(diag2(testBoard())),
%	print(allLines(testBoard())),
%	print(checkLineForWinner([x,x,x])),
%	print(checkBoardState(testBoard())),
%	print(checkBoardState(testBoard2())),
%	print(checkAllLinesForWinner(testBoard())).
	print(checkBoardState(testBoard())),
	print(checkBoardState(testBoard2())),
	print(checkBoardState(testBoard3())),
	print(checkBoardState(testBoard4())),
	print(checkBoardState(testBoard5())).
	