function [q] = proc_update(a, belS)
q = belS;

%t = 0; t1 = 0; 
t2 = 0; % t1 - stays, t2 carry over pmass
if(a==1) % right
    for i=1:22,
       if(belS.color(i) == 1) % right update for pink: (0.1 stays, 0.9 moves right)
          % right update on pink
          t1 = belS.pmass(i) * 0.1;
          tc = belS.pmass(i) * 0.9; %temp holder for pmass that carrys out of state.
          q.pmass(i) = t1 + t2; % 0.1 * state_pmass + carry over pmass
          t2 = tc; % 0.9 * pmass moves right
       else % right update on yellow ( 0.1 stays, 0.9 is lost )
          t1 = belS.pmass(i) * 0.1;
          tc = 0 * 0.9;  % this just shows that nothing carries since moving right when in yellow is "lost"
          q.pmass(i) = t1 + t2; % some yellow states can get a carry in from pink!
          t2 = tc;
       end
    end
else     % down
    for i = belS.pink, % down update for pink: (0.1 stays, 0.9 moves right)
          % down update on pink, NO STATE CAN MOVE pmass INTO PINK 
          % AND NO PINK STATE CAN CARRY pmass OUT OF PINK on down
          t1 = belS.pmass(i) * 0.1;
          q.pmass(i) = t1; %temp holder for pmass that carrys out of state.
    end
    t2 = 0; % just to be safe although it should be 0
    for i = belS.yellow % down update on yellow ( 0.1 stays, 0.9 is lost )
          t1 = belS.pmass(i) * 0.1;
          tc = belS.pmass(i) * 0.9; %temporarily copy mass to move out
          q.pmass(i) = t1 + t2;
          t2 = tc;
    end

end
