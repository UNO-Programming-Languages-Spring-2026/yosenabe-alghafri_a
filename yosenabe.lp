% yosenabe1.lp
% Q1: Move every number into a gray area along a straight line.

% 1. Define possible targets (allowing staying put if already in an area)
possible(X,Y,XX,Y) :- number(X,Y,_), area(XX,Y,_).
possible(X,Y,X,YY) :- number(X,Y,_), area(X,YY,_).

% 2. Choice: Move every number to exactly one target cell 
1 { target(X,Y,XX,YY) : possible(X,Y,XX,YY) } 1 :- number(X,Y,_).

% 3. Constraint: Path must not pass through another area cell (No jumping)
:- target(X,Y,XX,Y), area(MidX,Y,_), MidX > X, MidX < XX.
:- target(X,Y,XX,Y), area(MidX,Y,_), MidX < X, MidX > XX.
:- target(X,Y,X,YY), area(X,MidY,_), MidY > Y, MidY < YY.
:- target(X,Y,X,YY), area(X,MidY,_), MidY < Y, MidY > YY.

% 4. Constraint: No two numbers can land on the same coordinate
:- target(X1,Y1,XX,YY), target(X2,Y2,XX,YY), (X1,Y1) != (X2,Y2).

#show target/4.
