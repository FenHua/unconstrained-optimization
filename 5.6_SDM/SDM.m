function [X,Y,final_value]=SDM(f,e,a,b)
%最速下降法，其中f是函数，e为精度（终止条件），（a，b）起始点
x1=a;
x2=b;
x0=[x1 x2]';

%计算海森矩阵，用于步长的计算
Q=Hessian(f,x1,x2);

%对目标函数进行相应变量一阶导数求解
f_x1=diff(f,'x1');
f_x2=diff(f,'x2'); 
g=[f_x1 f_x2]'; %梯度代数矩阵
g1=subs(g); %把符号变量转为数值

d=-g1;%搜索方向

%迭代，迭代终止条件为一阶导数小于e（步长小于一定阈值）
n=1; %用来记录迭代次数
X=a;
Y=b;%记录点，便于画图
while (abs(norm(g1))>=e)
    n=n+1;
    t=(-d)'*d/((-d)'*Q*d); %精确搜索，二阶函数，所以二阶导固定
    x0=x0-t*g1; %更新搜索点位置
    %更新一节梯度
    value=x0;
    a=[1 0]*x0;
    b=[0 1]*x0;
    
    X(n)=a;
    Y(n)=b;
    
    x1=a;
    x2=b;
    g1=subs(g);
    d=-g1;
end;
final_value=vpa(value,4);
end
