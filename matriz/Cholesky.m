function [A, Det,Info] = Cholesky(n, A) %n eh a ordem e A eh a matriz
%faot L escrito sobre A, determinante e informacao sobre A, sondo info = 0
Det = 1; Info = 0;
for j = 1:n
    soma = 0;
    for k = 1:j-1
        soma = soma + A(j,k)*A(j,k);
    end
    t = A(j,j)-soma;
    if t>0
        A(j,j)= sqrt(t); r = 1/A(j,j); Det = Det*t;
    else
        Info = j; printf("matriz não é definida positiva"); return;
    end
    for i = j+1:n
        soma = 0;
        for k = 1:j-1
            soma = soma+A(i,k)*A(j,k);
        end
        A(i,j) =(A(i,j)-soma)*r;
    end
end
return;