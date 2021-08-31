n = 0;
v = 0;
p = 0;
ii = 0;
x = 0;
y = 0;

[MatX, info] = matriz_explicativa(n,v,p,ii,x);
if info ~= 0
    return;
end
%Epsilon = 
[U, Sigma, V] = decomposicao_valor_singular(MatX);
if Sigma(p,p) < n * Episilon
    Iinfo