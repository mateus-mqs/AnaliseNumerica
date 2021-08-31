function [Den, VetC, Info] = CoeficientesCotes(n)
VetC = zeros(1,n+1); Den = 0; % vetor com os coef de cotes edenominador na forma geral
d = [2 6 8 90 288 840 17280 28350 89600 598752];
c = [1 1 4 1 3 7 32 12 19 75 50 41 216 27 272 751 3577 1323 2989 989 5888 -928 10496 -4540 2857 15741 1080 19344 5778 16067 106300 -48525 272400 -260550 427368];
Info = 0;

%algoritmo
if n<1 || n>10
    Info = -1;
    return;
end
Info = 0; Den = d(n);
p = fix(n * (n + 2)/4 + rem(n,2)); %indica inicio dos coef da formula
n12 = fix((n+1)/2)-1;
for i = 0 : n12
    VetC(i+1) = c(p+i);
    VetC(n+1-i) = c(p+i);
end
if rem(n,2) == 0
    VetC(n/2 + 1) = c(p + n/2);
end
end