clear all;
clc;
% 设计的简易的案例
alpha = 1; beta = 2; t = 0:0.1:1;
y = alpha .* exp(beta.*t) + rand(size(t));
% %案例测试
% t=[2,5,10,20,30,50];
% y=[0.9427,0.8616,0.7384,0.5362,0.3739,0.3096]

% 给出初始点 
x0 = [1.2;2];
% 残差函数参数的定义
params{1} = t(:); params{2} = y(:);

% 带线搜索的高斯牛顿法
[x,nIter,X,f,ALPHA] = gaussnewton(@residualF,x0,params);
fprintf('总共迭代次数：%d \n',nIter);

figure(1);
plot(x(1)*exp(x(2)*t)); 
hold on;
plot(y,'o');
leg = legend('Optimized','Experimental data','location','best');
set(leg,'interpreter','latex');
ylabel('d','interpreter','latex');
xlabel('Time','interpreter','latex');
