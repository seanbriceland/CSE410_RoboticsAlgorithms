% INPUT: particles with weights
% OUTPUT: region space of particle weights

% a) Divide the space from [0 1] into different regions corresponding to input particle weights.

function [r] = regions(parts)
r = zeros(parts.count, 2); %stores the region space for each particle
rval = 0;
for i = 1:parts.count,
    inc = rval + parts.w(i);
    r(i,:) = [rval, inc];
    rval = inc;
end

end