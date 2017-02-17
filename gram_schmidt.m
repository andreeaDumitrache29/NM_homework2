function T_inv = gram_schmidt(A)

%algoritmul este modificat pentru a returna inversa matricei data ca parametru

	[m n] = size(A);
	Q = zeros(m,n);
	R = zeros(n);
	
	for j = 1 : n
		for i = 1 : j-1
			R(i,j) = Q(:,i)' * A(:,j);
		endfor
		
		s = zeros(m,1);
		for i = 1 : j-1
			s = s + R(i,j) * Q(:,i);
		endfor
		aux = A(:,j) - s;		
		
		R(j,j) = norm(aux,2);
		Q(:,j) = aux/R(j,j);
    
	endfor
In = eye(n); T_inv = zeros(n,n); V = zeros(n,1); v = ones(n,1);
for i = 1:n
  x = sst(R,Q'*In(:,i));  %aflu invesa coloana cu coloana rezolvand sistemul
  T_inv(:,i) = x;
endfor
endfunction
