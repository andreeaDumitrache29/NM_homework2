function y = Putere_directa(A, y0, eps)

%functia calculeaza vectorul propriu dominant al matricei A
	while (1)
		y = A*y0; %valoarea vectorului propriu la pasul curent
		if norm(y - y0)<eps
			break;          %conditia dde oprire
		endif
    	y0 = y;   %acutalizam valoarea vectorului propriu pentru pasul urmator
	endwhile
endfunction
