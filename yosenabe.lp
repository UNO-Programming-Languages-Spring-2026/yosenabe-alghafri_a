% 1. Each number must be moved to exactly one target cell (XX,YY)
1 { target(X,Y,XX,YY) : cell(XX,YY), area(XX,YY,A) } 1 :- number(X,Y,N).

% 2. The movement must be in a straight line (Horizontal or Vertical)
:- target(X,Y,XX,YY), X != XX, Y != YY.

% 3. Optimization: A number cannot stay in its original spot if that spot isn't an area
% (Or simply ensure it moves to an area cell as defined in rule 1)

% Show only the target atoms as requested
#show target/4.

#show target/4.
