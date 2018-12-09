function V=FindV(X,miu)
V=-9*X(1)-10*X(2)-miu*[log(100-X(1)-X(2))+log(X(1))+log(X(2))+log(50-X(1)+X(2))];%函数
end