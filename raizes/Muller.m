function [Raiz, Iter, Info] = Muller(Func, a, b, Toler, IterMax)
    fprintf("k     a_k         x_k         b_k         v_k         x_k+1        Fx_k+1 \n");
    Fa = f(Func, a); Fb = f(Func, b);
    x = (a+b)/2; Fx = f(Func, x);
    Iter = 0;
    while 1 == 1
        ha = x - a; hb = b - x; Da = (Fa - Fx)/ha; Db = (Fb - Fx)/hb;
        AA = (Da + Db)/(ha + hb); BB = (ha*Db - hb*Da)/(ha+hb);
        CC = Fx; Delta = sqrt(BB^2 - 4*AA*CC);
        if abs(BB+Delta) > abs(BB - Delta)
            v = -2*CC/(BB + Delta);
        else
            v = -2*CC/(BB - Delta);
        end
        t = x; Ft = Fx; x = x + v; Fx = f(Func, x);
        fprintf("%d   %.5f   %.5f   %.5f   %e   %.5f   %e \n",Iter, a, t, b, v, x, Fx);
        if (abs(v) <= Toler && abs(Fx) <= Toler) || (Iter >= IterMax)
            break;
        end
        a = b; Fa = Fb;
        b = t; Fb = Ft;
        Iter = Iter + 1;
    end
    Raiz = x;
    if abs(v) <= Toler && abs(Fx) <= Toler
        Info = 0;
    else
        Info = 1;
    end
    fprintf("Raiz = %.5f\n",Raiz);
    fprintf("Iter = %d\n",Iter);
    fprintf("Info = %d\n",Info);
end

function [Fx] = f(Func, x)
    Fx = eval(Func); %funcao vem aqui
end