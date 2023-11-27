#show rook/2.
#show bishop/2.
% #show tile/2.

tile(1..N,1..N) :- size(N).

% generate pieces on spares
{ rook(X, Y) } :- tile(X, Y).
{ bishop(X, Y) } :- tile(X, Y).

% only one per square
:- rook(X,Y), bishop(X1, Y1), X != X1, Y != Y1.

% limit number of rooks
:- n_rooks(N), N != #count{ X, Y: rook(X, Y) }.

% limit number of bishops
:- n_bishops(N), N != #count{ X, Y: bishop(X, Y) }.


%rook(X, Y), rook(X1, Y1) :- X != X1, Y != Y1.



% Rooks can move horizontally or vertically
:- rook(X, Y), rook(X, Y2), Y != Y2.
:- rook(X, Y), rook(X2, Y), X != X2.

% Bishops can move diagonally
:- bishop(X, Y), bishop(X2, Y2), abs(X - X2) != abs(Y - Y2).

%:-  not { bishop(X, Y) } == n_bishops.