clc
clear
close all

x1 = [20, 21.6, 21.6, 21.7, 22.4,22.4, 23.3,23.4, 24.5, 24.8];
x2 = [12.1, 12.2, 12.6, 14, 14.8, 14.8, 15.4, 17.7,19.6, 19.6];

alpha=0.05;

% a) Assuming sigma1 = sigma2, find a 100(1-alpha)% confidence interval for the difference of the
% true means.

function [li,ri]=ConfIntDifMeanVar(x1,x2,sigma1,sigma2,alpha)
  n1=length(x1);
  n2=length(x2);
  z=norminv(alpha/2,0,1);
  m1=mean(x1);
  m2=mean(x2);
  
  li=m1-m2+z*sqrt(sigma1^2/m1+sigma2^2/m2);
  ri=m1-m2-z*sqrt(sigma1^2/m1+sigma2^2/m2);
end

%in addition
fprintf('Confidence interval for difference of the means (standard deviations known)\n')
[li,ri]=ConfIntDifMeanVar(x1,x2,2,3,alpha);
fprintf('(%.4f,%.4f)\n',li,ri)

function [li,ri]=ConfIntDifMeanNotVarEq(x1,x2,alpha)
  n1=length(x1);
  n2=length(x2);
  t=tinv(alpha/2,n1+n2-2);
  m1=mean(x1);
  m2=mean(x2);
  v1=var(x1);
  v2=var(x2);
  sp=((n1-1)*v1+(n2-2)*v2)/(n1+n2-2);
  
  li=m1-m2+t*sp*sqrt(1/n1+1/n2);
  ri=m1-m2-t*sp*sqrt(1/n1+1/n2);
end

[li,ri]=ConfIntDifMeanNotVarEq(x1,x2,alpha);
fprintf('Cofidence Interval for difference of means (standard deviations unknown, equal)\n')
fprintf('(%.4f,%.4f)\n',li,ri)

% b) Assuming sigma1 != sigma2, find a 100(1-alpha)% confidence interval for the difference of the
% true means.

function [li,ri]=ConfIntDifMeanNotVarDif(x1,x2,alpha)

  n1=length(x1);
  n2=length(x2);

  mx1=mean(x1);
  mx2=mean(x2);
  vx1=var(x1);
  vx2=var(x2);

  c=(vx1/n1)/(vx1/n1+vx2/n2);
  n=1/(c^2/(n1-1)+(1-c)^2/(n2-1));

  t=tinv(1-alpha/2,n);
  rad=sqrt(vx1/n1+vx2/n2);


  li=mx1-mx2-t*rad;
  ri=mx1-mx2+t*rad;
end
  
[li,ri]=ConfIntDifMeanNotVarDif(x1,x2,alpha);
fprintf('Cofidence Interval for difference of means (standard deviations unknown, not equal)\n')
fprintf('(%.4f,%.4f)\n',li,ri)


% c) Find a 100(1-alpha)% confidence interval for the ratio of the variances.

function [li,ri]=ConfIntVarRatio(x1,x2,alpha)
  n1=length(x1);
  n2=length(x2);
  v1=var(x1);
  v2=var(x2);
  f1=finv(1-alpha/2,n1-1,n2-1);  
  f2=finv(alpha/2,n1-1,n2-1);
  
  li=1/f1*v1/v2;
  ri=1/f2*v1/v2;
end

[li,ri]=ConfIntVarRatio(x1,x2,alpha);
fprintf('Cofidence Interval for ratio of variances \n')
fprintf('(%.4f,%.4f)\n',li,ri)


fprintf('Cofidence Interval for ratio of standard deviations \n')
fprintf('(%.4f,%.4f)\n',sqrt(li),sqrt(ri))





