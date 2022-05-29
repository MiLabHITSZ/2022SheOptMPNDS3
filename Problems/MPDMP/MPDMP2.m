classdef MPDMP2 < MPDMP
% two crossed lines
    methods

        function obj = MPDMP2()
            obj.Map = trapezoid1();
            obj.Metric = {@IGD};

            obj.initialize();

        end


        %% draw the point
        function Draw(obj, PopDec, FrontNo, caption)
            fig = figure();
            clf;
            obj.Map.Draw();
            gscatter(PopDec(:, 1), PopDec(:, end), FrontNo');
            xlabel('x_1');
            ylabel('x_2');
            axis([30 70 30 70]);
            title(caption);
        end

    end

end
