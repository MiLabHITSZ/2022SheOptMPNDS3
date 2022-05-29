classdef MPDMP5 < MPDMP
    % two overlapped triangles
    methods

        function obj = MPDMP5()
            % polygon1 = polyshape([30, 70; 55, 50; 30, 30; ]);
            % polygon2 = polyshape([70, 70; 70, 30; 45, 50; ]);
            polygon1 = nsidedpoly(3, 'Center', [39, 40], 'Radius', 40);
            polygon2 = nsidedpoly(3, 'Center', [60, 20], 'Radius', 40);
            obj.Map = polygon([polygon1, polygon2]);
            obj.DM = {1:3, 4:6};
            obj.M = 6;
            obj.Metric = {@IGD};

            obj.initialize();
        end

    end

end
