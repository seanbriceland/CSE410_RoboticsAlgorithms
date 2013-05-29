% Params: parts - Takes in a particle State struct
% Returns the particle State struct with normalized pmass values
function [p] = normalize(parts)
p = parts;
sum = 0;

for i=1:p.count,
    sum = sum + p.w(i);
end
%Since we need to normalize, the sum should be < 1

for i=1:p.count,
    p.w(i) = parts.w(i)/sum;
end

end