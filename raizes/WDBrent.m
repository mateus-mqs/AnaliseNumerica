function [Raiz, Iter, Info] = WDBrent(Func, a, b, Toler, IterMax)
    fprintf("k     a_k         c_k         b_k         Fb_k         z_k \n");
    Epsilon = 2^-52; %precisao maquina
    Fa = f(Func, a); Fb = f(Func, b);
    if Fa*Fb > 0
        Info = -1;
        return;
    end
    c = b; Fc = Fb;
    Iter = 0;
    while 1 == 1
        if Fb*Fc > 0
            c = a; Fc = Fa; d = b - a; e = d;
        end
        if abs(Fc) < abs(Fb)
            a = b; b = c; c = a; Fa = Fb; Fb = Fc; Fc = Fa;
        end
        tol = 2*Epsilon*abs(b) + 0.5*Toler;
        z = 0.5*(c - b);
        fprintf("%d   %.5f   %.5f   %.5f   %e   %e \n",Iter, a, c, b, Fb, z);
        if abs(z) <= tol || Fb == 0 || Iter >= IterMax
            break;
        end
        if abs(e) >= tol && abs(Fa) > abs(Fb)
            s = Fb/Fa;
            if a == c
                p = 2*z*s; q = 1 - s;
            else
                q = Fa/Fc; r = Fb/Fc;
                p = s*(2*z*q*(q-r)-(b-a)*(r-1));
                q = (q-1)*(r-1)*(s-1);
            end
            if p > 0
                q = -q;
            end
            p = abs(p);
            if 2*p < min(3*z*q-abs(tol*q),abs(e*q))
                e = d; d = p/q;
            else
                d = z; e = d;
            end
        else
            d = z; e = d;
        end
        a = b; Fa = Fb;
        if abs(d) > tol
            b = b + d;
        else
            if z < 0
                b = b+(-1)*tol;
            else
                b = b+tol;
            end
        end
        Fb = f(Func, b); Iter = Iter + 1;
    end
    Raiz = b;
    if abs(z) <= tol || Fb == 0
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