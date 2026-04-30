% yosenabe2.lp
% Q2: every gray area must contain at least one moved number.

possible(X,Y,XX,Y) :- number(X,Y,_), area(XX,Y,_), X != XX.
possible(X,Y,X,YY) :- number(X,Y,_), area(X,YY,_), Y != YY.

1 { target(X,Y,XX,YY) : possible(X,Y,XX,YY) } 1 :- number(X,Y,_).

% --- new for Q2 ---
area_id(A)   :- area(_,_,A).
populated(A) :- target(_,_,XX,YY), area(XX,YY,A).
:- area_id(A), not populated(A).

#show target/4.
