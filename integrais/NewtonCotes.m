function [Integral, Info] = NewtonCotes(a, b, n, m)
%saidas: valor integral e info
        %se info = -1, n tá fora de 1 e 10
        %se info = -10, o resto(m,n) é diferente de 0
        %se info = 0, sem erro
        %se info = -11, deu os dois primeiros
%entradas: limite inferior, lim superior, grau do polinomio, num de subintervalos
Integral = 0; Info = 0;
[d, c, Info] = CoeficientesCotes(n);
if rem(m,n) ~= 0 || m < 0
    Info = Info - 10;
end
if Info ~= 0
    return;
end
h = (b-a)/m; j = 0;
for i = 0 : m
    x = a + i*h; y = (exp(-x)+sqrt(x+2)); %colocar funcao aqui
    j = j + 1; k = c(j);
    if rem(i,n) == 0 && i ~= 0 && i ~= m
        k = k + k; j = 1;
    end
    Integral = Integral + y*k;
end
Integral = n * h/d * Integral;
end