classdef LinearMap

    properties
        polygons;
        LinePoints = [30, 50; 70, 50; ];
    end

    methods

        function obj = LinearMap(polygons)
            obj.polygons = polygons;
        end

        function f = EuclideanDistance(obj, x)
            f = pdist2(x, obj.LinePoints);

            for i = obj.polygons
                f = [f, pdist2(x, i.Vertices)];
            end

        end

        function p = PS(obj)
            x = linspace(30, 70, 10000);
            y = repelem(50, 10000);
            x = x';
            y = y';
            % tell if the points are in the pooygons
            in = true(length(x), 1);

            for i = obj.polygons
                in = in & inpolygon(x, y, i.Vertices(:, 1), i.Vertices(:, end));
            end

            x = x(in);
            y = y(in);
            p = [x, y];
            % scatter(x, y);
        end

        function p = PF(obj)
            p = obj.PS();
            p = obj.EuclideanDistance(p);
        end

        function Draw(obj)
            %Draw - draw the map
            %
            % Syntax: Draw(obj)
            %
            % two triangle, each for one party.
            fig = figure();
            clf;
            hold on;
            plot(obj.LinePoints(:, 1), obj.LinePoints(:, end));

            for i = obj.polygons
                plot(i);
            end

        end

    end

end
