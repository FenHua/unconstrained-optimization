% 下面展示的是backtracking line search，速度很快
clc
clear
n=1;
for i=1:n
    syms X(i);
end
f=symsum(((1-X(2*i-1))^2+10*(X(2*i)-X(2*i-1)^2)^2),1,n)
% syms x1 x2;%定义变量
% X=[x1,x2];
% f=(1-X(1))^2 + 10*(X(2)-X(1)^2)^2;%函数
g=jacobian(f);
G=hessian(f);
[s,type] = cgTrust(g,G,1)