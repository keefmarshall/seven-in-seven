% Last attempt at this - is there a built-in 'min' function?
% I find the documentation really hard to work out, easier just to try

% If we get to the bottom, we're done:
ksml3([], Smallest, Smallest).

ksml3([Head|Tail], Current, Smallest) :-
	Newcurrent is min(Head, Current),
	ksml3(Tail, Newcurrent, Smallest).

% kick it off:
ksml3([Head|Tail], S) :- ksml3([Head|Tail], Head, S).

% So there is a min() function - much easier! See documentation here:
% http://www.gprolog.org/manual/gprolog.html#sec96
