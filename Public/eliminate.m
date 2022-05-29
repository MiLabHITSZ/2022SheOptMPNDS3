function [objs, decs] = eliminate(decs, DM, map)
%ELIMINATE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
objs = map.CalObjectives(decs);
M = size(objs, 2);

for i = 1: DM
    tmp(i, :) = NDSort(objs(:,(i-1)*M/DM+1:i*M/DM),size(objs,1));
end
Front = NDSort(tmp', size(objs, 1));

objs = objs(Front == 1, :);
decs = decs(Front == 1, :);
end

