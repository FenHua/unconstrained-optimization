function [r,J] = residualF(x,t,y)
% 残差函数的定义以及jacobian矩阵的计算
r = (x(1).*exp(x(2).*t) - y);
% % 案例测试
% r=(1-x(1).*t/x(2)).^(1/(x(1)*96.05) -1);
if nargout > 1
    % Analytic Jacobian
    %J = [exp(x(2).*t),x(1).*exp(x(2).*t).*t];
    % Numeric Jacobian
    J = jacapprox(@residualF,x,1e-6,{t,y});
end
