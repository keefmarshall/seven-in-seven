% Consider a list of keyword-value tuples, such as [{erlang, "a functional language"},
% {ruby, "an OO language"}]. Write a function that accepts the list and
% a keyword and returns the associated value for the keyword.

-module(day2p1).
-export([lookup/2, sampleList/0]).

sampleList() -> [{erlang, "a functional language"},{ruby, "an OO language"}].

lookup(List, Keyword) -> 
	[Value || {Key, Value} <- List, Key == Keyword].
