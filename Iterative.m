function R = Iterative(nume, d, eps)

format free

% Functia care calculeaza matricea R folosind algoritmul iterativ.
% Intrari:
% -> nume: numele fisierului din care se citeste;
% -> d: coeficentul d, adica probabilitatea ca un anumit navigator sa
%continue navigarea (0.85 in cele mai multe cazuri)
% -> eps: eroarea care apare in algoritm.
% Iesiri:
% -> R: vectorul de PageRank-uri acordat pentru fiecare pagina.

f = fopen(nume,"rt"); 
n = fscanf(f, "%d", 1);
M = zeros(n,n); 
A = zeros(n,n);   %matrice de adiacenta
R = double(zeros(n,1));   %vectorul de page rank
v = double(ones(n,1));
for p = 1:n
m = fscanf(f, "%d", 2);    %citesc numarul de vecini ai nodului
vec = fscanf(f,"%d", m(2));  %citesc vecinii corespunzatori
A(p,vec(:)) = 1;   %construiesc matricea de adiacenta, cu 0 pe diagonala
A(p,p) = 0;
endfor
A = double(A);
for i = 1:n
  for j = 1:n
    if(A(j,i) == 1)
      M(i,j) = double(1/sum(A(j,:))); %valorile din matricea M 
                                      %conform algoritmului
      end
  endfor
endfor
R1(1:n,1) = double(1/n);
while(1)
R = d*M*R1 + ((1-d)/n)*v;     %constrium vectorul
if norm(R - R1) < eps      %conditie de oprire
  break;
end
R1 = R;
end
endfunction
