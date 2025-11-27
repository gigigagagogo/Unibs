% esercizio su matrice di Hilbert
n = 600;
A = hilb(n)

K = cond(A)

% costruico il termine noto b = A *[1;1...]
b = A*ones(n,1);

% stimo l'errore
err = K*eps/2

% risolvo il sistema lineare

x = meg(A, b)

err_reale = norm((x-ones(n,1))/norm(ones(n,1)))