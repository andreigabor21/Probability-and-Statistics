x = 0:0.1:3
subplot(4,1,1)
plot(x, x.^5/10, '--pm', x, x.*sin(x), 'b', x, cos(x), '^g' )
title("Functions:");

xlabel("x -> ")
ylabel("y -> ")
legend("power", "x*sine(x)", "cosine")

subplot(4,1,2)
fplot("[x^5/10]",[0,3])

subplot(4,1,3)
fplot("[x*sin(x)]",[0,3])

subplot(4,1,4)
fplot("[cos(x)]",[0,3])