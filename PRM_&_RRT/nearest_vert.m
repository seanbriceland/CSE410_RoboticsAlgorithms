function [nearv] = nearest_vert(vr, g)
nearv = g.verts(1,:); %init nearv to 1st node in g
dmin = dist(nearv, vr);

for i=2:g.vcnt,
    dverts = dist(g.verts(i,:), vr);
    if(dverts < dmin)
        dmin = dverts;
        nearv = g.verts(i,:);
    end
end

end