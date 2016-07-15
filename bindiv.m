function [ x ] = bindiv( a,p )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
u=a;
v=p;
x1=0;
x2=0;

while u~=1 && v~=1
    while bitget(u,1)==0
        u=bitshift(u,-1);
        if bitget(x1,1)==0
            x1=bitshift(x1,-1);
        else
            x1=bitshift(x1+p,-1);
        end
    end
    
    while bitget(v,1)==0
        v=bitshift(v,-1);
        if bitget(x2,1)==0
            x2=bitshift(x2,-1);
        else
            x2=bitshift(x2+p,-1);
    end
    end
    
    if u>=v
        u=u-v;
        x1=x1-x2;
    else
        v=v-u;
        x2=x2-x1;  
    end
end
disp(x1);
disp(x2);
if u==1
    x=mod(x1,p);
else
    x=mod(x2,p);
end
end

