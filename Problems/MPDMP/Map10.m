classdef Map10

    properties
        polygons = nsidedpoly(4, 'Center', [50, 50], 'Sidelength', 30);
    end

    properties
        PointA = [30, 70];
        PointB = [70, 70];
        PointC = [70, 30];
        PointD = [30, 30];
        % the best point
        x = 50;
        y = 50;
    end

    methods

        function obj = Map10()

        end

        function distance = EuclideanDistance(obj, x)
            fA = min(pdist2(x, obj.PointA), [], 2);
            fB = min(pdist2(x, obj.PointB), [], 2);
            fC = min(pdist2(x, obj.PointC), [], 2);
            fD = min(pdist2(x, obj.PointD), [], 2);
            
            distance = [fA, fC, fB, fD];


            for i = obj.polygons
                distance = [distance, pdist2(x, i.Vertices)];
            end

        end

        function p = PS(obj)
            p = [obj.x, obj.y];
        end

        function p = PF(obj)
            p = obj.PS();
            p = obj.EuclideanDistance(p);
        end

        function fig = Draw(obj)
            %Draw - draw the map
            %
            % Syntax: Draw(obj)
            %
            % two triangle, each for one party.
            fig = figure();
            hold on;
            xlabel('x_1');
            ylabel('x_2');
            axis([0 100 0 100]);
            axis square;
            set(gca, 'ytick', [0:20:100]);
            set(gca, 'xtick', [0:20:100]);

            % for i = 1
            %     temp = [obj.PointA(i, :); obj.PointB(i, :); ...
            %             obj.PointC(i, :); obj.PointD(i, :); ];
            %     gplot(b, temp, 'k');
            %     hold on;
            % end

            plot(obj.PointA(:, 1), obj.PointA(:, end), 'ro');
            plot(obj.PointB(:, 1), obj.PointB(:, end), 'bx');
            plot(obj.PointC(:, 1), obj.PointC(:, end), 'ro');
            plot(obj.PointD(:, 1), obj.PointD(:, end), 'bx');

            plot(obj.x, obj.y, 'rd');

            plot([obj.PointA(1),obj.PointC(1)], [obj.PointA(2),obj.PointC(2)]);
            plot([obj.PointB(1),obj.PointD(1)], [obj.PointB(2),obj.PointD(2)]);

            for i = obj.polygons
                plot(i);
            end

        end

    end

end
