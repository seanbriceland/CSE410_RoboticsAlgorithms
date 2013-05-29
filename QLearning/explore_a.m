function [a,v,next_q] = explore_a( q,qfv )
% 10 percent of the time we want to "explore" paths
% by taking a random action: either up, down, left or right
% if we always followed the policy we may not explore the optimal path

r = q(1,1); %current row
c = q(2,1); %current col
alpha = 0.1; %learning rate
gamma = 0.9; %discount rate

a = randi(4); % generate random action 1-4: 1-U, 2-D, 3-L, 4-R
              % next we need to update qfunction values based on a
v = qfv(r,c,a);    % v = value of current state when taking action a.

next_q = get_next_q(r,c,a); % taking our random action a, return the next state q.

if(goal_check(next_q))      % check to see if next state has reward, for this hwk it is same as asking if next state is goal.
    rew = 10;
else
    rew = 0;
end 

max_next_a_val = get_max_a(next_q,qfv);
v = v + alpha * (rew +  gamma * (max_next_a_val) - v);

%fprintf('v = %s\v',num2str(v))
end

