% Sean Briceland
% Cse410/510 - Homework 1
% Main file with loops to "drive" Q-learning on our Windy Gridy World

file_logging = 'true'; %USED FOR writing to  hwk1.log
if strcmp(file_logging, 'true') == 1
    fid = fopen('hw1.log', 'w+');
end

count_conv = 300; % Convergence Counter we will not know this value until running, therefore I will set it very high to start.
qf_vals = init_qf(); % init q function - set all QFunction Values (r,c,a) = 10
i=1; rewards = zeros(count_conv,2);
while (i <= count_conv) %Outer convergence loop
   fprintf(fid,'--Iteration:%s --\n\r\n', num2str(i))
   count_steps = 0; ep_reward = 0; curr_q = init_q(); % set current state to initial state

   while(count_steps < 30) % while steps <= 30 or curr(r,c) = goal(r,c)
       %fprintf('--step:%s --\n', num2str(count_steps)) %disp(['state: ' , 'Q[', num2str(curr_q(1,1)), ', ', num2str(curr_q(2,1)), ']']);
       
       fprintf(fid, 'state: %s%s%s%s%s\r\n', 'Q[', num2str(curr_q(1,1)), ', ', num2str(curr_q(2,1)), ']');
       if(goal_check(curr_q)) % if we are at goal...
           ep_reward = ep_reward + 10; % add reward ..
           break; % exit current episode 
       end
       
       % Q-Learning w/E-Greedy Policy: start by determining if we take a random action:
       e = rand(); % generate a random fraction between 0-1 for epsilon value
       if (e <= 0.1) % if epsilon value = 0.1 or less (10% of the time) 
           [a,v,next_q] = explore_a(curr_q, qf_vals); % then take a random action: explore_a()
           qf_vals(curr_q(1,1),curr_q(2,1),a) = v; % update qf_vals with new V
           curr_q = next_q; %update current state 
       else % proceed according to Q-Learning policy instead of taking random action first!
           [a,v,next_q] = policy(curr_q, qf_vals);
           qf_vals(curr_q(1,1), curr_q(2,1),a) = v; % update qf_vals 
           curr_q = next_q; % update current state 
       end % end of if epsilon = take random OR follow policy()

       count_steps = count_steps + 1;
   end % end of while count steps && Goal Reached?
   fprintf(fid,'---------END OF EPISODE------\r\n');
   rewards(i,2) = ep_reward;
   rewards(i,1) = i;
   scatter(rewards(:,1), rewards(:,2));
   i = i+1;
end % end of convergence loop.

fclose(fid);
%for j = 1:count_conv, 
    %plot(j,rewards(j,1));
%end


