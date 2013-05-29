function b = goal_check( q )
% Given current state q, check to see if its row = 5 and its col = 5
% if so then our current agent is in the goal state
r = q(1,1);
c = q(2,1);
if(r == 5) & (c == 5)
    b = 1;
else
    b = 0;
end

end

