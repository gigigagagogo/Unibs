A = 3*eye(10);
A(1,:) = 1;
A(:,1) = 1;

figure(1);clf
spy(A); % nz indica il numero di numeri != 0

% eseguo la fattarizzazione su A
[L, U, P] = fattorizzazionelu(A, 1);

figure(2);clf
spy(L);

figure(3);clf
spy(U);

