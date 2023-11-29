#show f_open/1.
#show transport_prod/3.

% just for debugging, can be removed
% #show farm/1.
% #show market/1.
% #show f_prod/2.
% #show m_req/3.
% #show supply_limit/2.
% #show request/2.
% #show supplied_by/2.
% #show supplied_with/2.


farm(J) :- f_prod(J, _).
possible_production(J, 1..Max) :- f_prod(J, Max).

market(I) :- m_req(I, _, _).
request(I, R) :- m_req(I, R, _).
supply_limit(I, L) :- m_req(I, _, L).

f_open(J) :- transport_prod(J, _, _).

% generate possible solutions
{ transport_prod(J, I, Q) } :- farm(J), market(I), possible_production(J, Q).

% every market needs R units
% this doesn't work, i think
%:- request(I, R), R != #sum{ Q: transport_prod(J, I, Q) }.

% it is important to put Q, J here
supplied_with(I, N) :- market(I), N = #sum{ Q, J: transport_prod(J, I, Q) }.
:- supplied_with(I, N), request(I, R), N != R.


% every farm can produce at most N units
:- f_prod(J, N), N < #sum{ Q: transport_prod(J, _, Q) }.

% remove duplicates
% i think this works
:- transport_prod(J, N, Q1), transport_prod(J, N, Q2), Q1 != Q2.

% 
% this does not work
% :- supply_limit(I, L), L != #count{ J, I, Q: transport_prod(J, I, Q) }.

% this does not output the  correct value 
supplied_by(I, N) :- N = #count{ I, J: transport_prod(J, I, _) }, market(I).
:- supplied_by(I, N), supply_limit(I, L), N != L.


%:- supplied_by(I, L), supply_limit(I, L'), supplied_with(I, N), request(I, N'), N != N', L != L'.

