function R = Algebraic(nume, d)

% Functia care calculeaza vectorul PageRank folosind varianta algebrica de
%calcul.
% Intrari:
% -> nume: numele fisierului din care se citeste;
% -> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina
%urmatoare.
% Iesiri:
% -> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
format free
f = fopen(nume,"rt");
n = fscanf(f, "%d", 1); %citim numarul de noduri
M = zeros(n,n); A = zeros(n,n);
R = double(zeros(n,1));
v = double(ones(n,1));
for p = 1:n
m = fscanf(f, "%d", 2);   %citim vectorii si vecinii
vec = fscanf(f,"%d", m(2));
A(p,vec(:)) = 1; %matrice de adiacenta
A(p,p) = 0;      %0 pe diagonala
endfor
A = double(A);
for i = 1:n
  for j = 1:n
    if(A(j,i) == 1) %contruim matricea M conform enuntului
      M(i,j) = double(1/sum(A(j,:)));
    end
  endfor
endfor
M = double(M);
T = eye(n) - d*M;  %matricea a carei inversa trebuie aflat
T_inv = gram_schmidt(T);   %inversa matricei T
R = T_inv*((1-d)/n)*v;   %vectorul de pagerank
endfunction
