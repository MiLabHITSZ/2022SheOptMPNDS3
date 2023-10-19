classdef MPDMP < PROBLEM

    properties
        Map;
        D = 2;
        DM = {1:2, 3:4};
        M = 4;
        encoding = 'real';
        Metric = {@IGD};
    end

    methods

        function obj = MPDMP()
            
        end

        function initialize(obj)
            %initialize - set the parameters needed for run.
            %
            % Syntax: initialize(obj)
            %
            % set the boundary, dimension, decision makers,
            % objective numbers and encoding
            obj.Global.lower = [0, 0];
            obj.Global.upper = [100, 100];
            obj.Global.D = obj.D;

            obj.Global.DM = obj.DM;
            obj.Global.M = obj.M;
            obj.Global.encoding = obj.encoding;
        end

        %% Calculate objective values
        function PopObj = CalObj(obj, PopDec)
            PopObj = obj.Map.EuclideanDistance(PopDec);
        end

        function p = PF(obj)
            p = obj.Map.PF();
        end

        function p = PS(obj)
            p = obj.Map.PS();
        end

        %% get reference point
        function Opt = GetOptimum(obj)
            Opt = [200, 200, 200, 200];
        end

        function fig = Draw(obj, PopDec, FrontNo, caption)
            fig = obj.Map.Draw();
            gscatter(PopDec(:, 1), PopDec(:, end), FrontNo');
            xlabel('x_1');
            ylabel('x_2');
            axis([30 70 30 70]);
            title(caption);
        end

    end

end
