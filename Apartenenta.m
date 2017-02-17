function y = Apartenenta(x, val1, val2)
% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea
%functiei membru in punctul x.
% Stim ca 0 <= x <= 1
y=0;
format free
if x >= val1 && y<=val2   %calculez valoarea functiei
  y = double(x/(val2-val1) + val1/(val1 - val2));   %am determinat coeficientii pentru care functia este continua
 else if x > val2             
  y = 1
end
end
