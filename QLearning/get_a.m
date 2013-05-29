function [a] = get_a(r,c,qfv)
%Given: Current State, Current StateFunction
%return best possible action a(1-up, 2-down, 3-left, 4-right)

% Using highest values of 4 possible actions get action a(1-4)
a_val = qfv(r,c,1); %up_action_value
a = 1; % initially let a be 1 or Up

if (qfv(r,c,2) >= a_val ) % down action value >= up action value: a = 2
    a_val = qfv(r,c,2);
    a = 2;
end

if ( qfv(r,c,3) >= a_val ) % left ...
    a_val = qfv(r,c,3);
    a = 3;
end

if ( qfv(r,c,4) >= a_val ) % right ...
    a = 4;
end


end

