% Repositions ALL particles according to process action 
% affected by a gaussian noise with variance = 0.2
% returns updated set of particles

function [p] = proc_update(parts)
p = parts;

for i=1:parts.count,
    noisya = 0.2 + normrnd(0, sqrt(0.2));
    p.coords(i,1) = parts.coords(i,1) + noisya;
end