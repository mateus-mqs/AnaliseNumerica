%avalia polinômio de grau n na abscissa a
function [y] = Horner(n, c, a)
y = c(1);
for i = 2 : n+1
    y = y * a + c(i);
end
end