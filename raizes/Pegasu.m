function [Raiz, Iter, Info] = Pegasu(Func, a, b, Toler, IterMax)
    fprintf("k     a_k       Fa_k      b_k        Fb_k      deltax_k       x_k         Fx_k \n");
    Fa = f(Func,a); Fb = f(Func,b);
    Iter = 0;
    while 1 == 1
        deltax = Fb * (b-a)/(Fb - Fa);
        x = b - deltax; Fx = f(x);
        fprintf("%d   %.5f   %.5f   %.5f   %.5f   %e   %.5f   %e \n",Iter, a, Fa, b, Fb, deltax, x, Fx);
        if (abs(deltax) <= Toler && abs(Fx) <= Toler) || (Iter >= IterMax)
            break;
        end
        if Fb * Fx < 0
            a = b; Fa = Fb;
        else
            Fa = Fa*Fb/(Fb+Fx);
        end
        b = x; Fb = Fx;
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
    Fx = eval(Func); %funcao vem aqui
end