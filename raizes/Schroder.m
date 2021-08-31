function [Raiz, Iter, Info] = Schroder(Func, DFunc,  m, x, Toler, IterMax)
    %x é o valor inicial e m eh a multiplicidade da raiz a ser encontrada
    fprintf("excluir a ultima linha inteira \n");
    fprintf("ta dando meio ruim nas 2 ultimas linhas (incluindo a excluida), mas o resultado ta certo (???) \n");
    fprintf("tirar o primeiro deltax e deslocar todos pra cima, o ultimo fica vazio \n");
    fprintf("k     x_k         Fx_k         DFx_k        deltax_k \n");
    Epsilon = 2^-52;
    deltax = 1 + Toler; Iter = 0;
    while 1 == 1
        Fx = f(Func, x); DFx = df(DFunc, x);
        fprintf("%d   %.5f   %e   %e   %e \n",Iter, x, Fx, DFx, deltax);
        if (abs(deltax) <= Toler && abs(Fx) <= Toler) || (abs(DFx) < Epsilon) || (Iter >= IterMax)
            break;
        end
        deltax = m*Fx/DFx; x = x - deltax;
        Iter = Iter + 1;
    end
    Raiz = x;
    if abs(deltax) <= Toler && abs(Fx) <= Toler
        Info = 0;
    else
        Info = 1;
    end
    fprintf("Raiz = %.5f\n",Raiz);
    fprintf("Iter = %d\n",Iter);
    fprintf("Info = %d\n",Info);
end

function [Fx] = f(Func, x)
    Fx = eval(Func);
end

function [Fx] = df(DFunc, x)
    Fx = eval(DFunc);
end