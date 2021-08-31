function [Integral, Delta, Iter, Info] = GaussLegendre_Iterativo(a, b, Toler, IterMax)
Iter = 1; n1 = 5; n2 = 8;
[Int, Info] = GaussLegendre(a,b,n2)
while 1==1
    Iter = Iter + 1;
    n = n1 + n2; %sequencia fibonacci
    [Integral, Info] = GaussLegendre(a,b,n);
    if Integral ~= 0
        Delta = abs((Integral - Int)/Integral);
    else
        Delta = abs(Integral - Int);
    end
    if Delta <= Toler || Iter == IterMax
        break;
    end
    Int = Integral; n1 = n2; n2 = n;
end
if Delta <= Toler %teste convergencia
    Info = 0;
else
    Info = 1;
end
end