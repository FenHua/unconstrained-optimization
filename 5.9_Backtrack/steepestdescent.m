% 初始化参数
x_0 = [-1.2; 1];
rho = 0.5;
c = 0.5;
iter = 1;
tol = 1e-8;
max_iter = 300;
f_obj = zeros(max_iter, 1); %每次迭代返回的函数值
alpha = ones(max_iter, 1); % 计算的步长
dist = zeros(max_iter, 1); % 距离最小点的距离
x = x_0;
f_obj(iter) = RosenBrock(x_0);
while norm(Gradients(x,'g')) > tol && iter < max_iter
    dist(iter) = norm(x - [1; 1]);
    iter = iter + 1;
    p = - Gradients(x,'g');
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

plot(i, dist);
axis([0 500 0 3]);
hold on;
xlabel('Number of iterations');
ylabel('Euclidean norm of x_k - x*');
legend('steepestdescent method');