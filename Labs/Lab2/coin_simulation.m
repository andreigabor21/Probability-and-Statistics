%A coin is tossed 3 times. Let X denote the number of heads that appear.

n = 3;
p = 0.5;

% a) Find the probability distribution function of X. What type of distribution does
% X have?

fprintf('a)\n')
x = 0:1:3;
px = binopdf(x,n,p);
fprintf('PDF\n')
disp([x;px])

% b) Find the cumulative distribution function of X, F_X.

fprintf('b)\n')
x = 0:1:3;
fx = binocdf(x,n,p);
fprintf('CDF\n')
disp([x;fx])

% c) Find P(X = 0) and P(X != 1).

fprintf('c)\n')
equal = binopdf(0,n,p)
nequal = 1 - binocdf(1,n,p)

% d) Find P(X <= 2), P(X < 2).

fprintf('d)\n')
le = binocdf(2,n,p)
l = binocdf(1,n,p)

% e) Find P(X >= 1), P(X > 1).

fprintf('e)\n')
ge = 1 - binocdf(0,n,p)
g = 1 - binocdf(1,n,p)

% f) Write a Matlab code that simulates 3 coin tosses and computes the value of the
% variable X.

fprintf('f)\n')
N = 5000; %number of simulations
U = rand(3,N); %random matrix with 3 rows and N columns
Y = (U < 0.5); %1 if U[i][j] < 0.5, otherwise 0
S = sum(Y); %sum on each column(count how many heads are there 0->3) 

vect_fr = zeros(1,4); %frequency for 0/1/2/3 heads

for i = 1:4
  vect_fr(i) = sum((S == (i-1)));
end
[x;px;vect_fr/N]