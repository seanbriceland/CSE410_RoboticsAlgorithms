% Sean Briceland
% Cse410/510 - Homework 3
% Main file to drive PRM


file_logging = 'true'; %USED FOR writing to  hwk3.log
if strcmp(file_logging, 'true') == 1
    fid = fopen('hw3prm.log', 'w+');
end

% randomly generate sample configurations
N = 5500; %N is the number of sample configs we will generate.
R = 25; %R will be the size of our radius for attaching edges
c_space = zeros(1,2); %c_space = all random config generated, c_acc = all collision-free configs.
c_rej = zeros(1,2); rcnt=0; c_acc = zeros(1,2); acc_count = 2;%we will be storing start and goal configs in ms_space(1,:) and ms_space(2,:);
fprintf(fid,'****Generating %d randon sample configuratios****\n', N);
for i=1:N, %creates N # of sample confgurations
   c_space(1,1) = randi(180);
   c_space(1,2) = randi(360);
   if(collision(c_space(1,:)))
       fprintf(fid,'iteration %d: (<%d,%d>) Collision occured: REJECTED\n', i, c_space(1,1), c_space(1,2));
       rcnt = rcnt+1;
       c_rej(rcnt,:) = c_space(1,:);
   else % add acceptable config to ms_space
       fprintf(fid,'iteration %d: (<%d,%d>) No Collision: ADDED to PRM graph\n', i, c_space(1,1), c_space(1,2));
       acc_count = acc_count + 1;
       c_acc(acc_count,:) = c_space(1,:);
   end
end

fprintf(fid,'****Add start and goal config****\n');
c_acc(1,:) = [45 315]; %add start config to list of valid configs [45 45] = [45 -45]
c_acc(2,:) = [135 45]; %add goal config to list of valid nodes

fprintf(fid,'****Begin adding valid edges to Adjacency List****\n');

%Create valid edges between c_acc nodes, edgeL = Adjacency List of edges
edgeL = zeros(acc_count, acc_count); numedges = 0; e_cnt = zeros(acc_count,1); %e_count is number of edges per each edge in list.
for i=1:(acc_count-1),   %for every node search for a valid edge between i-j (don't need to search last according to my algo...)
    for j=(i+1):acc_count, %check every other n-1 node, since we already checked for edges i, 
        if( outside_radius(c_acc(i,:), c_acc(j,:), R ) )
            %fprintf('create edge iteration #%d - Edge NOT added - Outside of Radius\n', (iter));
        elseif( edge_collision(c_acc(i,:), c_acc(j,:) ) )
            %fprintf('create edge iteration #%d - Edge NOT added - Edge Collision\n', (iter));
        else
            %fprintf('create edge iteration #%d - EDGE ADDED SUCCESSFULLY - <%d,%d>-<%d,%d>\n', (iter), c_acc(i,1),c_acc(i,2), c_acc(j,1), c_acc(j,2) );
            numedges = numedges +1;
            e_cnt(i) = e_cnt(i) + 1;
            edgeL(i,e_cnt(i)) = j; % j represents the fact that i-j is an edge ;
            
            e_cnt(j) = e_cnt(j) + 1; %symetrically add j,i as well
            edgeL(j,e_cnt(j)) = i;
                
        end
    end
end

fprintf(fid,'****Number of nodes created: %d\n',acc_count);
fprintf(fid,'****Number of edges created: %d\n',numedges);

%perform BFS to find goal from start
fprintf(fid,'****Perform BFS on Adjacency List****\n');

%pre-cond: 1 == start, 2 == goal
q = zeros(); m = zeros(); pred=zeros(); d = zeros();found=0;
q(1) = 1; d(1)=0; pred(1)=1; qptr = 1; qadd = 1; m(1) = 1; mptr = 1;
while any(q>0)
    t = q(qptr); q(qptr) = 0; qptr = qptr + 1; %dequeue q
    
    if(t == 2)%found our goal!
        path_d = d(t);
        found=1;
        break;
    end
  
    for en=1:acc_count, %for a given node check if it is an edge with any other node
        if (t==en) % dont check for an edge between same node
            %donothing
        elseif (edgeL(t,en) == 0) %if we reached end of edge list break for
            break; 
        elseif (edgeL(t,en)>0)
            u = edgeL(t,en);
            if any(m==u)
                %already marked do nothing
            else
                mptr = mptr + 1;
                m(mptr) = u;
                qadd = qadd + 1;
                q(qadd) = u; 
                pred(u) = t; %stores predecessor of u for backtracing.
                d(u) = d(t) + 1;
            end
        end
    end
end

if(found==1)%backtrace from goal to find path from s -> g
    fprintf('FOUND GOAL!!\n');%intentionally don't print this to file so i can see in console
    fprintf(fid,'FOUND GOAL!!\n');
    fprintf(fid, 'path distance from start to goal = %d', path_d);
    %prepare to backtrace from goal which is 2
    path = zeros(1,2); p=2; path(1,:) = c_acc(p,:); %initialize goal to be first node in path.
    %Create plot of goal->start path
    for i=1:path_d,
        p=pred(p);
        path(i+1,:) = c_acc(p,:);
        
    end
else
    fprintf('Goal Not Found :(\n');%intentionally don't print this to file so i can see in console
end

plot(c_rej(:,1), c_rej(:,2),'kx')
       title('PRM Config Space')
       axis([0 200 0 380])
       hold all %hold plot
plot(c_acc(:,1), c_acc(:,2), 'b.')
cs = plot(c_acc(1,1), c_acc(1,2), '.'); 
    set(cs,'MarkerSize',20,'color','g')
cg = plot(c_acc(2,1), c_acc(2,2), '.');
    set(cg,'MarkerSize',20,'color','r')
e_path = plot(path(:,1),path(:,2));
    set(e_path, 'LineWidth',4,'color','c','MarkerSize',10,'MarkerFaceColor','y')
hold off
grid on
