function [Raiz, Iter, Info] = Bissecao(Func, a, b, Toler, IterMax)
Fa = f(Func, a); Fb = f(Func, b);
fprintf("k     a_k       Fa_k      b_k        Fb_k      deltax_k       x_k         Fx_k \n");
if Fa * Fb > 0
    Info = -1;
    return;
end
deltax = abs(b-a); Iter = 0;
while 1 == 1
    deltax = deltax / 2;
    x = (a+b)/2; Fx = f(Func, x);
    fprintf("%d   %.5f   %.5f   %.5f   %.5f   %e   %.5f   %e \n",Iter, a, Fa, b, Fb, deltax, x, Fx);
    if (deltax <= Toler && abs(Fx) <= Toler) || (Iter >= IterMax)
        break;
    end
    if Fa * Fx > 0
        a = x; Fa = Fx;
    else
        b = x; Fb = Fx;
    end
    Iter = Iter + 1;
end
Raiz = x;
if deltax <= Toler && abs(Fx) <= Toler
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