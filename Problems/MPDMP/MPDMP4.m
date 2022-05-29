classdef MPDMP4 < MPDMP5
    % two triangles with a common edge
    methods

        function obj = MPDMP4()
            polygon1 = polyshape([50, 70; 30, 40; 70, 40; ]);
            polygon2 = polyshape([50, 40; 30, 10; 70, 10; ]);
            obj.Map = polygon([polygon1, polygon2]);
            obj.initialize();
        end

        function p = PS(obj)
            p = [50, 40];
        end

        function p = PF(obj)
            p = obj.CalObj(obj.PS());
        end

    end

end
