%This will return the distance between two points.
%This will allow us to compare radius
function [d] = dist(c1, c2)
d = sqrt((c2(1,1) - c1(1,1))^2 + (c2(1,2) - c1(1,2))^2);
end
