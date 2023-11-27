#show rook/2.
#show bishop/2.

tile(1..N,1..N) :- size(N).

% generate pieces on spares
{ rook(X, Y) } :- tile(X, Y).
{ bishop(X, Y) } :- tile(X, Y).

% only one per square
:- rook(X,Y), bishop(X1, Y1), X == X1, Y == Y1.

% limit number of rooks
:- n_rooks(N), N != #count{ X, Y: rook(X, Y) }.

% limit number of bishops
:- n_bishops(N), N != #count{ X, Y: bishop(X, Y) }.

% Rooks can move horizontally or vertically
:- rook(X, Y), rook(X, Y2), Y != Y2.
:- rook(X, Y), rook(X2, Y), X != X2.

:- rook(X, Y), bishop(X1, Y1), X == X1.
:- rook(X, Y), bishop(X1, Y1), Y == Y1.

% Bishops can move diagonally
:- bishop(X, Y), bishop(X1, Y1), (X,Y) != (X1,Y1), abs(X - X1) == abs(Y - Y1).
:- bishop(X, Y), rook(X1, Y1), (X,Y) != (X1,Y1), abs(X - X1) == abs(Y - Y1).

