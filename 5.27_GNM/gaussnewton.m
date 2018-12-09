function [x,nIter,X,f,ALPHA] = gaussnewton(fun,x0,params,varargin)

input_params = inputParser;
addOptional(input_params,'convTol',1e-8,@(x)validateattributes(x, ...
    {'numeric'},{'positive'},{'nonempty'}))
addOptional(input_params,'maxIter',50, @(x)validateattributes(x,...
    {'numeric'},{'nonempty','integer','positive'}))
addOptional(input_params,'Method','Gauss-Newton', ...
    @(x)validateattributes(x,{'char'},{'nonempty'}))
addOptional(input_params,'SearchParams',nan, ...
    @(x)any(validatestring(x,plot_options)))
parse(input_params,varargin{:});

% 存储变量和参数
maxIter = input_params.Results.maxIter;
convTol = input_params.Results.convTol;
search_params = num2cell(input_params.Results.SearchParams);

% 采用armijo线性搜索策略

errmsg = ['Search parameters for armijo line-search', ...
    ' must be of length 2, that is [alpha_min, c1]'];
assert(length(search_params) == 2 || isnan(search_params{1}), ...
    errmsg);
if isnan(search_params{1})
    search_params{1} = 1e-3;
    search_params{2} = 1e-4;
end
search_fun = @(x,p) feval(@armijo_search,fun,x,p, ...
    params,search_params{:});

% 输出变量的初始化
nDim = length(x0);
X = zeros(nDim,maxIter);
f = zeros(1,maxIter);
ALPHA = zeros(1,maxIter);
x = x0;
alpha = 1;

% 迭代
for k = 1:maxIter
    [r,J] = feval(fun,x,params{:});

    X(:,k) = x;
    ALPHA(k) = alpha;
    f(k) = 0.5 * (r' * r);
    %对残差函数所得梯度进行验证
    g_f = J' * r;
    H = makeposdef(J'*J);
    p = -H\(g_f);
    
    % 停止条件
    if ~alpha
        nIter = k;
        return;
    end

    if norm(J*p) <= convTol*(1+norm(r))
        nIter = k;
        ALPHA = ALPHA(1:nIter);
        f = f(1:nIter);
        X = X(:,1:nIter);
        return;
    end
    % 线搜索，计算步长
    alpha = search_fun(x,p);
    x = x+alpha*p;
end
nIter = k;
end