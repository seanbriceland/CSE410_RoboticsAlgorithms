% Given config angles, return their relative cartesian coords.
function [xyxy] = get_coords(config_angles)

a1 = config_angles(1,1);
a2 = config_angles(1,2);
%fprintf('a1 = %d, a2 = %d\n',a1,a2);

xyxy = zeros(2,2); %create a 2x2 matrix to hold x1,y1 and x2,y2
x1 = cosd(a1); %since our hypotonuse is always 1.0, we don't need to multiple
y1 = sind(a1);

t2 = a1+a2;
x2 = x1 + cosd(t2);
y2 = y1 + sind(t2);

%fprintf('(x1,y1) = (%d,%d), (x2,y2) = (%d,%d)\n',x1,y1,x2,y2);

xyxy(1,1) = x1;
xyxy(1,2) = y1;
xyxy(2,1) = x2;
xyxy(2,2) = y2;


end