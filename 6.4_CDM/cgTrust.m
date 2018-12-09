function [s,type] = cgTrust(g,H,delta)
x1=0;
x2=0;
g=vpa(subs(g),4);
H=vpa(subs(H),4);
epsilon = 1e-5; %最小误差
n = 200; %迭代次数
x= zeros(n,2);% 迭代过程中产生的点集
r(1,:)=g;
p(1,:) =-g;
for k=1:n
    if (p(k,:)*H*p(k,:)'<=0)
        type = 3;
        %求边界点
        a = p(k,:)*p(k,:)';
        b = 2*x(k,:)*p(k,:)';
        c = x(k,:)*x(k,:)'-delta * delta;
        rho = b*b-4*a*c;
        s = x(k,:)+((-b+sqrt(rho))/(2*a))*p(k,:);
        return;
    end
    alpha=(r(k,:)*r(k,:)')/(p(k,:)*H*p(k,:)');
    x(k+1,:) =x(k,:)+alpha*p(k,:);
    if(norm(x(k+1,:))>=delta)
        type = 2;
        a = p(k,:)*p(k,:)';
        b = 2*x(k,:)*p(k,:)';
        c = x(k,:)*x(k,:)'-delta * delta;
        rho = b'*b-4*a'*c;
        s = x(k,:)+((-b+sqrt(rho))/(2*a))*p(k,:);
        return ;
    end
    r(k+1,:)=r(k,:)+alpha*p(k,:)*H;
    if(norm(r(k+1,:))<epsilon*norm(r(1,:)))
        s=x(k+1,:);
    end
    belta=r(k+1,:)*r(k+1,:)'/(r(k,:)*r(k,:)');
    p(k+1,:)=-r(k+1,:)+belta*p(k,:);
end
end
        
    
    
    
    
    
    
    
    
    
    
    
    
    
    