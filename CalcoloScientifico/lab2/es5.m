[r, theta] = meshgrid(0:.1:2,0:.1:6*pi);
x = r.*cos(theta);
y = r.*sin(theta);
z = theta;

figure(1);

surf(x,y,z);