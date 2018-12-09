function [Y]=Newton(f,x0,epsilon,max_iter)
% x0 初始值
% eplison 最大容许误差
% max_iter 最大迭代次数

iter = 0;% 记录迭代次数
Y(iter+1) = x0;
% Newton迭代过程
while iter<max_iter 
    iter = iter+1;
    S = GetS(f,Y(iter));
    Y(iter+1) = Y(iter)-S;
    % 迭代终止条件2：找到满足精度要求的解
    if abs(Y(iter+1)-Y(iter))<epsilon
        disp('找到满足精度要求的解！')
        disp(['Y = ',num2str(Y(iter+1))]);
        disp(['迭代次数为',num2str(iter-1)]);
        break;
    end
end
end
