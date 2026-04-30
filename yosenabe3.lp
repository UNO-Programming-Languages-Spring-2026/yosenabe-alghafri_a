% yosenabe3.lp
% Q3: paths of any two moved numbers must not cross or meet.

% --- from yosenabe2.lp ---
possible(X,Y,XX,Y) :- number(X,Y,_), area(XX,Y,_), X != XX.
possible(X,Y,X,YY) :- number(X,Y,_), area(X,YY,_), Y != YY.

1 { target(X,Y,XX,YY) : possible(X,Y,XX,YY) } 1 :- number(X,Y,_).

:- target(X,Y,X,YY), Y  < YY, area(X,YY,A), area(X,Yp,A), Y  < Yp, Yp < YY.
:- target(X,Y,X,YY), Y  > YY, area(X,YY,A), area(X,Yp,A), YY < Yp, Yp < Y.
:- target(X,Y,XX,Y), X  < XX, area(XX,Y,A), area(Xp,Y,A), X  < Xp, Xp < XX.
:- target(X,Y,XX,Y), X  > XX, area(XX,Y,A), area(Xp,Y,A), XX < Xp, Xp < X.

area_id(A)   :- area(_,_,A).
populated(A) :- target(_,_,XX,YY), area(XX,YY,A).
:- area_id(A), not populated(A).

% --- new for Q3 ---
% All grid cells along the straight-line path from source (X,Y) to target.
on_path(X,Y,X,Yp) :- target(X,Y,X,YY), cell(X,Yp), Y  <= Yp, Yp <= YY.
on_path(X,Y,X,Yp) :- target(X,Y,X,YY), cell(X,Yp), YY <= Yp, Yp <= Y.
on_path(X,Y,Xp,Y) :- target(X,Y,XX,Y), cell(Xp,Y), X  <= Xp, Xp <= XX.
on_path(X,Y,Xp,Y) :- target(X,Y,XX,Y), cell(Xp,Y), XX <= Xp, Xp <= X.

% No grid cell may lie on two different paths.
:- cell(Px,Py), 2 { on_path(X,Y,Px,Py) : number(X,Y,_) }.

#show target/4.
