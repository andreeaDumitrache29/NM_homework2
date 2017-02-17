function R = Power(nume, d, eps)

% Functia care calculeaza vectorul PageRank folosind metoda puterii.
% Intrari:
% -> nume: numele fisierului din care se citeste;
% -> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina
%urmatoare.
% -> eps: eroarea care apare in algoritm.
% Iesiri:
% -> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
format free
f = fopen(nume,"rt");
n = fscanf(f, "%d", 1);
M = zeros(n,n); A = zeros(n,n);
R = double(zeros(n,1));
E = ones(n,n);
for p = 1:n
m = fscanf(f, "%d", 2);    %citesc nodul si vecinii
vec = fscanf(f,"%d", m(2));
A(p,vec(:)) = 1;    %construiesc matricea de adiacenta
A(p,p) = 0;
endfor
A = double(A);
for i = 1:n
  for j = 1:n
    if(A(j,i) == 1)
      M(i,j) = double(1/sum(A(j,:)));
    end
  endfor
endfor
P = d*M + ((1-d)/n)*E;   %matricea P al carei vector propriu trebuie aflat
y0 = ones(n,1);    %valoarea estimata initiala
y = putere_directa(P, y0, eps);   %aplicam MDP pentru a calcula vectorul propriu
R = y/norm(y,1);                  % si il normam pentru a avea suma elementelor 1
endfunction