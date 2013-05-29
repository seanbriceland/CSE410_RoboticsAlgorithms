% Sean Briceland
% Cse410/510 - Homework 3
% Main file to drive PRM

file_logging = 'true'; %USED FOR writing to  hwk3.log
if strcmp(file_logging, 'true') == 1
    fid = fopen('hw3rrtNotFound.log', 'w+');
end

qs = [45 315];
qf = [135 45];

g = init_graph(qs); %initialize graph with start config
K = 5000; R = 30;% number of iterations,radius for determining neighborhood
c_rej = zeros(1,2);rcnt=0; % all rejected nodes from intersection with obstacle
edgeL = zeros(K/2,K/2);elcnt = zeros(K/2,1); found=0; % used  for Adjacency List for BFS later
for k=1:K,
    gs = rand();
    if(gs < .1) % 10% of time try to sample goal
        v_near = nearest_vert(qf,g);
        if(R < dist(v_near,qf)) % NODE cannot be connected since it is outside radius
            fprintf(fid,'iteration %d - tried to add GOAL Destination to tree - Unsuccessful\n', k);
        elseif (edge_collision(v_near, qf))
            fprintf(fid,'iteration %d - tried to add GOAL Destination to tree - Unsuccessful\n', k);
        else %no collision WE FOUND THE GOAL!!
            found=1;
            g.vcnt = g.vcnt + 1;
            g.verts(g.vcnt,:) = qf;
            g.ecnt = g.ecnt + 1;
            g.edges(:,:,g.ecnt) = [v_near; qf];
            fprintf(fid,'iteration %d - GOAL FOUND!\n',k);
            for predi=1:g.vcnt; % adacency list creator
                    if(v_near==g.verts(predi,:))
                        break;
                    end
             end
            elcnt(g.vcnt) = elcnt(g.vcnt) + 1;
            edgeL(g.vcnt,elcnt(g.vcnt)) = predi; 
            elcnt(predi) = elcnt(predi) + 1;
            edgeL(predi,elcnt(predi)) = g.vcnt;
            break;
        end
    else %standard RRT 90% of time
        vr = [randi(180) randi(360)];
        if(collision(vr))
            rcnt = rcnt + 1;
            c_rej(rcnt,:) = vr;
            fprintf(fid,'iteration %d -  sample <%d, %d> rejected - sample intersected with obstacle.\n',k,vr(1,1), vr(1,2));
        else
            v_near = nearest_vert(vr, g);
            if(R < dist(v_near,vr)) % NODE cannot be connected since it is outside radius
                fprintf(fid,'iteration %d - sample <%d, %d> rejected - Outside Neighborhood of nearest node.\n',k,vr(1,1), vr(1,2));
            elseif (edge_collision(v_near, vr))
                fprintf(fid,'iteration %d - sample <%d, %d> rejected - EDGE COLLISION.\n',k,vr(1,1), vr(1,2));
            else %no collision between config nodes
                g.vcnt = g.vcnt + 1;
                g.verts(g.vcnt,:) = vr;
                g.ecnt = g.ecnt + 1;
                g.edges(:,:,g.ecnt) = [v_near; vr];
                
                for predi=1:g.vcnt; % adacency list creator
                    if(v_near==g.verts(predi,:))
                        break;
                    end
                end
                elcnt(g.vcnt) = elcnt(g.vcnt) + 1;
                edgeL(g.vcnt,elcnt(g.vcnt)) = predi; 
                elcnt(predi) = elcnt(predi) + 1;
                edgeL(predi,elcnt(predi)) = g.vcnt;
                fprintf(fid,'iteration %d - sample <%d, %d> added to RRT tree.\n',k,vr(1,1), vr(1,2));                
            end
        end
    end
end

if (found)
    [pth,dep] = bfs(g,edgeL,1);
else
    [pth,dep] = bfs(g,edgeL,0);
end
nearf = nearest_vert(qf,g); 

fprintf(fid,'Results - # of nodes in RRT tree = %d\n',g.vcnt);
fprintf(fid,'Results - # of edges in RRT tree = %d\n',g.ecnt);
fprintf(fid,'Results - Node closest to DEST = <%d, %d>\n',nearf(1,1), nearf(1,2));
fprintf(fid,'Results - Depth closest node = %d\n',dep);


plot(c_rej(:,1), c_rej(:,2),'kx')
       title('RRT Config Space')
       axis([0 200 0 380])
       hold all %hold plot
plot(g.verts(:,1), g.verts(:,2), 'b.')
for i=1:g.ecnt,
    plot(g.edges(:,1,i), g.edges(:,2,i))
end

e_path = plot(pth(:,1),pth(:,2));
    set(e_path, 'LineWidth',3,'color','c','MarkerSize',10,'MarkerFaceColor','y')

cs = plot(qs(1,1), qs(1,2), '.'); 
    set(cs,'MarkerSize',25,'color','g')
cg = plot(qf(1,1), qf(1,2), '.');
    set(cg,'MarkerSize',25,'color','r')
hold off
grid on
