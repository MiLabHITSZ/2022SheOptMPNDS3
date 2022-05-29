function drawPF(points,tit,caption)
%DRAWPF 此处显示有关此函数的摘要
%   此处显示详细说明
fig = figure();
clf;

plot(points(:,1),points(:,end), 'k.');
xlabel('O_1');
ylabel('O_2');
axis([0 100 0 100]);
title(tit);

frame = getframe(fig); % 获取frame
img = frame2im(frame); % 将frame变换成imwrite函数可以识别的格式
filepath = "./figure/PF/" +caption+ num2str(fig.Number) + ".png";
imwrite(img,filepath); % 保存到工作目录下，名字为"算法名字.png"
end

