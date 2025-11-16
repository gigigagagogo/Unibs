function [s] = somma(a,b)
% somma: sommo 2 vettori colonna

n = length(a); % prende il max tra numero di righe e colonne dell'argomento

s = zeros(n,1); % inizializzo il vettore s a zero con n righe e 1 colonna

for j = 1: n
    s(j) = a(j) + b(j);
end

disp("La somma è: "), s;