n = 2;
x = [0.1 0.6 0.8];
y = [1.221 3.32 4.953];
c = y;

for i = 1 : n
    for k = n+1 : -1 : i+1
        c(k) = (c(k) - c(k-1))/(x(k)-x(k-i));
    end
end
for i = n : -1 : 1
    for k = i : n
        c(k) = c(k) - c(k+1)*x(i);
    end
end

disp(c);