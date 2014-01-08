% Prolog day 1 problems 3&4
%
% Make a knowledge base representing musicians and instruments. 
% Also represent musicians and their genre of music.
% Find all musicians who play the guitar.
%
% OK, this is just more data entry and is much the same as the books.pl
% task. So, to make this more interesting, I downloaded some last.fm 
% artist/genre data from here:
%
%   http://musicmachinery.com/2010/11/10/lastfm-artisttags2007/
%
% and wrote an Io script (artist_tags.io) to transform it into Prolog data 
% which you'll find in artist_tags.pl.
%
% You need to expand the heap size for Prolog to load this data in:
% export GLOBALSZ=256000
% export TRAILSZ=32768
%
% The artist_tags.pl file is available under Creative Commons by-nc-sa as per
% the source data.

% These are just some silly rules for me to play with:

progjazz(X) :- genre(X, 'Progressive rock'), genre(X, 'jazz').
jazzpop(X) :- genre(X, 'jazz'), genre(X, 'pop').
popmetal(X) :- genre(X, 'pop'), genre(X, 'metal').


% I have to admit, the crowd-sourced tags from last.fm are pretty useless!
% don't expect any seriously useful results from any of these!
