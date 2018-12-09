function G=Hessian(f,x1,x2)
%hessian矩阵的计算
%x1 第一个变量的数值
%x1 第二个变量的数值
x1=x1;
x2=x2;

%对x1和x2进行一阶求导
f_x1=diff(f,'x1');
f_x2=diff(f,'x2'); 

%对变量进行二阶求导
f_x1_x1=diff(f_x1,'x1'); 
f_x1_x2=diff(f_x1,'x2'); 
f_x2_x1=diff(f_x2,'x1'); 
f_x2_x2=diff(f_x2,'x2'); 

%对求导格式进行赋值
f_x1_x1=subs(f_x1_x1);
f_x1_x2=subs(f_x1_x2);
f_x2_x1=subs(f_x2_x1);
f_x2_x2=subs(f_x2_x2);

%海森矩阵,便于后期矩阵运算
G=[f_x1_x1,f_x1_x2;f_x2_x1,f_x2_x2];