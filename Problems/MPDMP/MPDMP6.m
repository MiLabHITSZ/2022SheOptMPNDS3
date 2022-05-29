classdef MPDMP6 < MPDMP
% two squares with a common edge
    methods

        function obj = MPDMP6()
            polygon1 = nsidedpoly(4, 'Center', [38, 50], 'SideLength', 24);
            polygon2 = nsidedpoly(4, 'Center', [60, 50], 'SideLength', 20);
            obj.Map = polygon([polygon1, polygon2]);
            obj.DM = {1:4, 5:8};
            obj.M = 8;
            obj.initialize();
        end

        function p = PS(obj)
            x = repelem(50, 10000);
            y = linspace(40, 60, 10000);
            p = [x', y'];
            % scatter(x, y);
        end

        function p = PF(obj)
            p = obj.PS();
            p = obj.Map.EuclideanDistance(p);
        end

    end

end
