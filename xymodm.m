function [p] = xymodm(x,y,m)
% 实现了有限域模乘的计算 
% 采用的交错算法
% x，y都是有限域中的数，m是一个素数
% 输出x1=x*y (mod m)
% made by koala
% 2016,7,14
p=0;
n=32;
for i=n:-1:1
    p=2*p;
    tmp=bitget(x,i);
    j=tmp*y;
    p=p+j;
    if p >= m
        p=p-m;
    end
    if p >= m
        p=p-m;
    end
end
end


