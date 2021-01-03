% Let X have one of the following distributions: normal, Student, chi^2, Fischer.
% Compute the following:

% a)P(X <= 0) and P(X >= 0);

clc
clear
close all

%Normal:n
%Student:s
%Chi^2: c
%Fischer: f

alpha = input('alpha=');
beta = input('beta=');
type = input('Choose between Normal, Student, Chi^2, Fischer:','s');

switch type
  case 'n'  %for Normal distribution
    mu = input('mu=')
    sigma = input('sigma=')
    fprintf('a)\n')
    fprintf('P(X<=0)=%f \n', normcdf(0,mu,sigma))
    fprintf('P(X>=0)=%f \n', 1 - normcdf(0,mu,sigma))
    
    fprintf('b)\n')
    p1 = normcdf(1,mu,sigma) - normcdf(-1,mu,sigma);
    fprintf('P(-1<=X<=1)=%f \n', p1)
    p2 = 1 - p1;
    fprintf('P(X<=-1 or X >=1)=%f \n', p2)
    
    fprintf('c)\n')
    x_alpha = norminv(alpha,mu,sigma);
    fprintf('x_alpha is %f \n', x_alpha)
    
    fprintf('d)\n')
    x_beta = norminv(1-beta,mu,sigma);
    fprintf('x_alpha is %f \n', x_beta)
    

    x1=mu-3*sigma-1;
    x2=mu+3*sigma+1;
    x=x1:0.01:x2;

    figure(1)
    hold on
    box on
    plot(x,pdf('norm',x,mu,sigma))
    line([x_alpha,x_alpha],[0,pdf('norm',x_alpha,mu,sigma)],'Color', 'k','LineStyle',':')


    figure(2)
    hold on
    box on
    plot(x,cdf('norm',x,mu,sigma))
    line([x1,x2],[alpha,alpha],'Color','k')
    plot(x_alpha,alpha,'r*')
    line([x_alpha,x_alpha],[0,1],'Color', 'k','LineStyle',':')
    
    
  case 's'
    n = input('n=')
    fprintf('a)\n')
    fprintf('P(X<=0)=%f \n', tcdf(0,n))
    fprintf('P(X>=0)=%f \n', 1 - tcdf(0,n))
    
    fprintf('b)\n')
    p1 = tcdf(1,n) - tcdf(-1,n);
    fprintf('P(-1<=X<=1)=%f \n', p1)
    p2 = 1 - p1;
    fprintf('P(X<=-1 or X >=1)=%f \n', p2)
    
    fprintf('c)\n')
    x_alpha = tinv(alpha,n);
    fprintf('x_alpha is %f \n', x_alpha)
    
    fprintf('d)\n')
    x_beta = tinv(1-beta,n);
    fprintf('x_alpha is %f \n', x_beta)
    
  case 'c'
    n = input('n=')
    fprintf('a)\n')
    fprintf('P(X<=0)=%f \n', chi2cdf(0,n))
    fprintf('P(X>=0)=%f \n', 1 - chi2cdf(0,n))
    
    fprintf('b)\n')
    p1 = chi2cdf(1,n) - chi2cdf(-1,n);
    fprintf('P(-1<=X<=1)=%f \n', p1)
    p2 = 1 - p1;
    fprintf('P(X<=-1 or X >=1)=%f \n', p2)
    
    fprintf('c)\n')
    x_alpha = chi2inv(alpha,n);
    fprintf('x_alpha is %f \n', x_alpha)
    
    fprintf('d)\n')
    x_beta = chi2inv(1-beta,n);
    fprintf('x_alpha is %f \n', x_beta)
    
  case 'f'
    m = input('m=')
    n = input('n=')
    fprintf('a)\n')
    fprintf('P(X<=0)=%f \n', fcdf(0,m,n))
    fprintf('P(X>=0)=%f \n', 1 - fcdf(0,m,n))
    
    fprintf('b)\n')
    p1 = fcdf(1,m,n) - fcdf(-1,m,n);
    fprintf('P(-1<=X<=1)=%f \n', p1)
    p2 = 1 - p1;
    fprintf('P(X<=-1 or X >=1)=%f \n', p2)
    
    fprintf('c)\n')
    x_alpha = finv(alpha,m,n);
    fprintf('x_alpha is %f \n', x_alpha)
    
    fprintf('d)\n')
    x_beta = finv(1-beta,m,n);
    fprintf('x_alpha is %f \n', x_beta)
    
end