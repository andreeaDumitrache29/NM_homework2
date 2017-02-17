function [R1 R2 R3] = PageRank(nume, d, eps)
% Calculeaza indicii PageRank pentru cele 3 cerinte
% Scrie fisierul de iesire nume.out

out_file = strcat(nume,".out");   %fisierul de output
f1 = fopen(out_file,"wt");
f = fopen(nume,"rt");
n = fscanf(f, "%d", 1);
fprintf(f1, "%d\n", n);
fprintf(f1,"\n");

R1 = Iterative(nume, d, eps);   %vectorii dati de cele 3 metode
R2_init = Algebraic(nume, d);
R3 = Power(nume, d, eps);

R2 = R2_init;
Pr = R2;  %vectorul ce urmeaza a fi ordonat

fprintf(f1,"%d\n",R1);  %scriu cei 3 vectori in fisier
fprintf(f1,"\n");
fprintf(f1,"%d\n",R2);
fprintf(f1,"\n");
fprintf(f1,"%d\n",R3);
fprintf(f1,"\n");

for p = 1:n
m = fscanf(f, "%d", 2);
vec = fscanf(f,"%d", m(2));   %citesc pentru a ajunge la sfarsitul fisierului
endfor
val1 = fscanf(f,"%f",1);    %valorile pentru functia de apartenenta
val2 = fscanf(f,"%f", 1);

for i = 1:n-1
  for j = i:n
    if Pr(i) < Pr(j)   %ordonez vectorul Pr folosind bubble sort
        swap = Pr(i);
        Pr(i) = Pr(j);
        Pr(j) = swap;
     end
  endfor
endfor

for i = 1:n
fprintf(f1,"%d ",i);   %indicele din vectorul sortat
y = find(R2 == Pr(i));   %caut valoarea in vectorul vechi
  y = [y; 1];            %retin si printez indicele din vectorul vechi
  y = y(1,1);            
  fprintf(f1,"%d ", y);   %valoarea functiei de apartenenta
  fprintf(f1,"%d\n",Apartenenta(Pr(i), val1, val2));  
  R2(y) = -inf;     %pentru a afisa indicii corecti in caz de valori duplicate
endfor
fclose(f1);
endfunction
