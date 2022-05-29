classdef trapezoid1
    %MP model of the map
    %   method to calculate the distance

    properties
        PointA = [30, 70];
        PointB = [50, 70];
        PointC = [70, 30];
        PointD = [30, 30];
        % the best point
        x = 130/3;
        y = 170/3;
    end

    methods

        function obj = trapezoid1()

        end

        function distance = EuclideanDistance(obj, point)
            fA = min(pdist2(point, obj.PointA), [], 2);
            fB = min(pdist2(point, obj.PointB), [], 2);
            fC = min(pdist2(point, obj.PointC), [], 2);
            fD = min(pdist2(point, obj.PointD), [], 2);
            distance = [fA, fC, fB, fD];
        end

        function P = PS(obj)
            %PS - Description
            %
            % Syntax: P = PS(obj)
            %
            % Long description
            P = [obj.x, obj.y];
        end

        function P = PF(obj)
            P = [pdist2([obj.x, obj.y], obj.PointA), ...
                        pdist2([obj.x, obj.y], obj.PointC), ...
                        pdist2([obj.x, obj.y], obj.PointB), ...
                        pdist2([obj.x, obj.y], obj.PointD)];
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

        %% draw the ploygon
        function Draw(obj)
            b = [0 0 0 1; 1 0 0 0; 0 1 0 0; 0 0 1 0];

            for i = 1
                temp = [obj.PointA(i, :); obj.PointB(i, :); ...
                        obj.PointC(i, :); obj.PointD(i, :); ];
                gplot(b, temp, 'k');
                hold on;
            end

            plot(obj.PointA(:, 1), obj.PointA(:, end), 'ro');
            plot(obj.PointB(:, 1), obj.PointB(:, end), 'bx');
            plot(obj.PointC(:, 1), obj.PointC(:, end), 'g+');
            plot(obj.PointD(:, 1), obj.PointD(:, end), 'm*');
            % best position
            plot(obj.x, obj.y, 'r+');
            plot(obj.PointA, obj.PointC);
            plot([30,50], [30, 70]);
        end

    end

end
