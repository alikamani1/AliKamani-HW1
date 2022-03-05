function [theta] = Num_sol(x)
dx = x(2)-x(1);
h = 25;
L = 1;
k = 237;
Bi = h*L/k;
A = 0.0525;
P = 1;
Q = -(2+(Bi*L*P*dx^2)/A);
n = length(x);
A1 = [1 zeros(1,n-1)];
A3 = [zeros(1,n-2) -1 1+Bi*dx];
for i = 1:n-2
    A2(i,[i i+1 i+2]) = sparse([1 Q 1]);
end
A = [A1;A2;A3];
B = sparse([1;zeros(n-1,1)]);
theta = inv(A)*B;
end