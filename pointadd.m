function [ x3,y3 ] = pointadd( x1,y1,x2,y2,a,b,p)
% 实现了椭圆曲线点加和倍点的计算 
% a,b,p均为椭圆曲线y^2=x^3+ax+b(mod p)的参数
% x1,y1是第一个点的坐标，x2,y2是第二个点的坐标
% 输出(x3,y3)=(x1,y1)+(x2,y2);
% made by koala
% 2016,7,14
if x1==0 && y1==0
    x3=x2;
    y3=y2;
    return;
end
if x2==0 && y2==0
    x3=x1;
    y3=y1;
    return;
end
if x1==x2 && (y1+y2==p)%y1==-y2 || 
    x3=0;
    y3=0;
    return;
end
 
if x1==x2 && y1==y2 && y1~=0
   t1= xymodm(2,y1,p);
   
   tmp=divf(t1,p);
   t2=xymodm(3,x1,p);
   
   t2=xymodm(t2,x1,p);
   t2=mod(t2+a,p);
   
   tmp=xymodm(tmp,t2,p);
   t3=xymodm(tmp,tmp,p);
   t4=xymodm(2,x1,p);
   x3=mod(t3-t4,p);
   t5=xymodm(tmp,x1-x3,p);
   y3=mod(t5-y1,p);
   
else
    tmp=mod(x2-x1,p);
    tmp=divf(tmp,p);
    abtmp=mod(y2-y1,p);
    t1=xymodm(tmp,abtmp,p);
    var=t1;
    t1=xymodm(t1,t1,p);
    x3=mod(t1-x1-x2,p);
    t2=var;
    tmp=mod(x1-x3,p);
    t2=xymodm(t2,tmp,p);
    y3=mod(t2-y1,p);   
end


end

