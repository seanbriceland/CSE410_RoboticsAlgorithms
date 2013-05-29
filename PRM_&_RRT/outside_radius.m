function [b] = outside_radius(c1, c2, r)
if(dist(c1, c2) > r) 
    b = 1;
else
    b = 0;

end