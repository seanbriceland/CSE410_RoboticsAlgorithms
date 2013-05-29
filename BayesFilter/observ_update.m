% PARAM: c - integer between 1-8 denotes what color Robot is in (even
% though he doesn't know)
% PARAM: belS - Takes in a Belif State struct
% Returns the Belief State struct with updated pmass after observation
% updates
function [q] = observ_update(c, belS)
q = belS;
col = 0;

if (c<5) % set color == pink
    col = 1;
else %color == yellow
    col = -1;
end

if (col == 1) % color is pink
    for i=belS.pink, %update pmass for pink with reward 0.8
        q.pmass(i) = belS.pmass(i) * 0.8;
    end
    
    for i=belS.yellow, % update pmass for yellow with penalty 0.2
        q.pmass(i) = belS.pmass(i) * 0.2;
    end
    
else %color is yellow
    for i=belS.pink, %update pmass for pink with penalty 0.2
        q.pmass(i) = belS.pmass(i) * 0.2;
    end
    
    for i=belS.yellow, % update pmass for yellow with reward 0.8
        q.pmass(i) = belS.pmass(i) * 0.8;
    end    
end

end
