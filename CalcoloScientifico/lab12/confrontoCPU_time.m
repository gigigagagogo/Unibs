tic 
x = rand(479,1);
for i = 1: 1000
    y = A*x;
end
toc

tic
for i = 1: 1000
       z = W*x;
end
toc