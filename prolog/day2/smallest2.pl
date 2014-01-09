% Prolog day 2 problem 2 - second cut
% • Find the smallest element of a list.
% My first solution worked first time but when I ran a trace on it I saw it
% was horribly inefficient. So let's try again, but this time remember the
% current minimum as we go.

% we need a min predicate
kmin(X, Y) :- X =< Y.

% Single list entry is smallest if it beats current
ksml2([X], Current, Smallest) :- 
	kmin(X, Current),
	Smallest is X.
	
% Or, if it's bigger, smallest is current:
ksml2([X], Current, Smallest) :-
	kmin(Current, X),
	Smallest is Current.

% Now deal with bigger lists:
% Either Head is smaller than Current, in which case Head becomes current..
ksml2([Head|Tail], Current, Smallest) :-
	kmin(Head, Current),
	ksml2(Tail, Head, Smallest).

% Or vice versa, Current remains the smallest:
ksml2([Head|Tail], Current, Smallest) :-
	kmin(Current, Head),
	ksml2(Tail, Current, Smallest).

% kick it off:
ksml2([Head|Tail], S) :- ksml2([Head|Tail], Head, S).

% OK, this is definitely more efficient than my first attempt. It also worked
% first time!
