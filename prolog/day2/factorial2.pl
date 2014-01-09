% Second factorial implementation from 
% http://www.csupomona.edu/~jrfisher/www/prolog_tutorial/2_2.html
% This one uses a holding variable, enabling proper tail recursion -
% I think it should be more memory efficient.

factorial2(0,F,F). 

factorial2(N,A,F) :-  
        N > 0, 
        A1 is N*A, 
        N1 is N -1, 
        factorial2(N1,A1,F). 

% For this version, use the following type of a goal:
%
%    ?- factorial2(5,1,F). 
