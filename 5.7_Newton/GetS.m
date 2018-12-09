function S=GetS(f,X)
% 求S值,此处只讨论一元函数
% X 变量的数值
x=X;

%对x1进行一阶求导
f_x=diff(f,'x');

%对x进行二阶求导
f_x_x=diff(f_x,'x'); 

%对求导格式进行赋值
f_x=subs(f_x);
f_x_x=subs(f_x_x);

%计算S值，牛顿法二阶导存在
S=f_x/f_x_x;
end