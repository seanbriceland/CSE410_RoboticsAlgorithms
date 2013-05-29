HWK #3 - README FILE
UPDATED - 4/10/2013 - 5:09am


//////////////////////////
//RRT

One Quick note: I did add two log files, two plots and results. One for a Successfully found goal and one for NOT found goal

mainRRT.m
- Main driver for RRT Algorithm
- Uses RRT algo and BFS to find path from start to goal

init_graph.m
-creates a graph struct with initial node = start config

collision.m
- tests to see whether a given config<(theta1, theta2)> collides with our obstacles in cartesian coordinates

dist.m
- calculates distance between any given set of coordinates (config1,config2)

edge_collision.m
- Tests whether a given pair of config nodes collide when trying to connect them as an edge
- Creates a config interval to test configurations between the two config nodes. Checking whether they collide with an obstacle in cartesian coordinates.


hw3rrtGoalNOTfound.pdf
-  Contains the plot for my RRT when it DOESN'T find the goal

hw3rrt.log
- logfile for GOAL FOUND RRT Algorithm

hw3rrtNotFound.log
- logfile for GOAL NOT FOUND RRT Algorithm

ii) VALUES: 
FOR FOAL FOUND:
Radius = 50
# of Random Config Nodes generated = 5000

FOR EXAMPLE OF GOAL NOT FOUND:
Radius = 30
# of Random Config Nodes generated = 5000

iii) RESULTS
FOR GOAL FOUND:
Results - # of nodes in RRT tree = 830

Results - # of edges in RRT tree = 829

Results - Node closest to DEST = <135, 45>

Results - Depth closest node = 17


FOR GOAL NOT FOUND:
Results - # of nodes in RRT tree = 1111
Results - # of edges in RRT tree = 1110
Results - Node closest to DEST = <126, 180>
Results - Depth closest node = 13

//////////////////////////
//PRM

i) SUBMITTED FILES:
mainPRM.m
- the main driver file includes the following:
- PRM Config Space allocation algorithm
- Graph Representation as an Adjacency List Algorithm
- BFS search algo to find shortest path
- Plot Function to create Config Space plot

collision.m
- tests to see whether a given config<(theta1, theta2)> collides with our obstacles in cartesian coordinates

outside_radius.m
- Tests whether a given pair of config nodes are within the specified radius
- uses below dist.m 

dist.m
- calculates distance between any given set of coordinates (config1,config2)

edge_collision.m
- Tests whether a given pair of config nodes collide when trying to connect them as an edge
- Creates a config interval to test configurations between the two config nodes. Checking whether they collide with an obstacle in cartesian coordinates.

hw3prm.pdf
-  Contains the plot for my PRM. A side note, I was having trouble displaying the start and end nodes as well as the nodes on the path, since the path nodes would overwrite my start and goal. So currently my goal should be red, but is showing as cyan/yellow as I used a node to start my path from goal.

hw3prm.log  
- log file for PRM

ii) VALUES: 
Radius = 25
# of Random Config Nodes generated = 5500

iii) RESULTS
# of ACCEPTED nodes added to graph = 3410
# of edges created = 215822
Length of shortest path = 13

iv) Although I left my # of nodes generated = 5500, I was able to find the goal with lesser amounts of nodes.
There were many cases with 1,000 - 3,000 nodes and higher radius. However, I stuck with generating 5500 nodes and a smaller radius as it was more consistent and found a more direct(maybe not shorter node wise) path. Also, there are a few additional files that I created (get_coords.m, get_configs.m), however I am not using them at the moment. I am keeping them in case my RRT implementation calls upon them.

Also, as you can see I have not listed my RRT information here yet. I hope to do so ASAP. 