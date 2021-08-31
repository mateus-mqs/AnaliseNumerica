%determina o num maximo de raizes no intervalo [a,b]
function [NumMax] = Fourier(n, c, a, b)
DerPol = zeros(1,n);
DerPol_a = zeros(1,n+1);
DerPol_b = zeros(1,n+1);
n1 = n + 1; n2 = n + 2;
for i = 1 : n
    DerPol(i) = c(i);
end
DerPol_a(1) = Horner(n,c,a);
DerPol_b(1) = Horner(n,c,b);
for i = 1 : n
    for j = 1 : n1-1
        DerPol(j) = DerPol(j) * (n2 - i - j);
    end
    DerPol_a(i+1) = Horner(n-i,DerPol,a);
    DerPol_b(i+1) = Horner(n-i,DerPol,b);
end
VarSinal_a = TrocaSinais(n1,DerPol_a);
VarSinal_b = TrocaSinais(n1,DerPol_b);
NumMax = VarSinal_a - VarSinal_b;
end