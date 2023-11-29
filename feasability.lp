farm(J) :- f_prod(J, _).
possible_production(J, 1..Max) :- f_prod(J, Max).

market(I) :- m_req(I, _, _).
request(I, R) :- m_req(I, R, _).
supply_limit(I, L) :- m_req(I, _, L).

f_open(J) :- transport_prod(J, _, _).

% generate possible solutions
{ transport_prod(J, I, Q) } :- farm(J), market(I), possible_production(J, Q).

% total number of units supplied to I
% it is important to put Q, J here
supplied_with(I, N) :- market(I), N = #sum{ Q, J: transport_prod(J, I, Q) }.
:- request(I, N), supplied_with(I, N'), N != N'.

% total number of units produced by J
produces(J, N) :- farm(J), N = #sum{ Q : transport_prod(J, _, Q) }.
:- f_prod(J, N), produces(J, N'), N < N'.

% remove duplicates
:- transport_prod(J, N, Q1), transport_prod(J, N, Q2), Q1 != Q2.

% total number of farms supplying I
supplied_by(I, N) :- N = #count{ I, J: transport_prod(J, I, _) }, market(I).
:- supply_limit(I, N), supplied_by(I, N'), N < N'.



