function t = dominated(objx, objy, DM)
%DOMINATE 此处显示有关此函数的摘要
%   此处显示详细说明
    obj = [objx; objy];
    for i  = 1:length(DM)
        temp(i, :) = NDSort(obj(:, DM{i}), 2);
    end
    front = NDSort(temp', 2);
    if front(2) == 2
        t = 1;
    else
        t = 0;
    end
end

