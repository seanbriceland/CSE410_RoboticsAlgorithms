function [co] = init_co(ts)

r = [1;1];
co = zeros(ts,2); % stores correct observation and closest beacon

for i=1:ts,
   r(1) = r(1) + 0.2;
   md1 = sqrt( (r(1) - 2)^2 + (r(2) - 0)^2 );
   md2 = sqrt( (r(1) - 5)^2 + (r(2) - 0)^2 );
 
   % set correct observation and which beacon for each time step
   if (md1 < md2)
       co(i,1) = md1; 
       co(i,2) = 1; 
   else
       co(i,1) = md2;
       co(i,2) = 2;
   end
end

end