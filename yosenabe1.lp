% yosenabe1.lp
% Q1: Move every number into a gray area along a straight line.

% A number can target any area cell in the same row or column.
possible(X,Y,XX,Y) :- number(X,Y,_), area(XX,Y,_), X != XX.
possible(X,Y,X,YY) :- number(X,Y,_), area(X,YY,_), Y != YY.

% Choose exactly one target per number.
1 { target(X,Y,XX,YY) : possible(X,Y,XX,YY) } 1 :- number(X,Y,_).

#show target/4.
