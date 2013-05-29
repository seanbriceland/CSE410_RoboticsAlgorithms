function [a, v, next_q] = policy( q, qfv )
% Standard Q-Learning policy according to E-Greedy
% Note: Since we already took care of a 10% random action,
%   this policy will strictly deal with the 90% of time in which
%   E-Greedy selects the action with the highest estimated reward.


r = q(1,1); %current row
c = q(2,1); %current col
alpha = 0.1; %learning rate
gamma = 0.9; %discount rate

% Take action with highest estimated reward:
a = get_a(r,c,qfv);

v = qfv(r,c,a);    % v = value of current state when taking action a.

next_q = get_next_q(r,c,a); % taking our random action a, return the next state q.

if(goal_check(next_q))      % check to see if next state has reward, for this hwk it is same as asking if next state is goal.
    rew = 10;
else
    rew = 0;
end 

max_next_a_val = get_max_a(next_q, qfv);
v = v + alpha * (rew +  gamma * (max_next_a_val) - v);

end

