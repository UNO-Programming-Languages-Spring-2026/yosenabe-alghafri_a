% yosenabe1.lp

% 1. Define possible targets in the same row/column [cite: 3]
possible(X,Y,XX,Y) :- number(X,Y,_), area(XX,Y,A), X != XX.
possible(X,Y,X,YY) :- number(X,Y,_), area(X,YY,A), Y != YY.

% 2. Constraint: No other gray area can be between the number and its target
:- target(X,Y,XX,Y), area(MidX,Y,_), MidX > X, MidX < XX.
:- target(X,Y,XX,Y), area(MidX,Y,_), MidX < X, MidX > XX.
:- target(X,Y,X,YY), area(X,MidY,_), MidY > Y, MidY < YY.
:- target(X,Y,X,YY), area(X,MidY,_), MidY < Y, MidY > YY.

% 3. Each number must choose exactly one valid target [cite: 4]
1 { target(X,Y,XX,YY) : possible(X,Y,XX,YY) } 1 :- number(X,Y,_).

#show target/4.
