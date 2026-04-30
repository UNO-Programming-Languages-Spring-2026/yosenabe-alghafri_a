% yosenabe1.lp
% Q1: Move every number into a gray area along a straight line.

% 1. Allow targeting any area cell in the same row/column (including the current cell)
possible(X,Y,XX,Y) :- number(X,Y,_), area(XX,Y,_).
possible(X,Y,X,YY) :- number(X,Y,_), area(X,YY,_).

% 2. Choose exactly one target per number.
1 { target(X,Y,XX,YY) : possible(X,Y,XX,YY) } 1 :- number(X,Y,_).

% 3. NEW: Integrity constraint to prevent jumping over other area cells
:- target(X,Y,XX,Y), area(MidX,Y,_), MidX > X, MidX < XX.
:- target(X,Y,XX,Y), area(MidX,Y,_), MidX < X, MidX > XX.
:- target(X,Y,X,YY), area(X,MidY,_), MidY > Y, MidY < YY.
:- target(X,Y,X,YY), area(X,MidY,_), MidY < Y, MidY > YY.

#show target/4.
