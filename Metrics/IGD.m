function [score] = IGD(obj, PF, DM)
    % �˴���ʾ�йش˺�����ժҪ
    % Author: szng
    [M, ~] = size(obj);
    [N, ~] = size(PF);
    dis = zeros(N, M);

    for i = 1:length(DM)
        temp = pdist2(PF(:, DM{i}), obj(:, DM{i}));
        dis = dis + temp;
    end

    grades = min(dis, [], 2);
    score = [mean(grades), min(grades)];
end
