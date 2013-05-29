function [q] = init_states()
numstates = 'numstates';  val1 = 22;
pmass = 'pmass';          val2 = zeros(22,1);
color = 'color';          val3 = zeros(22,1); %1 for pink, 2 for yellow
pink = 'pink';            val4 = [2 3 4 5 6 9 10 11 12 13 16 17 18 19 20];
yellow = 'yellow';        val5 =  [1 7 8 14 15 21 22]; %number of states colored yellow ( We can derive pink by using NOT yellow logically )

q = struct( numstates,val1, pmass,val2, color,val3, pink,val4, yellow,val5 );

%initialize pmass for all 22 states to be uniform dist.
for i=1:22,
    q.pmass(i) = 1/22;
end

yel = [1 7 8 14 15 21 22];
for i=1:22,
    if(any(yel==i))
        q.color(i) = 2;
    else
        q.color(i) = 1;
    end
    
end