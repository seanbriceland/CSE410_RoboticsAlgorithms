% Sean Briceland 
% cse410 - Hwk #5
% Main File to DRIVE Particle Filter for Robot moving from Start to End 
%   - 15 Time Steps


file_logging = 'true'; %USED FOR writing to  hwk4.log
if strcmp(file_logging, 'true') == 1
    fid = fopen('hw5log.log', 'w+');
end

parts = init_states(); % Initializes probabilities for all particles (200 particles initialized)
ts = 15; % init # of time steps
co = init_co(ts); % initializes the correct observations

plotNsave(parts, 'scatter', 0); % initial plot

fprintf(fid,'******Initial Instant******\n');
for i = 1:parts.count,
    fprintf(fid,'particle %d (x, y) = (%d, %d), weight = %d\n',i,parts.coords(i,1),parts.coords(i,2), parts.w(i));
end
% particle filtering Algorithm
for t=1:ts,

    parts = proc_update(parts);
    
    parts = observ_update(parts, co, t);

    parts = resample(parts);
    plotNsave(parts, 'scatter',t);
    fprintf(fid,'******Time Step %d******\n',ts);
    for i = 1:parts.count,
        fprintf(fid,'particle %d (x, y) = (%d, %d), weight = %d\n',i,parts.coords(i,1),parts.coords(i,2), parts.w(i));
    end
end




















