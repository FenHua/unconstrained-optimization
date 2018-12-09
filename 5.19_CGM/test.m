% 共轭梯度迭代法
clc
clear all
N=[5,8,12,20];
for i=1:4
    [G,b]=GetVector(N(i));
    x=zeros(1,N(i));
    [Y,k]=CGM(G,b,x);
    [N(i),k]
end