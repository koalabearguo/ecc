function [ u,v,r,s ] =divgoto( u,v,r,s,p )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
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
end
