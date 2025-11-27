A = [10 4 3 -2; 2 20 20 -1; 3 -6 4 3; -3 0 3 1];
b = [5; 24; 13; -2];

[L, U, P] = fattorizzazionelu(A, 1);

y = forsub(L, P*b);

x = backsub(U, y);
