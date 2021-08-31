function [Raiz, Iter, Info] = Halley(Func, DFunc, D2Func, x, Toler, IterMax)
    %x é o valor inicial
    fprintf("tirar o primeiro deltax e deslocar todos pra cima, o ultimo fica vazio \n");
    fprintf("tirar o ultimo D2F_x \n");
    fprintf("k     x_k         Fx_k         DFx_k       DF2x_k        deltax_k \n");
    deltax = 1 + Toler; Iter = 0;
    while 1 == 1
        Fx = f(Func,x); DFx = df(DFunc,x); D2Fx = d2f(D2Func,x);
        fprintf("%d   %.5f   %e   %e   %e   %e \n",Iter, x, Fx, DFx, D2Fx, deltax);
        if (abs(deltax) <= Toler && abs(Fx) <= Toler) || (Iter >= IterMax)
            break;
        end
        D2Fx = d2f(D2Func,x);
        deltax = 2*Fx*DFx/(2*DFx^2-Fx*D2Fx);
        x = x - deltax;
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

function [Fx] = f(Func,x)
    Fx = eval(Func);
end

function [Fx] = df(DFunc,x)
    Fx = eval(DFunc);
end

function [Fx] = d2f(D2Func,x)
    Fx = eval(D2Func);
end