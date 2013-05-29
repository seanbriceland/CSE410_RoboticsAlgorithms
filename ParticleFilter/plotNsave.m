function plotNsave (parts, s, ts)
ps = zeros (parts.count,2); ps(:,1) = 1:parts.count; ps(:,2) = parts.w;
if (strcmp(s,'init')) %initial plot
    %ps = zeros (parts.count,2); ps(:,1) = 1:parts.count; ps(:,2) = parts.w;

    for i=1:parts.count, % PLOT INITIAL HISTOGRAM of pmass
        h = plot([ps(i,1) i], [ps(i,2) 0],'LineWidth',4);
        hold all %hold plot
    end %end plot
    
    title('Histogram Plot: Distribution of Importance Weights')
    axis([0 parts.count+1 0 .1])
    xlabel('Particles')
    ylabel('Weight (per particle)')
    hold off
    saveas(h, 'plot0.png'); %strcat if needed
end

if (strcmp(s,'scatter')) % plot scatter
    wmax = max(parts.w);
    wm = parts.w(1)/wmax;
    sc = plot(parts.coords(1,1), parts.coords(1,2), 'rx', 'MarkerSize', wm * 10);
        hold all
    for i=2:parts.count,
        wm = parts.w(i)/wmax;
        plot(parts.coords(i,1), parts.coords(i,2), 'rx', 'MarkerSize', wm * 10);
    end
    
    if(ts==0)
        title(strcat('Particle Plot :- INITIAL particle set'))
    else
        title(strcat('Particle Plot :- Time Step #',num2str(ts)))
    end
    
    axis([0 8 0 3.5])
    xlabel('X Axis')
    ylabel('Y Axis')
    hold off
    saveas(sc,strcat('Scat_Parts_TS',num2str(ts),'.png')); %strcat 
end

end