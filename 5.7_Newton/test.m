% Newton法求解目标函数的局部最小值
clc
clear all
syms x; %定义变量
f=9*x-4*log(x-7); %函数

x0=7.20;
epsilon=0.0001;
max_iter=100;
Y=Newton(f,x0,epsilon,max_iter);
% 迭代结果展示
plot(Y)
xlabel('t');ylabel('Y')