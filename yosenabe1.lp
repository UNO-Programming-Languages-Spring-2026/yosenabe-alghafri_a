% yosenabe1.lp
% Q1: Move every number into a gray area along a straight line.

% 1. Identify potential target cells (must be an area cell in the same row or column)
candidate(X,Y,XX,YY,A) :- number(X,Y,_), area(XX,YY,A), X == XX, Y != YY.
candidate(X,Y,XX,YY,A) :- number(X,Y,_), area(XX,YY,A), X != XX, Y == YY.

% 2. A cell is NOT the entry cell if there's another cell of the SAME area A closer to the start.
% This implements the rule: "the move of a number stops at the first cell of the area".
not_first(X,Y,XX,YY,A) :- candidate(X,Y,XX,YY,A), area(X,MidY,A), MidY > Y, MidY < YY.
not_first(X,Y,XX,YY,A) :- candidate(X,Y,XX,YY,A), area(X,MidY,A), MidY < Y, MidY > YY.
not_first(X,Y,XX,YY,A) :- candidate(X,Y,XX,YY,A), area(MidX,Y,A), MidX > X, MidX < XX.
not_first(X,Y,XX,YY,A) :- candidate(X,Y,XX,YY,A), area(MidX,Y,A), MidX < X, MidX > XX.

% 3. Valid targets are candidates that are the first cell encountered for that specific area.
possible(X,Y,XX,YY) :- candidate(X,Y,XX,YY,A), not not_first(X,Y,XX,YY,A).

% 4. Every number must move to exactly one valid target.
1 { target(X,Y,XX,YY) : possible(X,Y,XX,YY) } 1 :- number(X,Y,_).

#show target/4.
