% init_q sets returns the initial start state location on our grid.
% used to reset our current state location to the start location
function [q] = init_q()
q = zeros(2,1); % [0 0] vector created
q(1,1) = 5; %sets the row(r) = 5
q(2,1) = 1; %sets the col(c) = 1
end