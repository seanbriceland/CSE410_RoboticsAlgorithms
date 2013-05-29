function [q] = init_states()
count = 'count';          val1 = 800; % number of particles
coords = 'coords';        val2 = zeros(val1,2); % (<x,y>) coordinates
w = 'w';                  val3 = zeros(val1,1); % importance weights


q = struct(count,val1, coords,val2, w,val3);

%initialize weight and coords for all 200 states to be uniform dist.
for i=1:q.count,
    q.w(i) = 1/q.count;
    q.coords(i,1) = rand(1)*7; %randomly gen parts between 0,0 and 7,3
    q.coords(i,2) = rand(1)*3;
end

end