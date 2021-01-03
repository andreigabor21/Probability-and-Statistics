clear all
clc
close all

x=[22.4, 21.7, 24.5, 23.4, 21.6, 23.3, 22.4, 21.6, 24.8, 20.0];

y=[17.7, 14.8, 19.6, 19.6,12.1,14.8,15.4, 12.6,14.0, 12.2];

n1=length(x);
n2=length(y);
mx=mean(x);
my=mean(y);
sx=var(x);
sy=var(y);

alpha=0.05;

% a. At the 5% significance level, is there evidence that the variances of the two
% populations are equal?

typea=0; %two-tailed test
fprintf('a)\n')
fprintf('SIGNIFICANCE LEVEL %f:\n',alpha)
[ha,pa,cia,valstata]=vartest2(x,y,'alpha',alpha,'tail','both');
f=sx/sy;
fprintf('The values of the test statistic f is %f (given by vartest2 %f)\n',f,valstata.fstat)

function RR_Ftest(alpha,n1,n2,type)
 switch type
     case -1
         l=-Inf;
         r=finv(alpha,n1-1,n2-1);
         fprintf('The rejection region, RR, is (%f, %f)\n',l,r)
     case 0
         r=finv(1-alpha/2,n1-1,n2-1);
         l=finv(alpha/2,n1-1,n2-1);
         fprintf('The rejection region, RR, is (%f,%f)U(%f, %f)\n',-Inf,l,r,Inf)
     case 1
         l=finv(1-alpha,n1-1,n2-1);
         r=Inf;
         fprintf('The rejection region, RR, is (%f, %f)\n',l,r)
 endswitch
end

RR_Ftest(alpha,n1,n2,typea);
if ha==1
    fprintf('The null hypothesis is rejected (f in RR), i.e. the variances seem to be different\n')
else
    fprintf('The null hypothesis is NOT rejected (f not in RR), i.e. the variances seem to be equal\n')
end    
fprintf('The P-value of the test is %f\n',pa)
if alpha>=pa
    fprintf('The null hypothesis is rejected, i.e. the variances seem to be different\n')
else
    fprintf('The null hypothesis is NOT rejected, i.e. the variances seem to be equal\n')
end


% b. Based on the result in part a., at the same significance level, does gas mileage
% seem to be higher, on average, when premium gasoline is used?

typeb=1; %right tailed
if ha==0
  vartype='equal';
  n=n1+n2-2;
  t=(mx-my)/sqrt((n1-1)*sx+(n2-1)*sy)*sqrt((n1+n2-2)/(1/n1+1/n2));
else
  vartype='unequal';
  x=(sx/n1)/(sx/n1+sy/n2);
  n=ceil(1/(c^2/(n1-1)+(1-c)^2/(n2-1)));
  t=(mx-my)/sqrt(sx/n1+sy/n2);
end

fprintf('\n n) \n')
[hb,pb,cib,valstatb]=ttest2(x,y,'alpha',alpha,'tail','right','vartype',vartype);
fprintf('The value of the test statistic t is %f (given by ttest2 %f)\n',t,valstatb.tstat)

function RR_Ttest(alpha,n,type)
  switch type
    case -1
      l=-Inf;
      r=tinv(alpha,n-1);
      fprintf('The rejection region, RR, is (%f, %f)\n',l,r)
    case 0
      r=tinv(1-alpha/2,n-1);
      l=-r;
      fprintf('The rejection region, RR, is (%f, %f)U(%f, %f)\n',-Inf,l,r,Inf)
    case 1
      l=tinv(1-alpha,n-1);
      r=Inf;
      fprintf('The rejection region, RR, is (%f, %f)\n',l,r) 
  endswitch
end

RR_Ttest(alpha,n,typeb);

if hb==1
    fprintf('The null hypothesis is rejected (t in RR), i.e.  gas mileage IS higher with premium gasoline \n')
else
    fprintf('The null hypothesis is NOT rejected (t not in RR), i.e.  gas mileage IS NOT higher with premium gasoline\n')
end    
fprintf('The P-value of the test is %.10f\n',pb)
if alpha>=pb
    fprintf('The null hypothesis is rejected, i.e.gas mileage IS higher with premium gasoline\n')
else
    fprintf('The null hypothesis is NOT rejected, i.e. gas mileage IS NOT higher with premium gasoline\n')
end
























