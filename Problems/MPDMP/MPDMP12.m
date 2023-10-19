classdef MPDMP12 < MPDMP
    % two overlapped triangles
    methods

        function obj = MPDMP12()
            % polygon1 = polyshape([30, 70; 55, 50; 30, 30; ]);
            % polygon2 = polyshape([70, 70; 70, 30; 45, 50; ]);
            polygon1 = nsidedpoly(4, 'Center', [30, 40], 'Radius', 20);
            polygon2 = nsidedpoly(4, 'Center', [50, 40], 'Radius', 20);
            polygon3 = nsidedpoly(4, 'Center', [40, 50], 'Radius', 20);
            obj.Map = polygon([polygon1, polygon2, polygon3]);
            obj.DM = {1:4, 5:8, 9:12};
            obj.M = 12;
            obj.Metric = {@IGD};

            obj.initialize();
        end
        
        function draw(obj)
            obj.Map.Draw();
            hold on;
            pgon = polyshape([35.8579 35.8579 44.1421 44.1421],[35.8579 54.1421 54.1421 35.8579]);
            flag = plot(pgon);
            legend(flag, 'PS');
            hold off;
        end
    end

end
