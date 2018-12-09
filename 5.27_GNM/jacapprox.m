function J=jacapprox(fun,x,h,params)
%jacobian数值化
if (nargin<3 || isempty(h))
    h=1e-6;
end

if (nargin<4)
    params={};
end

n=length(x);
f0=feval(fun,x,params{:});
J=zeros(length(f0),n);
if (length(h)==1)
    h=ones(size(x))*h;
end
I=eye(n);

for i=1:n
    J(:,i)=(feval(fun,x+h(i)*I(:,i),params{:})-...
            feval(fun,x-h(i)*I(:,i),params{:}))/(2*h(i));
end
