function [X,k]=CGM(G,b,x0)
X(1,:)=x0;
g(1,:)=G*X(1,:)'-b';
p(1,:)=-g(1,:);
k=1;
epsilon=1e-6; %阈值
while norm(g(k,:))>epsilon
    d=G*p(k,:)';
    alpha=g(k,:)*g(k,:)'/((p(k,:))*d);
    X(k+1,:)=X(k,:)+alpha*p(k,:);
    g(k+1,:)=g(k,:)+alpha*d';
    belta=(g(k+1,:)*g(k+1,:)')/(g(k,:)*g(k,:)');
    p(k+1,:)=-g(k+1,:)+belta*p(k,:);
    k=k+1;
end

