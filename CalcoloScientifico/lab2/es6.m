
f = @ (x ,y , t ) sin ( sqrt ( x .^2+ y .^2) -2* t ); % function handle
[x , y ]= meshgrid ( -2* pi :.5:2* pi ); % genero la griglia
nframes =50; % numero di frame (istanti in tempo)
tt = linspace (0,2* pi , nframes ); % discretizzo l'intervallo temp
figure (1); clf

for n = 1: nframes % ciclo sugli istanti temporali
    t = tt (n); 
    z = f (x ,y , t);
    s = surf (x ,y , z); 
    s.EdgeColor = ' none ';
    axis ([ -2* pi 2* pi, -2* pi 2* pi, -2 2]);
    xlabel ('x'); ylabel ( 'y')
    title (['t = ', num2str(t)])
    Mv (n) = getframe ; 
    pause (0.01) % fermo per 0.01 sec
end

movie ( Mv ,4); % riproduco il movie 4 volte
