clc
clear 
close all

S=5000

p=0.35

X=zeros(1,S);
for i=1:S
  X(i)=(rand<p);
end


rel_fr_1=sum(X)/S
rel_fr_0=1-rel_fr_1
fprintf('BERNOULLI\n')
fprintf('Using rand\n')
disp([rel_fr_1,rel_fr_0])
fprintf('Bernoulli distribution\n')
disp([p,1-p])

fprintf('\n')
fprintf('BINOMIAL\n')

function [vu,VectRelFr]=Fr_rel(v)
  vu=unique(v);
  lu=length(vu);
  fr=zeros(1,lu);
  for j=1:lu
    fr(j)=sum(v==vu(j));
  end
  VectRelFr=fr/length(v);
end

n=3;
Y=zeros(1,S);
for i=1:S
  U=rand(1,n);
  Y(i)=sum(U<p);
end

[Yu,VectRelFr]=Fr_rel(Y);
Prob_bin=pdf('bino',Yu,n,p);
fprintf('Using rand\n')
disp([Yu;VectRelFr])
fprintf('Binomial distribution\n')
disp([Yu;Prob_bin])

fprintf('\n')

fprintf('GEOMETRIC\n')

Z=zeros(1,S);
for i=1:S
    Z(i)=0;
    while rand>=p
     Z(i)=Z(i)+1;
    end
end
    
[Zu,VectRelFrgeo]=Fr_rel(Z);
Prob_geo=pdf('geo',Zu,p);

disp([Zu' VectRelFrgeo' Prob_geo'])


fprintf('\n')
fprintf('PASCAL\n')
np=4;

W=zeros(1,S);
for i=1:S
    Wi=zeros(1,np);
    for j=1:np
        while rand>=p
        Wi(j)=Wi(j)+1;
        end
    end
    W(i)=sum(Wi);
end
    
[Wu,VectRelFrnbin]=Fr_rel(W);
Prob_nbin=nbinpdf(Wu,np,p);

disp([Wu' VectRelFrnbin' Prob_nbin'])







