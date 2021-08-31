function [Integral, Info] = GaussLegendre(a, b, n)
%a = lim inferior, b = lim superior, n = num de pontos >= 1
%[T, W, Info] = GaussLegendre_AbsPes(n);
Info = 0;
T = [-0.7746 0 0.7746];
W = [5/9 8/9 5/9];
if Info ~= 0
    return;
end
Integral = 0; Info = 0;
ba2 = (b-a)/2;
for i = 1 : n
    x = a + ba2 * (T(i) + 1);
    y = (x^3-x^2+5*sin(x)-1); %colocar funcao aqui
    Integral = Integral + y*W(i);
end
Integral = ba2 * Integral;
end