%     1、用户A选定一条适合加密的椭圆曲线Ep(a,b)(如:y2=x3+ax+b)，并取椭圆曲线上一点，作为基点G。
% 　　2、用户A选择一个私有密钥k，并生成公开密钥K=kG。
% 　　3、用户A将Ep(a,b)和点K，G传给用户B。
% 　　4、用户B接到信息后 ，将待传输的明文编码到Ep(a,b)上一点M，并产生一个随机整数r（r<n）。
% 　　5、用户B计算点C1=M+rK；C2=rG。
% 　　6、用户B将C1、C2传给用户A。
% 　　7、用户A接到信息后，计算C1-kC2，结果就是点M。因为
%           C1-kC2=M+rK-k(rG)=M+rK-r(kG)=M
% 　　　再对点M进行解码就可以得到明文。
% 
%   　　密码学中，描述一条Fp上的椭圆曲线，常用到六个参量：
%        T=(p,a,b,G,n,h)。
% 　　（p 、a 、b 用来确定一条椭圆曲线，G为基点，n为点G的阶，h 是椭圆曲线上所有点的个数m与n相除的整数部分）
% 
% 　　这几个参量取值的选择，直接影响了加密的安全性。参量值一般要求满足以下几个条件：
% 
% 　　1、p 当然越大越安全，但越大，计算速度会变慢，200位左右可以满足一般安全要求；
% 　　2、p≠n×h；
% 　　3、pt≠1 (mod n)，1≤t<20；
% 　　4、4a3+27b2≠0 (mod p)；
% 　　5、n 为素数；
% 　　6、h≤4。
%----------------------------
%y^2=x^3+4^x+20 域k的特征不等于3也不等于2
% info=[1,8,7,9,4,5,3];
% disp('信息加密前info');
% disp(info);

p=313;%有限域p取值为素数
a=4;b=20;%满足ab!=0 & 4a^3+27b^2!=0
result=mod(4*a^3+27*b^2,p);
if result==0
    error('椭圆曲线参数选择不合理！');
end
disp('椭圆曲线参数a,b,p');
disp([a,b,p]);
gx=8;gy=10;%选择满足曲线y^2=x^3+a*x+b(mod p)的一个基点G(x,y)
disp('基点G');
disp([gx,gy]);
k=109;%k选取大素数为私钥 1< k < n (n为阶数)
disp('私钥k');
disp(k);
[KX,KY]=pointmul( k,gx,gy,a,b,p);
disp('公钥KX,KY');
disp([KX,KY]);
%disp(show);
% for i=1:29
%     y2=i^3+a*i+b;
%     if(y2>p)
%         disp('i=');
%         disp(i);
%         disp(mod(y2,p));
%     end
% end
mx=77;my=99;%明文
disp('明文mx,my');
disp([mx,my]);

r=10;%随机整数
%C1=M+rK；C2=rG。

[c1x,c1y]=pointmul(r,KX,KY,a,b,p);

%sprintf('c1x=%d,c1y=%d',c1x,c1y);
%disp([mx,my,c1x,c1y]);
[c1x,c1y]=pointadd( mx,my,c1x,c1y,a,b,p);

% disp(c1x);
% disp(c1y);
[c2x,c2y]=pointmul(r,gx,gy,a,b,p);
disp('密文c1,c2');
disp([c1x,c1y;c2x,c2y]);

% disp(c2x);
% disp(c2y);


%计算C1-kC2，结果就是点M
[tmpx,tmpy]=pointmul(k,c2x,c2y,a,b,p);
%disp([c1x,c1y,tmpx,-tmpy]);
[Mx,My]=pointadd(c1x,c1y,tmpx,mod(-tmpy,p),a,b,p);

disp('解密后明文Mx,My');
disp([Mx,My]);

