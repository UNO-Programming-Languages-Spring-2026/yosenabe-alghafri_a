% yosenabe3.lp  (everything from yosenabe2.lp, plus:)

% All cells along the straight line from source to target
on_path(X,Y,X,Yp)  :- target(X,Y,X,YY),  cell(X,Yp),  Y  <= Yp, Yp <= YY.
on_path(X,Y,X,Yp)  :- target(X,Y,X,YY),  cell(X,Yp),  YY <= Yp, Yp <= Y.
on_path(X,Y,Xp,Y)  :- target(X,Y,XX,Y),  cell(Xp,Y),  X  <= Xp, Xp <= XX.
on_path(X,Y,Xp,Y)  :- target(X,Y,XX,Y),  cell(Xp,Y),  XX <= Xp, Xp <= X.

% No grid cell may lie on two different paths
:- cell(Px,Py), #count { X,Y : on_path(X,Y,Px,Py) } > 1.
