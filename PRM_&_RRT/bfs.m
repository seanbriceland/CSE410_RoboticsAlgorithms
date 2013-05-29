function [path, path_d] = bfs(g, edgeL, f)
if (f)
    dest = g.vcnt;
else
    nearest = nearest_vert(g.dest, g);
    for i=1:g.vcnt,
        if(g.verts(i,:)==nearest)
            dest=i;
            break;
        end
    end
end
    
%pre-cond: 1 == start, g.vcnt == goal
q = zeros(); m = zeros(); pred=zeros(); d = zeros();
q(1) = 1; d(1)=0; pred(1)=1; qptr = 1; qadd = 1; m(1) = 1; mptr = 1; path_d=0; found=0;
while any(q>0)
    t = q(qptr); q(qptr) = 0; qptr = qptr + 1; %dequeue q
    
    if(t == dest)%found our goal!
        path_d = d(t);
        found =1;
        break;
    end
  
    for en=1:g.vcnt, %for a given node check if it is an edge with any other node we will break well before this
        if (edgeL(t,en) == 0) %if we reached end of edge list break for
            break; 
        else % (edgeL(t,en)>0)
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

% t=g.vcnt of goal if we found it
path = zeros(1,2); p=t; path(1,:) = g.verts(p,:);%initialize goal to be first node in path.
if(found)%backtrace from goal to find path from s -> g
    fprintf('FOUND PATH!!\n');%intentionally don't print this to file so i can see in console
    %fprintf(fid, 'path distance from start to goal = %d', path_d);

    for i=2:path_d+1,
        p=pred(p);
        path(i,:) = g.verts(p,:);
    end
else
    fprintf('path not found\n');
end