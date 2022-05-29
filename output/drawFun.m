function drawFun()
%DRAWFUN 此处显示有关此函数的摘要
%   此处显示详细说明
x = linspace(0, 1);
y1 = 1 ./ (10.*x);
y2 = 1 ./ (1 + exp(-x));
y3 = 1 - 0.6*x;
y4 = 1/8 .*(1 - log(x ./(1-x)))+0.5;
y5 = 1 - 1 ./(1 + exp(-50 .* x + 50));
y = y3;
% y(y < 0.4) = 0.4;
plot(x, y)
xlabel('x');
ylabel('y');
axis([0 1 0 1]);
end
