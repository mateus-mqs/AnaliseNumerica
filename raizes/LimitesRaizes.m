function [L] = LimitesRaizes(n, c)
%n = grau polinomio
%c = matriz com os coef do polinomio
MatC = zeros(4,n+1);
L = zeros(1,4);
n1 = n + 1;
if rem(n,2) == 0
    Sinal = 1;
else
    Sinal = -1;
end
for i = 1 : n1
    MatC(i,1) = c(i);
    MatC(n1+1-i,2) = c(i);
    MatC(i,3) = Sinal*c(i); Sinal = -Sinal;
    MatC(n1+1-i,4) = MatC(i,3);
end
for j = 1 : 4
    if MatC(1,j) < 0
        for i = 1 : n1
            MatC(i,j) = -MatC(i,j);
        end
    end
    B = 0;
    for i = n1 : -1 : 2
        if MatC(i,j) < 0
            k = i;
            if abs(MatC(i,j)) > B
                B = abs(MatC(i,j));
            end
        end
    end
    if B ~= 0
        L(j) = 1 + (B/MatC(1,j))^(1/(k-1));
    else
        L(j) = 10^10;
    end
end
aux = L(1); L(1) = 1/L(2); L(2) = aux; L(3) = - L(3); L(4) = -1/L(4);
fprintf("%.5f <= r- <= %.5f\n",L(3),L(4));
fprintf("%.5f <= r+ <= %.5f\n",L(1),L(2));
end