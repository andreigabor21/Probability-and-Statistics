clc 
clear
close all

x= [7, 7, 4, 5, 9, 9, 4, 12, 8, 1, 8, 7, 3, 13, 2, 1, 17, 7,...
   12, 5, 6, 2, 1, 13, 14, 10, 2, 4, 9, 11, 3, 5, 12, 6, 10, 7];
   
% a) Assuming that past experience indicates that sigma = 5, find a 100(1-alpha)% confidence
% interval for the average number of files stored.

alpha=0.05; %significance level, 1-alpha confidence level
sigma=5;

function [li,ri]=ConfIntMeanVarKnown(x,alpha,sigma)
  z=norminv(1-alpha/2,0,1);
  mx=mean(x);
  n=length(x);
  
  li=mx-sigma/sqrt(n)*z;
  ri=mx+sigma/sqrt(n)*z;
end

fprintf('Confidence interval for the mean (standard deviation known):\n')
[li,ri]=ConfIntMeanVarKnown(x,alpha,sigma);
fprintf('(%f,%f)\n',li,ri)

% b) Assuming nothing is known about sigma, find a 100(1-alpha)% confidence interval for
% the average number of files stored.

function [li,ri]=ConfIntMeanVarUnknown(x,alpha)
  n=length(x);
  z=tinv(alpha/2,n-1);
  mx=mean(x);
  s=std(x);
  
  li=mx+z*s/sqrt(n);
  ri=mx-z*s/sqrt(n);
end

fprintf('Confidence interval for the mean (standard deviation unknown):\n')
[li,ri]=ConfIntMeanVarUnknown(x,alpha);
fprintf('(%f,%f)\n',li,ri)

% c) Assuming the number of files stored are approximately normally distributed, find
% 100(1-alpha)% confidence intervals for the variance and for the standard deviation.


function [li,ri]=ConfIntVar(x,alpha)
  n=length(x);
  q1=chi2inv(1-alpha/2,n-1);
  q2=chi2inv(alpha/2,n-1);
  s2=var(x);
  
  li=(n-1)*s2/q1;
  ri=(n-1)*s2/q2;
end

fprintf('Confidence interval for the variance:\n')
[li,ri]=ConfIntVar(x,alpha);
fprintf('(%f,%f)\n',li,ri)

fprintf('Confidence interval for the standard deviation:\n')
fprintf('(%f,%f)\n',sqrt(li),sqrt(ri))
