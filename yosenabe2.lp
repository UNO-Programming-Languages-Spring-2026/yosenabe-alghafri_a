% yosenabe2.lp  (everything from yosenabe1.lp, plus:)

area_id(A)    :- area(_,_,A).
populated(A)  :- target(_,_,XX,YY), area(XX,YY,A).
:- area_id(A), not populated(A).
