
% Define the rows and columns of the chessboard
row(1..N).
col(1..N).

% Define the locations of rooks
rook(X, Y) :- row(X), col(Y).

% Define the locations of bishops
bishop(X, Y) :- row(X), col(Y).

% Rules to ensure no two bishops attack each other
% :- bishop(X1, Y1), bishop(X2, Y2), (X1 - Y1) = (X2 - Y2).
% :- bishop(X1, Y1), bishop(X2, Y2), (X1 + Y1) = (X2 + Y2).

% Rooks can move horizontally or vertically
:- rook(X, Y), rook(X, Y2), Y != Y2.
:- rook(X, Y), rook(X2, Y), X != X2.

% Bishops can move diagonally
:- bishop(X, Y), bishop(X2, Y2), abs(X - X2) != abs(Y - Y2).


% Output the solution
#show bishop/2.
