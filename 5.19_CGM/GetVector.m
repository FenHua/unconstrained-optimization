function [G,b]=GetVector(n)
for i=1:n
    for j=1:n
        G(i,j)=1/(i+j-1);
    end
    b(i)=1;
end
