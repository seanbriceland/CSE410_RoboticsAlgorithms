%initializes the q function with values of all 10 for each state and each
%action, qf(r,c,a) = 10 for all r, c, a initially
function [qf] = init_qf()
qf = 10 * ones(5, 6, 4);
end