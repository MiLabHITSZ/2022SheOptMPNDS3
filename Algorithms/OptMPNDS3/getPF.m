function [PF1, PF2] = getPF(Global)
    %GETPF 此处显示有关此函数的摘要
    %   此处显示详细说明
    N = Global.N;
    Global.N = 100;
    Population = Global.Initialization();
    [~, FrontNo, CrowdDis] = EnvironmentalSelection1(Population, ...
        Global.N, Global.DM{1});
    %% Optimization
    while Global.evaluated < 10000
        MatingPool = TournamentSelection(2, Global.N, FrontNo, -CrowdDis);
        Offspring = GA(Population(MatingPool));
        [Population, FrontNo, CrowdDis] = EnvironmentalSelection1( ...
            [Population, Offspring], Global.N, Global.DM{1});
    end

    PF1 = Population(FrontNo == 1);


    Population = Global.Initialization();
    [~, FrontNo, CrowdDis] = EnvironmentalSelection1(Population, ...
        Global.N, Global.DM{2});
    %% Optimization
    while Global.evaluated < 20000
        MatingPool = TournamentSelection(2, Global.N, FrontNo, -CrowdDis);
        Offspring = GA(Population(MatingPool));
        [Population, FrontNo, CrowdDis] = EnvironmentalSelection1( ...
            [Population, Offspring], Global.N, Global.DM{2});
    end

    PF2 = Population(FrontNo == 1);



    Global.N = N;
end
