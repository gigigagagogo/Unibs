clear all
A = [-0.5 2;3 -0.5];
B = [1;1];
C = [1 1];
x0 = [0.5;0.5];
ueq = 3;
% Calcolo e classificazione punto di equilibrio

xeq = -inv(A)*B*ueq;
aval = eig(A) % autovalori di A -> il segno della parte reale mi permettere di studiare la stabilità

% Studio della raggiungibilità e della osservabilità

R = ctrb(A, B); % Matrice di raggiungibilità
O = obsv(A, C); % Matrice di osservabilità
rankR = rank(R); % Calcolo del rango della matrice di raggiungibilità
rankO = rank(O); % Calcolo del rango della matrice di osservabilità
