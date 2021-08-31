%n = 0; %numero de pontos
%y = 0; %numero de variaveis explicativas
%p = 0; %numero de parametros do modelo
%ii = 0; %indicacao de intersecao
%x = 0; %submatriz com variaveis explicativas originais
% v = 1 e v <= p para polinomial
% v > 1 e v + ii = p para multipla
function [MatX,info] = matriz_explicativa(n,v,p,ii,x);
MatX = zeros(n,p);
if p < v
    info = 1;
    return;
end
if ii ~= 1 && ii~=0
    info = 2;
    return;
end
if (v ~= 1 || v > p) && (v <= 1 || v + ii ~= p)
    info = 3;
    return;
end
info = 0;
if v == 1 %regressao polinomial
    if ii ~= 0
        for i = 1 : n
            MatX(i,1) = 1;
        end
    else %modelo sem intersecao
        for i = 1 : n
            MatX(i,1) = x(i,1);
        end
    end
    %completa a matrix MatX com potencias do vetor coluna x(i,1)
    for j = 2:p
        j1 = j - 1;
        for i = 1: n
            MatX(i,j) = MatX(i,j1) * x(i,1);
        end
    end
else %regressao linear multipla
    if ii ~= 0 %modelo com intersecao
        for i = 1 : n
            MatX(i,1) = 1;
        end
    end
    %copia a submatriz x na matriz MatX
    m = 0;
    for j = ii + 1 : p
        m = m + 1;
        for i = 1 : n
            MatX(i,j) = x(i,m);
        end
    end
end
disp(MatX);
return;
