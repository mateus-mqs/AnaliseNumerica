%Conta o num de troca de sinais dos coef dos polinomios
function [Var] = TrocaSinais(n1, c) %n1 = grau do pol + 1
Var = 0; i = 1;
for j = 2 : n1
    if c(j) ~= 0
        if c(i) * c(j) < 0
            Var = Var + 1;
        end
        i = j;
    end
end
end