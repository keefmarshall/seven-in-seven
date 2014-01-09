% Prolog day 2 problem 2
% • Find the smallest element of a list.

ksmallest([X], X).

% The first in the list is the smallest if it's smaller than anything
% in the tail.
ksmallest([Head|Tail], S) :-
	 S is Head,
	 ksmallest(Tail, T),
	 S =< T.

% Otherwise, if the Head is not the smallest, we want the smallest in the Tail
ksmallest([Head|Tail], S) :-
	ksmallest(Tail, S),
	S =< Head.

% Oh yes, worked first time! Horribly inefficient though.
