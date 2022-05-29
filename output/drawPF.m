function drawPF(points,tit,caption)
%DRAWPF �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
fig = figure();
clf;

plot(points(:,1),points(:,end), 'k.');
xlabel('O_1');
ylabel('O_2');
axis([0 100 0 100]);
title(tit);

frame = getframe(fig); % ��ȡframe
img = frame2im(frame); % ��frame�任��imwrite��������ʶ��ĸ�ʽ
filepath = "./figure/PF/" +caption+ num2str(fig.Number) + ".png";
imwrite(img,filepath); % ���浽����Ŀ¼�£�����Ϊ"�㷨����.png"
end

