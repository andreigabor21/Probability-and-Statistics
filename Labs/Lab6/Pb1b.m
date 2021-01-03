clear all
clc

A=[7 7 4 5 9 9
4 12 8 1 8 7
3 13 2 1 17 7
12 5 6 2 1 13
14 10 2 4 9 11
3 5 12 6 10 7];

x=A(:)';
n=length(x);
fprintf('Volume %d \n',n)
med=mean(x);
fprintf('Sample mean %f\n',med);
sigma_s=std(x);
fprintf('Sample standard deviation %f\n',sigma_s)

% b. Without the assumption on sigma, does the data suggest that, on average, the number
% of files stored exceeds 5.5? (same significance level)

m0=5.5;

type=1; %right tailed test
alpha1=0.05; %significance level

fprintf('\n')
fprintf('SIGNIFICANCE LEVEL %f:\n',alpha1)
[h1,p1,ci1,tstat1]=ttest(x,m0,'alpha',alpha1,'tail','right');
t1=(med-m0)/sigma_s*sqrt(n);
fprintf('The value of the test statistic t is %f (given by ttest %f)\n',t1,tstat1.tstat)

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

RR_Ttest(alpha1,n,type);

if h1==1
  fprintf('The null hypothesis is rejected (t in RR)\n')
else
  fprintf('The null hypothesis is NOT rejected (t not in RR)\n')
end
if alpha1>=p1 
    fprintf('The null hypothesis is rejected\n')
else
    fprintf('The null hypothesis is NOT rejected\n')
end


alpha2=0.01; %significance level

fprintf('\n')
fprintf('SIGNIFICANCE LEVEL %f:\n',alpha2)
[h2,p2,ci2,tstat2]=ttest(x,m0,'alpha',alpha2,'tail','right');
t2=(med-m0)/sigma_s*sqrt(n);
fprintf('The value of the test statistic t is %f (given by ttest %f)\n',t2,tstat2.tstat)

RR_Ttest(alpha2,n,type);
if h2==1
  fprintf('The null hypothesis is rejected (t in RR)\n')
else
  fprintf('The null hypothesis is NOT rejected (t not in RR)\n')
end
if alpha2>=p2 
    fprintf('The null hypothesis is rejected\n')
else
    fprintf('The null hypothesis is NOT rejected\n')
end















