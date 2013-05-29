
%Input : particles set
%Output : updated particles set

%1) regions = create_regions(particle weights)
%2) updated particles set = initialize() // nothing assigned here

%3) repeat for i = 1 to N
%4) f = generate_random_fraction()
%5) particle = select_particle_whose_region_it_falls_into(f) (say it was particle #j)
%6) set updated particles set[i] as particle
function [p] = resample(parts)

r = regions(parts); % generate region spaces
p = parts; % set p = "dummy parts" - we will overwrite this with updates
for i = 1:p.count,
   f = rand(); 
   for j=1:p.count, % find the "random" interval!
       if(r(j,1) < f && f <= r(j,2))
           break;
       end
   end
   p.coords(i,:) = parts.coords(j,:);
   p.w(i) = parts.w(j);
end

p = normalize(p); 

end