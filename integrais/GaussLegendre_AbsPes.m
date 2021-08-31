function [T, W, Info] = GaussLegendre_AbsPes(n)
%saidas: abscissas T(1): menor zero, e T(n) maior zero
        %W sao os pesos
        %Info
%entradas: numero de pontos n >= 1
W = zeros(1, n); T = zeros(1, n);
if n < 1
    Info = -1;
    return;
end
Toler = 10^-15; IterMax = 30; %tolerancia e iteracoes max (colocar na entrada)
Info = 0; m = fix(n/2); pi8 = 3.141592653589793;
%os zeros são simetricos, calculam-se apenas os positivos
for i = 1 : m
    z = cos((i - 0.25)/(n + 0.5)*pi8);
    delta = 1 + Toler; Iter = 0;
    while 1 == 1
        p1 = 1; Pz = z;
        for k = 2 : n
            p0 = p1; p1 = Pz;
            Pz = ((2*k-1)*z*p1 - (k-1)*p0)/k;
        end
        DPz = n * (p1 - z * Pz)/(1-z^2);
        if abs(delta) <= Toler || Iter == IterMax
            break;
        end
        delta = Pz/DPz; z = z - delta; Iter = Iter + 1;
    end
    if abs(delta) <= Toler
        T(i) = -z; T(n+1-i) = z; %abscissas
        W(i) = 2/((1-z^2)*DPz^2);
        W(n+1-i) = W(i); %pesos
    else
        T(i) = 0; T(n+1-i) = 0;
        W(i) = 0; W(n+1-i) = 0; Info = Info + 1;
    end
end
if rem(n,2) ~= 0
    T(m+1) = 0;
    W(m+1) = pi8/2 * exp(log((n+1)/2) - log(n/2 + 1))^2;
end
end