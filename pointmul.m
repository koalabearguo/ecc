function [ x,y ] = pointmul( k,px,py,a,b,p)
% 实现了椭圆曲线点乘(矢量乘)的计算 
% a,b,p均为椭圆曲线y^2=x^3+ax+b(mod p)的参数
% k是点的倍数，px,py是一个点的坐标
% 输出(x,y)=k*(px,py);
% made by koala
% 2016,7,14
n=32;
qx=0;
qy=0;
for i=1:n
    tmp=bitget(k,i);
    if tmp==1
        [qx,qy]=pointadd( qx,qy,px,py,a,b,p); 
    end
    [px,py]=pointadd( px,py,px,py,a,b,p); 
    
end

x=qx;
y=qy;
end

