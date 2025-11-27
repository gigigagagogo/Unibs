e = ones(20,1);
A = spdiags([e, 2*e, -3*e], [-4,0,10], 20, 20); % primo argomento i valori da mettere, secondo in quale diagonale, terzo numero righe, quarto numero colonne

spy(A)