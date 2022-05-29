classdef MPDMP3 < MPDMP
    % a line and a triangle
    methods

        function obj = MPDMP3()
            polygon = nsidedpoly(3, 'Center', [50, 40], 'Radius', 20);
            obj.Map = LinearMap(polygon);
            obj.DM = {[1, 2], [3, 4, 5]};
            obj.M = 5;
            obj.initialize();
        end

    end

end
