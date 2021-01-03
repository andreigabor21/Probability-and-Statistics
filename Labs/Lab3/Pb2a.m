clc
clear
close all

n=100;
p=0.57;

k=0:1:n;
bk=pdf('bino',k,n,p);

mu=n*p;
sigma=sqrt(n*p*(1-p));

nk=pdf('norm',k,mu,sigma);

figure(1)
hold on
plot(k,bk,'b*')
plot(k,nk,'ro')

[bk;nk]

figure(2)
hold on
plot(k,log10(abs(bk-nk)),'r*')