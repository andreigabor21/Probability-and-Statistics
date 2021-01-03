clc
clear
close all

n=100;
p=0.03;

k=0:1:n;
bk=pdf('bino',k,n,p);

lambda=n*p;

nk=pdf('poiss',k,lambda);

figure(1)
hold on
plot(k,bk,'b*')
plot(k,nk,'ro')

[bk;nk]

figure(2)
hold on
plot(k,log10(abs(bk-nk)),'r*')