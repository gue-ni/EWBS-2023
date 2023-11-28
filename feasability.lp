#show f_open/1.
#show transport_prod/3.

% just for debugging, can be removed
% #show farm/1.
% #show market/1.
% #show f_prod/2.
% #show m_req/3.


farm(J) :- f_prod(J, _).
possible_production(J, 1..Max) :- f_prod(J, Max).

market(I) :- m_req(I, _, _).
request(I, R) :- m_req(I, R, _).
supply_limit(I, L) :- m_req(I, _, L).

f_open(J) :- transport_prod(J, _, _).

% generate possible solutions
{ transport_prod(J, I, Q) } :- farm(J), market(I), possible_production(J, Q).

% every market needs R units
% this works, i think
:- request(I, R), R != #sum{ Q: transport_prod(J, I, Q) }.

% this does not work
%:- supply_limit(I, L), L <= #count{ J: transport_prod(J, I, _) }.

% every farm can produce at most N units
:- f_prod(J, N), N <= #sum{ Q: transport_prod(J, _, Q) }.
