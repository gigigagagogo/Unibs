a = eig(B);

p = 1;

for i = 1: 100
    p = p * a(i);
    fprintf("%d. Il prodotto è: %24.16e\n",i, p);
end

