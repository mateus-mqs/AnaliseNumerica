function [Raiz, Zero, Iter, Info] = PegasuRaizMultipla(Func, DFunc, a, b, Toler, IterMax)
    %zero é f(raiz)
    fprintf("k     a_k       Ga_k      b_k        Gb_k      deltax_k       x_k         Gx_k \n");
    Epsilon = 2^-52;
    Fa = f(Func,a); DFa = df(DFunc,a);
    Fb = f(Func,b); DFb = df(DFunc,b);
    if abs(DFa) < Epsilon || abs(DFb) < Epsilon
        Info = 2;
        return;
    end
    Ga = Fa/DFa; Gb = Fb/DFb; Gx = 1 + Toler; Iter = 0;
    while 1 == 1
        deltax = Gb * (b-a)/(Gb - Ga);
        x = b - deltax; Fx = f(Func,x); DFx = df(DFunc,x);
        fprintf("%d   %.5f   %.5f   %.5f   %.5f   %e   %.5f   %e \n",Iter, a, Ga, b, Gb, deltax, x, Gx);
        if (abs(deltax) <= Toler && abs(Gx) <= Toler) || abs(DFx) < Epsilon || Iter >= IterMax
            break;
        end
        Gx = Fx/DFx;
        if Gb * Gx < 0
            a = b; Ga = Gb;
        else
            Ga = Ga*Gb/(Gb+Gx);
        end
        b = x; Gb = Gx;
        Iter = Iter + 1;
    end
    Raiz = x; Zero = f(Func,Raiz);
    if abs(deltax) <= Toler && abs(Gx) <= Toler
        Info = 0;
    else
         if abs(DFx) >= Epsilon
             Info = 1;
         else
             Info = 2;
         end
    end
    fprintf("Raiz = %.5f      f(Raiz) = %e \n",Raiz,Zero);
    fprintf("Iter = %d\n",Iter);
    fprintf("Info = %d\n",Info);
end

function [Fx] = f(Func,x)
    Fx = eval(DFunc);
end

function [DFx] = df(DFunc,x)
    DFx = eval(DFunc);
end