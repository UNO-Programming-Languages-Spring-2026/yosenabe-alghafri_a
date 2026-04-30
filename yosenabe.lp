% yosenabe1.lp
% Q1: Move every number into a gray area along a straight line.

% 1. Identify all potential target cells (must be an area cell in the same row or column)
target_candidate(X,Y,XX,YY,A) :- number(X,Y,_), area(XX,YY,A), X == XX, Y != YY.
target_candidate(X,Y,XX,YY,A) :- number(X,Y,_), area(XX,YY,A), X != XX, Y == YY.

% 2. A cell is NOT the entry cell if there is another cell of the SAME area A closer to the start
not_entry(X,Y,X,YY,A) :- target_candidate(X,Y,X,YY,A), area(X,MidY,A), MidY > Y, MidY < YY.
not_entry(X,Y,X,YY,A) :- target_candidate(X,Y,X,YY,A), area(X,MidY,A), MidY < Y, MidY > YY.
not_entry(X,Y,XX,Y,A) :- target_candidate(X,Y,XX,Y,A), area(MidX,Y,A), MidX > X, MidX < XX.
not_entry(X,Y,XX,Y,A) :- target_candidate(X,Y,XX,Y,A), area(MidX,Y,A), MidX < X, MidX > XX.

% 3. Define valid moves: Only the first (entry) cell of any reachable area is allowed
possible(X,Y,XX,YY) :- target_candidate(X,Y,XX,YY,A), not not_entry(X,Y,XX,YY,A).

% 4. Every number must move to exactly one valid target
1 { target(X,Y,XX,YY) : possible(X,Y,XX,YY) } 1 :- number(X,Y,_).

#show target/4.
