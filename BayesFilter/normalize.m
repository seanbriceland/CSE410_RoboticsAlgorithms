% Params: belS - Takes in a Belif State struct
% Returns the Belief State struct with normalized pmass values
function [q] = normalize(belS)
q = belS;
sum = 0;

for i=1:22,
    sum = sum + belS.pmass(i);
end
%Since we need to normalize, the sum should be < 1

for i=1:22,
    q.pmass(i) = belS.pmass(i)/sum;
end

end