%n = 0; % numero de pontos
%v = 0; %numero de variaveis explicativas
%p = 0; %numero de parametros do modelo
%ii = 0; %indicacao de intersecao
%x = 0; %variaveis explicativas originais
%y = 0; %variaveis respostas
function [b, r2, s2, AlCc, info] = regressao_linear_EN(n,v,p,ii,x,y)
[MatX, info] = matriz_explicativa(n,v,p,ii,x);
if info ~= 0
    return;
end
%montagem das equacoes normais
for i = 1:p
    for j = 1:i
        soma = 0;
        for k = 1 : n
            soma = soma + MatX(k,i)*MatX(k,j);
        end
        Sxx(i,j) = soma; %matriz dos coeficientes
        if i ~= j
            Sxx(j,i) = soma;
        end
    end
    soma = 0;
    for k = 1 : n
        soma = soma + MatX(k,i)*y(k);
    end
    Sxy(i) = soma; %vetor dos teros independentes
end
[L, Det, info] = Cholesky(p,Sxx);
if info ~= 0 
    info = 4;
    return;
end
t = Substituicoes_Sucessivas(p,L,Sxy);
for i = 1 : p
    for j = 1 : i
        U = L'; % U = transposta de L
    end
end
%estimadores de quadrados minios dos parametros da equacao de regressao
b = Substituicoes_Retroativas(p,U,t);
info = 0; S = 0; Sy2 = 0;
for i = 1 : n
    u = 0;
    for j = 1 : p
        u = u + MatX(i,j)*b(j);
    end
    S = S + (y(i) - u)^2;
    Sy2 = Sy2 + y(i)^2;
end
%coeficiente de determinacao
if ii == 1
    r2 = 1 - S/(Sy2-Sxy(1)^2/n);
else
    r2 = 1 - S/Sy2;
end
s2 = S/(n-p); %quadrado medio residual
AlCc = n*log(S/n) + 2*p*n/(n-p-1); %criterio de informacao de Akaike
