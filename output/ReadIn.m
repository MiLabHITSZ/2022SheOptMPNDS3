classdef ReadIn < handle
    %WRITEOUT 此处显示有关此类的摘要
    %   此处显示详细说明
    
    properties
        FileOrder;
        AlgName;
        Rate;
        Dim;
        Evaluation;
        Problem;
        
        FileName;
        FilePath;

    end
    
    methods
        function obj = ReadIn(FileOrder, AlgName, Rate, Evaluation,...
                Problem, Dim)
            %WRITEOUT 构造此类的实例
            %   此处显示详细说明
            obj.FileOrder = FileOrder;
            obj.AlgName = AlgName;
            obj.Rate =Rate;
            obj.Evaluation = Evaluation;
            obj.Problem = Problem;
            obj.Dim = Dim;

        end
        
        function getFileName(obj)
            obj.FileName = obj.Problem + "_" + obj.AlgName + "(" +...
                obj.Evaluation + ")" + ".mat";
        end
        
        function getFilePath(obj)
           obj.FilePath = "Data\" + obj.FileOrder+ "\" + obj.AlgName +...
               "\" + obj.Dim + "\" + obj.FileName;
        end
        function T = readFile(obj)
            obj.getFileName();
            obj.getFilePath();
            
            load(obj.FilePath,'result_mean','result_std');
            tmp1 = sprintf('%.4e',result_mean(1)) + "(" ...
                + sprintf('%.4e',result_std(1)) + ")";
            T = tmp1;
        end
    end
end


