function x = Substituicoes_Sucessivas(n,L,c);
%ordem, matriz triangular inferior e vetor independente
%saida : x eh a solucao do sistema triangular inferior
x(1) = c(1)/L(1,1);
for i = 2 : n
    soma = 0;
    for j = 1 : i-1
        soma = soma + L(i,j)*x(j);
    end
    x(i) = (c(i) - soma)/L(i,i);
end
return;