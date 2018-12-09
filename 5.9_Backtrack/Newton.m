%参数初始化
x_0 = [-1.2;1];
rho = 0.5;
c = 0.5;
iter = 1;
tol = 1e-6;
max_iter = 200;
f_obj = zeros(max_iter, 1); %每次迭代返回的函数值
alpha = ones(max_iter, 1); % 计算的步长
dist = zeros(max_iter, 1); % 距离最小点的距离

x = x_0;
f_obj(iter) = RosenBrock(x_0);
while norm(Gradients(x,'g')) > tol && iter < max_iter
    dist(iter) = norm(x - [1; 1]);
    iter = iter + 1;
    % 判断海森矩阵是否正定，如果不正定，就执行最速下降法
    e = eig(Gradients(x,'G'), 'matrix');%得到特征值
    if det(e) < 0
        p = - Gradients(x,'g');
        print('海森矩阵不正定');
    else
        p = - Gradients(x,'G')^-1 *Gradients(x,'g');
    end
    [alpha(iter), f_obj(iter)] = backtrackingls(x, p, rho, c);
    x = x + alpha(iter) * p;
end
f_obj = f_obj(1:iter);
alpha = alpha(1:iter);
dist = dist(1:iter);


alpha
iter
x

i = 1:iter;

plot(i, log(dist), 'r');
axis([0 20 0 3]);
xlabel('Number of iterations');
ylabel('Euclidean norm of x_k - x*');
legend('Newton method');