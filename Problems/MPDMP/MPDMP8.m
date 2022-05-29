classdef MPDMP8 < MPDMP
% two overlapped pentagons
    methods

        function obj = MPDMP8()
            polygon1 = nsidedpoly(5, 'Center', [40, 50], 'Radius', 20);
            polygon2 = nsidedpoly(5, 'Center', [60, 45], 'Radius', 20);
            obj.Map = polygon([polygon1, polygon2]);
            obj.DM = {1:5, 6:10};
            obj.M = 10;

            obj.initialize();
        end

    end

end
