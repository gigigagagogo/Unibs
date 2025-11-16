function[s] = sommatoria(n)

s = 0

for i = 1: n
    s = s + 1/i; % Accumulate the sum
end

% disp("Il risultato della sommatoria è: "), s;

fprintf("La somma è: %8.6f\n", s);