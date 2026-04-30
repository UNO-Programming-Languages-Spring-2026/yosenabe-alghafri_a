% yosenabe1.lp
% Q1: Move every number into a gray area along a straight line. [cite: 39]

% 1. A number can target any area cell in the same row or column. [cite: 40]
% Removed the "X != XX" and "Y != YY" to allow numbers already in areas to stay put.
possible(X,Y,XX,Y) :- number(X,Y,_), area(XX,Y,_).
possible(X,Y,X,YY) :- number(X,Y,_), area(X,YY,_).

% 2. Choose exactly one target per number. [cite: 42]
1 { target(X,Y,XX,YY) : possible(X,Y,XX,YY) } 1 :- number(X,Y,_).

% 3. NEW: A number cannot jump over another gray area cell to reach its target.
:- target(X,Y,XX,Y), area(MidX,Y,_), MidX > X, MidX < XX.
:- target(X,Y,XX,Y), area(MidX,Y,_), MidX < X, MidX > XX.
:- target(X,Y,X,YY), area(X,MidY,_), MidY > Y, MidY < YY.
:- target(X,Y,X,YY), area(X,MidY,_), MidY < Y, MY > YY.

% 4. NEW: No two numbers can land on the exact same cell (coordinate).
:- target(X1,Y1,XX,YY), target(X2,Y2,XX,YY), (X1,Y1) != (X2,Y2).

#show target/4. [cite: 42]
