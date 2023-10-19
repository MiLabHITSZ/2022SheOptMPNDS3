function [score] = IGD1(obj, PF, DM)
    % �˴���ʾ�йش˺�����ժҪ
    % Author: szng

    dis = pdist2(PF(:, DM{1}), obj(:, DM{1}));
    grades = min(dis, [], 2);
    score = [mean(grades), min(grades)];
end
