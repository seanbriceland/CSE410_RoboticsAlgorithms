function [ a_val ] = get_max_a(q,qfv)
%returns the maximum value from the 4 possible actions of state q.
r = q(1,1);
c = q(2,1);

% Set a_val to up then check to see if any other value is greater
a_val = qfv(r,c,1); %up_action_value

if (qfv(r,c,2) >= a_val ) % down action value >= up action value...
    a_val = qfv(r,c,2);
end

if ( qfv(r,c,3) >= a_val ) % left ...
    a_val = qfv(r,c,3);
end

if ( qfv(r,c,4) >= a_val ) % right ...
    a_val = qfv(r,c,4);
end

end

