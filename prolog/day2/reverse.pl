% 7-in-7 Prolog day 2: reverse the elements of a list

% The reverse of a single entry list is the same list
%reverse([N], [N]).

% We're going to need Head|Tail syntax here. 
% RT is the reverse of the Tail
%reverse([Head|Tail], [RT|Head]) :- reverse(RT, Tail).

% That was easy! Oh, 'reverse' must be a keyword..? Damn. Try again.

% This time use krev:

%krev([Head|[]], [Head]).
%krev([Head|Tail], [RT|[Head]]) :- krev(Tail, RT).

% Above doesn't work because RT is always, itself, a list. So we end up
% prepending a list to the head, which isn't what we want. We want all
% the entries in the list to be prepended instead.

% Let's try using the 'append' function instead.
krev([Head|[]], [Head]).
krev([Head|Tail], Rev) :- 
	krev(Tail, RT),
	append(RT, [Head], Rev).

% Whoo hoo! that works.
