classdef MPDMP10 < MPDMP
    % two regular crossed lines
    methods

        function obj = MPDMP10()
            obj.Map = Map10();
            obj.Metric = {@IGD};
            obj.M = 8;
            obj.DM = {1:2, 3:4, 5:8};

            obj.initialize();
        end

        %% fitness
        function f = fitness(obj, x)
            f = obj.Map.EuclideanDistance(x);
        end

        %% PS
        function P = PS(obj)
            P = [50, 50];
        end

        %% PF
        function P = PF(obj)
            P = obj.fitness(obj.PS);
        end

        %% draw the point
        function Draw(obj, PopDec, FrontNo, caption)
            fig = Draw@MPDMP(obj, PopDec, FrontNo, caption);

            filepath = "./figure/" + caption + "MPDMP10.png";
            saveas(fig, filepath);
        end

        function draw(obj)
            obj.Map.Draw();
            hold on;
            PS = obj.PS();
            flag = plot(PS(1), PS(2), 'rd');
            legend(flag, 'PS');
            hold off;
        end

    end

end
