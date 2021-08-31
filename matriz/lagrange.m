m=4;
y=[1.6267 2.3431 3.3750 6.2003];
x=[1.2 2.1 3.0 4.5];
z=3.1;

pz = 0;
for i = 1:m
    c = 1; d = 1;
    for j = 1 : m
        if i ~= j
            c = c * (z - x(j));
            d = d * (x(i) - x(j));
        end
    end
    pz = pz + y(i) * c / d;
end
disp(pz);

%%
m=4;
y=[1.6267 2.3431 3.3750 6.2003];
x=[1.2 2.1 3.0 4.5];
z=3.1;
pz=0; % resultado
n=3; %numero de pontos ?
g = zeros(n+1);
gd = 1;
gi = ones(1,n+1);
for i = 1:n+1
    for j = 1:n+1
        if i == j
            g(i,i) = z - x(i);
            gd = g(i,i) * gd;
        else
            g(i,j) = x(i) - x(j);
        end
        gi(i) = gi(i) * g(i,j);
    end
    pz = pz + y(i)/gi(i);
end
pz = pz * gd;
disp(g);
