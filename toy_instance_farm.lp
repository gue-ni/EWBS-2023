f_prod(1, 20;
       2, 20;
       3, 20).
% Meaning that all the farms 
% can produce at most 20 units

% Quantity of products requested by markets
% and maximum number of different farms as suppliers.
m_req(1, 2, 2;
      2, 15, 1;
      3, 2, 1;
      4, 21, 2).
% Market 2 has a necessity of $r_2$=15 product units
% and accept a maximum of $s_2$=1 farm as supplier

% Opening cost for farms.
f_open_cost(1, 4;
            2, 10;
            3, 20).
% Farm 1 has an opening cost of 4

% Cost per unit of transporting products from each farm to each 
% market.
transport_cost(1, 1, 4;
               2, 1, 2;
               3, 1, 5;
               4, 1, 2;

               1, 2, 2;
               2, 2, 5;
               3, 2, 3;
               4, 2, 2;

               1, 3, 3;
               2, 3, 4;
               3, 3, 5;
               4, 3, 3).
% The third row says that the connection from farm 1 to market 3 
% costs 5.

#show f_open/1.
#show transport_prod/3.

% just for debugging, can be removed
% #show farm/1.
% #show market/1.
% #show f_prod/2.
% #show m_req/3.

% #show supply_max/2.
% #show request/2.
% #show supplied_by/2.
% #show supplied_with/2.
% #show produces/2.
% #show real_transport_cost/3.
% #show total_transport_cost/1.
% #show total_opening_cost/1.
% #show total_cost/1.

