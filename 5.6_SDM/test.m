clc
clear
syms x1 x2;%定义变量
X=[x1,x2];

f=5*X(1)^2+5*X(2)^2-9*X(1)*X(2)+4*X(1)-15*X(2)-13;%函数


[X,Y,final_value]=SDM(f,0.001,0,0);

%画图
figure
x1=-0.5:0.05:5;
y1=x1;
[X1 Y1]=meshgrid(x1,y1);
nn=length(x1);
Z1=zeros(nn,nn);
for i=1:nn
    for j=1:nn
        x1=X1(i,j);
        x2=Y1(i,j);
        Z1(i,j)=subs(f);
    end
end
contour(X1,Y1,Z1)
hold on
plot(X,Y,'o-','linewidth',1)
