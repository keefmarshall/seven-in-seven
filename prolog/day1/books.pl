% Prolog Day One, problems 1, 2:
%
% Make a simple knowledge base. 
% Represent some of your favorite books and authors.
% Find all books in your knowledge base written by one author.

% Straight away I'm wishing for a Prolog->NoSQL interface of some kind so
% I can more easily import relationship data!

wrote('Iain M. Banks', 'Consider Phlebas').
wrote('Iain M. Banks', 'Use of Weapons').
wrote('Iain M. Banks', 'Player of Games').
wrote('J.R.R. Tolkien', 'The Hobbit').
wrote('J.R.R. Tolkien', 'The Lord of the Rings').
wrote('Stieg Larsson', 'The Girl With The Dragon Tattoo').
wrote('Stieg Larsson', 'The Girl Who Played With Fire').
wrote('Stieg Larsson', 'The Girl Who Kicked The Hornet\'s Nest').

% Sample queries - run these within the interactive prolog shell:
%
% to load this data file
% ['books'].
%
% To find all books by Iain M. Banks:
% wrote('Iain M. Banks', What).
%
% To find who wrote The Hobbit:
% wrote(What, 'The Hobbit').
