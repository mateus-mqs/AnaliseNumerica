m = 5;
x = [0.1 0.3 0.4 0.6 0.7];
y = [0.3162 0.5477 0.6325 0.7746 0.8367];
z = 0.2;
Dely = y;
for i = 1:m-1
    for k = m:-1:i+1
        Dely(k) = (Dely(k) - Dely(k-1))/(x(k)-x(k-i));
    end
end
pz = Dely(m);
for i = m-1:-1:1
    pz = pz * (z - x(i)) + Dely(i);
end
disp(pz);

%%
m = 4;
x = [3.5 3.8 4 5.1];
y = [1.8 2.1 2.4 4.5];
z = 4.5;
Dely = zeros(m);
for i = 1 : m
    Dely(i,1) = y(i);
end
for j = 2 : m
    for i = 1:m-j+1
        Dely(i,j) = (Dely(i+1,j-1) - Dely(i,j-1))/(x(i+j-1)-x(i));
    end
end
pz = Dely(1,m) * (z - x(m-1));
for i = m-1:-1:2
    pz = pz + Dely(1,i);
    pz = pz * (z - x(i-1));
end
pz = pz + Dely(1,1);
disp(Dely);
disp(pz);