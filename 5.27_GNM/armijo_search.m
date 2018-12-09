function alpha = armijo_search(fun,x,p,params,alpha_min,c1) 
% armijo线搜索确定步长
for alpha = 2.^-(0:52)
    if alpha < alpha_min
        alpha = 0;
        return
    end

    if sufficient_decrease_cond(fun,x,params,p,alpha,c1)
        return
    end
end
end
function bool = sufficient_decrease_cond(fun,x,params,p,alpha,c1)
[r,J] = feval(fun,x,params{:});
f = 0.5 * (r' * r);
g_f = J' * r;
RHS = f + c1 * alpha .* (g_f' * p);
r = feval(fun,x+alpha*p,params{:});
LHS = 0.5 * (r' * r);
bool = LHS <= RHS;
end