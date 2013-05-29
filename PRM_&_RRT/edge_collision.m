function [b] = edge_collision(c1, c2)

b=0; %by default return NO COLLISION

NI = 100; %NUMBER OF INTERVALS to check for collision
a1_inc = (c2(1,1) - c1(1,1))/NI;%incremental values for each angle
a2_inc = (c2(1,2) - c1(1,2))/NI;

for i=1:NI, %test each interval between configs c1-c2, starting from c1 to c2.
    ci(1,1) = c1(1,1) + (i*a1_inc);
    ci(1,2) = c1(1,2) + (i*a2_inc);
    if(collision(ci))
        b=1;
        break;
    end
end