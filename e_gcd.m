function [x,y]= e_gcd(e,r)
%e_gcd Summary of this function goes here
%   Detailed explanation goes here
if(e>r)
    error('the fist argument should be lower then the second.');
    return;
end
[y,x2]=e_gcd_all(e,r,0);
if x2>0
    x=x2;
else
    [y,x]=e_gcd_all(e,r,1);
end
end

function [x,y]= e_gcd_all(e,r,b)

if e==b
     x=0;
     y=1;
  return;
end

[x1,y1]=e_gcd_all(mod(r,e),e,b);

x=y1;

y=(1-r*y1)/e;

end

