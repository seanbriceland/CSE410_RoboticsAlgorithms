function [ nq ] = get_next_q(r,c,a)
%Takes the current state and an action in order to return next state

%check for windy state, which will be given the value of 0-no or 1-yes
w = windy_check(r,c);

switch a
    case 1 %up
        nr = r - 1 - w;
        nc = c;
    case 2 %down
        nr = r + 1 - w;
        nc = c;
    case 3 %left
        nc = c - 1;
        nr = r - w;
    case 4 %right
        nc = c + 1;
        nr = r - w;
end

% OFF World Movement: send state back to state where action was taken.
if (nc < 1 || nc > 6) % if we go off the left or right side, return to current state.
    nc = c;
    nr = r;
elseif(nr < 1 || nr > 5) % off top or bottom..
    nr = r;
    nc = c;
end

% Into Windy State 
nq = zeros(2,1);
nq(1,1) = nr; % sets the new row nr
nq(2,1) = nc; % sets the new col nc   
end

