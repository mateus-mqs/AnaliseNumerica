function x = Substituicoes_Retroativas(n,U,d)
%x eh a solucao do sistema triangular superior
%ordem, matriz triangular superior, vetor independente
x(n) = d(n)/U(n,n);
for i = n-1 : -1 : 1
    soma = 0;
    for j = i + 1 : n
        soma = soma + U(i,j)*x(j);
    end
    x(i) = (d(i)-soma)/U(i,i);
end
return;