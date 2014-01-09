% Prolog day two: problem 3
% • Sort the elements of a list.

% Let's try a naive solution first, with numbers only.

% We'll re-use the ksml3 routine from problem 3
:- include('smallest3').

sorted([], Sorted, Sorted).

sorted(List, Tracker, Sorted) :-
	ksml3(List, Smallest),
	append(Tracker, [Smallest], NewTracker),
	select(Smallest, List, NewList), % removes one instance of "Smallest" from List to create NewList
	sorted(NewList, NewTracker, Sorted).

sorted(List, Sorted) :- sorted(List, [], Sorted).

% This works fine, but is pretty poorly optimised - it essentially runs through
% the whole list to pick out the smallest. It extracts that from the list, then
% runs through the remaining list to find the smallest, etc.. dreadfully
% inefficient.
