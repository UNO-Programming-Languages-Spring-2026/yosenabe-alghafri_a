% yosenabe1.lp

% Possible targets: an area cell in same row OR same column as the number
possible(X,Y,XX,Y)  :- number(X,Y,_), area(XX,Y,_), X != XX.
possible(X,Y,X,YY)  :- number(X,Y,_), area(X,YY,_), Y != YY.

% Each number is moved to exactly one possible target
1 { target(X,Y,XX,YY) : possible(X,Y,XX,YY) } 1 :- number(X,Y,_).

% Stops at the FIRST cell of the target's area along the direction
% Going down  (Y < YY)
:- target(X,Y,X,YY), Y  < YY, area(X,YY,A), area(X,Yp,A), Y  < Yp, Yp < YY.
% Going up    (Y > YY)
:- target(X,Y,X,YY), Y  > YY, area(X,YY,A), area(X,Yp,A), YY < Yp, Yp < Y.
% Going right (X < XX)
:- target(X,Y,XX,Y), X  < XX, area(XX,Y,A), area(Xp,Y,A), X  < Xp, Xp < XX.
% Going left  (X > XX)
:- target(X,Y,XX,Y), X  > XX, area(XX,Y,A), area(Xp,Y,A), XX < Xp, Xp < X.

#show target/4.
