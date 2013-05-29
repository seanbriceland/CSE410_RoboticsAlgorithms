function [b] = collision(config)
% Given coordinates check to see if it is in an obstacle
% Returns 1 for true or coordinates are in obstacle
% Otherwise returns 0


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Convert Config Angles to coordinates%%%
a1 = config(1,1);
a2 = config(1,2);

x1 = cosd(a1); %hypotonuse is always 1.0, we don't 1.0*cosd(a1)
y1 = sind(a1);

t2 = a1+a2;
x2 = x1 + cosd(t2);
y2 = y1 + sind(t2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

yDiff = y2 - y1;
xDiff = x2 - x1;
n = 100; %n = number of intervals points between endpoints
xInc = xDiff/n; %incremental value for x
yInc = yDiff/n; %incremental val for y

x = x1;%initialize x,y to begin at (x1,y1)
y = y1;
b=0; %assume no collision unless proven otherwise by all intervals:
for i=0:n,
    if(y <= 0)
        b = 1; break;
    elseif (x >= 1) && (x <= 2)&& (y >= 1) && (y <= 2)
        b = 1; break;
    elseif (x <= -1) && (x >= -2) && (y >= 1) && (y <= 2)
        b = 1; break
    end
   % fprintf('x,y = (%d,%d)\n',x,y);
    x = x + xInc;
    y = y + yInc;
end %end for

end %end of func