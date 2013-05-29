%Finds the cartesian distance between two points
function [d] = distance(p1, p2)
d = sqrt((p2(1,1) - p1(1,1))^2 + (p2(2,1) - p1(2,1))^2);
end