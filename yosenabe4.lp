% yosenabe4.lp  (everything from yosenabe3.lp, plus:)

:- goal(A,G),
   #sum { N,X,Y : target(X,Y,XX,YY), area(XX,YY,A), number(X,Y,N) } != G.
