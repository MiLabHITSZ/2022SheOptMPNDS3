classdef MPDMP11 < MPDMP
    % two overlapped triangles
    methods

        function obj = MPDMP11()
            % polygon1 = polyshape([30, 70; 55, 50; 30, 30; ]);
            % polygon2 = polyshape([70, 70; 70, 30; 45, 50; ]);
            polygon1 = nsidedpoly(3, 'Center', [30, 40], 'Radius', 20);
            polygon2 = nsidedpoly(3, 'Center', [50, 40], 'Radius', 20);
            polygon3 = nsidedpoly(3, 'Center', [40, 45], 'Radius', 20);
            obj.Map = polygon([polygon1, polygon2, polygon3]);
            obj.DM = {1:3, 4:6,7:9};
            obj.M = 9;
            obj.Metric = {@IGD};

            obj.initialize();
        end
        
        function draw(obj)
            obj.Map.Draw();
            hold on;
            pgon = polyshape([35.56624 40 44.43375],[35 42.6795 35]);
            flag = plot(pgon);
            legend(flag, 'PS');
            hold off;
        end
    end

end
