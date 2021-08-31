m = 5;
x = [0.1 0.3 0.5 0.7 0.9];
y = [3.8443 4.7341 5.8291 7.1764 8.8341];
z = 0.38;

Dely = y;
for i = 1 : m - 1
    for k = m:-1:i+1
        Dely(k) = Dely(k) - Dely(k-1);
    end
end
u = (z-x(1))/(x(2)-x(1));
pz = Dely(m);
for i = m-1 : -1 : 1
    pz = pz * (u-i+1)/i + Dely(i);
end

disp(pz);

%%

m = 3;
x = [2 4 6];
y = [2 1 4/6];
z = 5.4;
Dely = zeros(m);
for i = 1 : m
    Dely(i,1) = y(i);
end
for j = 2 : m
    for i = 1:m-j+1
        Dely(i,j) = Dely(i+1,j-1) - Dely(i,j-1);
    end
end
u = (z-x(1))/(x(2)-x(1));
pz = Dely(1,m) * ((u-(m-2))/((m-2)+1));
for i = m-1:-1:2
    pz = pz + Dely(1,i);
    pz = pz * (u-(i-2))/((i-2)+1);
end
pz = pz + Dely(1,1);
disp(Dely);
disp(pz);