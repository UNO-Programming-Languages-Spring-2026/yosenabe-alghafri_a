% yosenabe1.lp
% Q1: Move every number into a gray area along a straight line.

% A possible target for a number is an area cell in the same row or column.
possible(X,Y,XX,Y) :- number(X,Y,_), area(XX,Y,_), X != XX.
possible(X,Y,X,YY) :- number(X,Y,_), area(X,YY,_), Y != YY.

% Choose exactly one target per number.
1 { target(X,Y,XX,YY) : possible(X,Y,XX,YY) } 1 :- number(X,Y,_).

% The target must be the FIRST cell of its area along the direction of motion.
% Vertical down  (Y < YY)
:- target(X,Y,X,YY), Y  < YY, area(X,YY,A), area(X,Yp,A), Y  < Yp, Yp < YY.
% Vertical up    (Y > YY)
:- target(X,Y,X,YY), Y  > YY, area(X,YY,A), area(X,Yp,A), YY < Yp, Yp < Y.
% Horizontal right (X < XX)
:- target(X,Y,XX,Y), X  < XX, area(XX,Y,A), area(Xp,Y,A), X  < Xp, Xp < XX.
% Horizontal left  (X > XX)
:- target(X,Y,XX,Y), X  > XX, area(XX,Y,A), area(Xp,Y,A), XX < Xp, Xp < X.

#show target/4.
