function [Raiz, Iter, Info] = Secante(Func, a, b, Toler, IterMax)
    fprintf("k     a_k       Fa_k      b_k        Fb_k      deltax_k       x_k         Fx_k \n");
    Epsilon = 2^-52; %Precisao da maqunina
    Fa = f(Func, a); Fb = f(Func, b);
    a0 = a; b0 = b; Iter = 0;
    while 1 == 1
        deltax = Fb * (b-a)/(Fb-Fa);
        x = b - deltax; Fx = f(Func, x);
        fprintf("%d   %.5f   %.5f   %.5f   %.5f   %e   %.5f   %e \n",Iter, a, Fa, b, Fb, deltax, x, Fx);
        if (abs(deltax) <= Toler && abs(Fx) <= Toler) || (abs(Fb - Fx) < Epsilon) || (Iter >= IterMax)
            break;
        end
        a = b; Fa = Fb;
        b = x; Fb = Fx;
        Iter = Iter + 1;
    end
    Raiz = x;
    if abs(deltax) <= Toler && abs(Fx) <= Toler
        if Raiz >= a0 && Raiz <= b0
            Info = 0;
        else
            Info = 2;
        end
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