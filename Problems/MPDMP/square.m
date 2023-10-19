classdef square
    %MP model of the map
    %   method to calculate the distance

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

        function obj = square()

        end

        function distance = EuclideanDistance(obj, point)
            fA = min(pdist2(point, obj.PointA), [], 2);
            fB = min(pdist2(point, obj.PointB), [], 2);
            fC = min(pdist2(point, obj.PointC), [], 2);
            fD = min(pdist2(point, obj.PointD), [], 2);
            distance = [fA, fC, fB, fD];
        end

        %% Manhattan
        function distance = ManhattanDistance(obj, point)
            fA = min(pdist2(point, obj.PointA, 'cityblock'), ...
                [], 2);
            fB = min(pdist2(point, obj.PointB, 'cityblock'), ...
                [], 2);
            fC = min(pdist2(point, obj.PointC, 'cityblock'), ...
                [], 2);
            fD = min(pdist2(point, obj.PointD, 'cityblock'), ...
                [], 2);
            distance = [fA, fC, fB, fD];
        end

        function p = PS(obj)
            p = [obj.x, obj.y];
        end
        %% draw the ploygon
        function f = Draw(obj)
            b = [0 0 1 0; 0 0 0 1; 0 0 0 0; 0 0 0 0];
            f = figure();
            hold on;
%             for i = 1
%                 temp = [obj.PointA(i, :); obj.PointB(i, :); ...
%                         obj.PointC(i, :); obj.PointD(i, :); ];
%                 gplot(b, temp, 'k');
%                 hold on;
%             end

            plot(obj.PointA(:, 1), ...
                obj.PointA(:, end), 'ro');
            plot(obj.PointB(:, 1), ...
                obj.PointB(:, end), 'bx');
            plot(obj.PointC(:, 1), ...
                obj.PointC(:, end), 'g+');
            plot(obj.PointD(:, 1), ...
                obj.PointD(:, end), 'm*');

            plot([obj.PointA(1), obj.PointC(1)], [obj.PointA(2), obj.PointC(2)]);
            plot([obj.PointB(1), obj.PointD(1)], [obj.PointB(2), obj.PointD(2)]);

            hold off;
            % plot(obj.x, obj.y, 'mp','MarkerSize',20);
        end

    end

end
