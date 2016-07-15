function [x1] = divf( x,p)
% 实现了有限域求逆的计算 
% x是有限域中的数，p是一个素数
% 输出x1=x^(-1)
% made by koala
% 2016,7,14
u=p;
v=x;
r=0;
s=1;
while 1
    if bitget(u,1)==0
        if bitget(r,1)==0
            r=bitshift(r,-1);
        else
            r=bitshift(r+p,-1);
        end
        r=mod(r,p);
        if bitget(u,1)==0
            u=bitshift(u,-1);
        else
            u=bitshift(u+p,-1);
        end
    end
    v=uint32(v);
    if bitget(v,1)==0
        if bitget(s,1)==0
            s=bitshift(s,-1);
        else
            s=bitshift(s+p,-1);
        end
        s=mod(s,p);
        if bitget(v,1)==0
            v=bitshift(v,-1);
        else
            v=bitshift(v+p,-1);
        end
    end
    if bitget(v,1)==1 && bitget(u,1)==1
        if u > v
            r=mod((r-s),p);
            u=u-v;     
        else
             s=mod((s-r),p);
             v=v-u;
        end
    end
    if u==1 || v==1
        break;
    end
end

if u==1
    x1=r;
else
    x1=s;
end

end

