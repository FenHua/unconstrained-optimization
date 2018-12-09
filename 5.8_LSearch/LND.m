% 下面展示的是backtracking line search，速度很快
x0=[10,20];
miu=1;
rho = 0.5;
c = 0.5;
err = 1.0;
curve2 = [];
iter = 0;
maxIter = 300;
%牛顿法
x=x0;
y=FindV(x,miu);
% Newton迭代过程
while norm(Gradients(x,miu,'g')) > 1e-4 && iter < maxIter
    iter = iter+1;
    g = Gradients(x,miu,'g');
    G = Gradients(x,miu,'G');% 海森
    p=-(G^-1)*g;%牛顿下降方向
    [step, f0] = backtrackingls(x0,p,miu,rho, c);
    x=x+step*p'; %更新x值
    new_y = FindV(x,miu);
    err = y - new_y;
    y = new_y;
    [iter,err,y];  % 更新后产生的数据结果
    curve2(iter)=y; %当前迭代下的y值
end

% % 带回溯线搜索的Newton法
% while norm(Gradients(x,miu,'g')) > 1e-4 && iter < maxIter
%     iter = iter+1;
%     g = Gradients(x,miu,'g');
%     G = Gradients(x,miu,'G');% 海森
%     e = eig(G, 'matrix');%得到特征值
%     if det(e) < 0
%         p = -g;
%         print('海森矩阵不正定');
%     else
%         p=-(G^-1)*g;%牛顿下降方向
%     end
%     [step, f0] = backtrackingls(x0,p,miu,rho, c);
%     x=x+step*p'; %更新x值
%     new_y = FindV(x,miu);
%     err = y - new_y;
%     y = new_y;
%     curve2(iter)=y; %当前迭代下的y值
% end

plot(curve2, 'bo-')
legend('Newton with line search')
