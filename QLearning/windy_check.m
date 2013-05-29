function [ iswindy ] = windy_check(r,c)
%Checks if state is windy, then returns a 0 or 1.

if (r > 1) & (c > 2) & (c < 6)
    iswindy = 1;
    %fprintf('hello windy----\n')
else
    iswindy = 0;
end


end

