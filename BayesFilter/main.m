% Sean Briceland
% Cse410/510 - Homework 4
% Main file to drive Sequential Bayesian Filtering to localize robot

file_logging = 'true'; %USED FOR writing to  hwk4.log
if strcmp(file_logging, 'true') == 1
    fid = fopen('hw4logfile.log', 'w+');
end

%right = 1; %down = 2;

belS = init_states(); % inits a state rep containing pmass, color

z = zeros(22, 2); z(:, 1) = 1:22; %for plotting
ps = zeros (22,2); ps(:,1) = 1:22; ps(:,2) = belS.pmass;

%Initial plot!
for i=1:22, % PLOT INITIAL HISTOGRAM of pmass
    h = plot([ps(i,1) i], [ps(i,2) 0],'LineWidth',4);
    hold all %hold plot
end %end plot
    title('Histogram Plot: Initial Distribution of pmass')
    axis([0 24 0 .1])
    xlabel('Environment States')
    ylabel('Probability Mass (per state)')
hold off
saveas(h, 'plot0.png');

for i=1:8,
    fprintf(fid,'STEP %d ----------------------------------------\n', i);
    if (i<6) % took right action
        belS = proc_update(1, belS); %1 == right action
        for j=1:22,
            fprintf(fid,'posterior probability associated with state %d after PROCESS update = %d\n', j, belS.pmass(j));
        end
        
        belS = normalize(belS);
        for j=1:22,
            fprintf(fid,'normalized posterior probability associated with state %d = %d\n', j, belS.pmass(j));
        end
        
        belS = observ_update(i, belS);
        for j=1:22,
            fprintf(fid,'posterior probability associated with state %d after OBSERVATION update = %d\n', j, belS.pmass(j));
        end        
        
        belS = normalize(belS);
        for j=1:22,
            fprintf(fid,'normalized posterior probability associated with state %d = %d\n', j, belS.pmass(j));
        end

        %Plot new pmass distribution!
        ps(:,2) = belS.pmass;
        for j=1:22, % PLOT INITIAL HISTOGRAM of pmass
            h = plot([ps(j,1) j], [ps(j,2) 0],'LineWidth',4);
            hold all %hold plot
        end %end plot
            title(['pmass distribution for Time Step #',num2str(i),''])
            axis([0 23 0 0.6])
            xlabel('Environment States')
            ylabel('Probability Mass (per state)')
            hold off
        saveas(h, ['plot',num2str(i),'.png']);

    else %took down action
        belS = proc_update(2, belS); %2 == down action
        for j=1:22,
            fprintf(fid,'posterior probability associated with state %d after PROCESS update = %d\n', j, belS.pmass(j));
        end
        
        belS = normalize(belS);
        for j=1:22,
            fprintf(fid,'normalized posterior probability associated with state %d = %d\n', j, belS.pmass(j));
        end

        belS = observ_update(i, belS);
        for j=1:22,
            fprintf(fid,'posterior probability associated with state %d after OBSERVATION update = %d\n', j, belS.pmass(j));
        end
        
        belS = normalize(belS);
        for j=1:22,
            fprintf(fid,'normalized posterior probability associated with state %d = %d\n', j, belS.pmass(j));
        end
        
        %Plot new pmass distribution!
        ps(:,2) = belS.pmass;
        for j=1:22, % PLOT INITIAL HISTOGRAM of pmass
            h = plot([ps(j,1) j], [ps(j,2) 0],'LineWidth',4);
            hold all %hold plot
        end %end plot
            title(['pmass distribution for Time Step #',num2str(i),''])
            axis([0 23 0 0.6])
            xlabel('Environment States')
            ylabel('Probability Mass (per state)')
            hold off
        saveas(h, ['plot',num2str(i),'.png']);
        
    end
    fprintf(fid,'END STEP %d ----------------------------------------\n\n', i);
end


