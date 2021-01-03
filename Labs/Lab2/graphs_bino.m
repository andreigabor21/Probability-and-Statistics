% Plot the graphs of the pdf and the cdf of a random variable X having a binomial
% distribution of parameters n and p (given by the user).

clc
clear
close all

n = input('Number of trials=');
p = input('Probability of success=');

X = 0:1:n;

px = binopdf(X,n,p);
fprintf('PDF binomial distribution\n')
disp([X;px])
fprintf('\n')

fx = binocdf(X,n,p);
fprintf('CDF binomial distribution\n')
disp([X;fx])

figure(1)
hold on
plot(X,px,'bo')
title('PDF')

figure(2)
hold on
plot(X,fx,'r*')
title('CDF')

figure(3)
hold on
stairs(fx)
title('CDF')