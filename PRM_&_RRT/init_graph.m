function [g] = init_graph(qi)
% initializes a graph with start node qi
verts = 'verts';  val1 = zeros(1,2);
edges = 'edges';  val2 = zeros(2,2,1);
vcnt = 'vcnt'; val3 = 1;%since we are initializing the tree with a root
ecnt = 'ecnt'; val4 = 0;
dest = 'dest'; val5 = [135 45];

g = struct(verts,val1,edges,val2,vcnt,val3,ecnt,val4, dest, val5);
g.verts(1,:) = qi(1,:);
end