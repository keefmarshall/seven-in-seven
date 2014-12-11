% pattern matching

% Write a function that uses matching to selectively print “success” or
% “error: message” given input of the form {error, Message} or success.

-module(day1p3).
-export([errp/1]).
-export([errp/2]).

errp(success) -> io:fwrite("success\n").

errp(error, Message) -> 
	io:fwrite("error: "),
	io:fwrite(Message),
	io:fwrite("\n").


