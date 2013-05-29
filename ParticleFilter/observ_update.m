% For ALL particles, takes a mean distance measurement to closest beacon
% Applies gaussian noise with variance 0.25 to this measurement
% Uses a Normal Kernel function to compare similarity between this measurement and the correct observation
% Updates the weights of all particles (and normalizes)
% Returns updated particles with new weights.
function [p] = observ_update(parts, co, t)
p = parts;

for i=1:p.count,
    %get mean distances to each beacon 
   md1 = sqrt( (p.coords(i,1) - 2)^2 + (p.coords(i,2) - 0)^2 );
   md2 = sqrt( (p.coords(i,1) - 5)^2 + (p.coords(i,2) - 0)^2 );
   if (md1 < md2) % get the mean distance from closest beacon
       mdp = md1;
   else
       mdp = md2;
   end
   
   % create noisy md measurement with var = 0.25
   nmd = mdp + normrnd(0, sqrt(0.25));

   % compute the normal kernel function:
   % use difference between correct observation dist(co) at t and nmd
   k = exp(- sqrt( (nmd - co(t,1))^2 )/0.2); 
   
   % reward weights with higher similarity
   p.w(i) = parts.w(i) * k;
    
end

p = normalize(p); % since we multiply by fractions
end