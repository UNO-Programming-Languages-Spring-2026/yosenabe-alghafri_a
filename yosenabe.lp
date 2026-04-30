% yosenabe1.lp
% Q1: Move every number into a gray area along a straight line.

possible(X,Y,XX,Y) :- number(X,Y,_), area(XX,Y,_), X != XX.
possible(X,Y,X,YY) :- number(X,Y,_), area(X,YY,_), Y != YY.

1 { target(X,Y,XX,YY) : possible(X,Y,XX,YY) } 1 :- number(X,Y,_).

:- target(X,Y,X,YY), Y  < YY, area(X,YY,A), area(X,Yp,A), Y  < Yp, Yp < YY.
:- target(X,Y,X,YY), Y  > YY, area(X,YY,A), area(X,Yp,A), YY < Yp, Yp < Y.
:- target(X,Y,XX,Y), X  < XX, area(XX,Y,A), area(Xp,Y,A), X  < Xp, Xp < XX.
:- target(X,Y,XX,Y), X  > XX, area(XX,Y,A), area(Xp,Y,A), XX < Xp, Xp < X.

#show target/4.
