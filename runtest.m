function runtest()
    delete(gcp('nocreate'));
    parpool('local', 30);
    addpath(genpath(fileparts(mfilename('fullpath')))); %add path
    %% initialize the parameters
    alg = ["OptAll","OptMPNDS", "OptMPNDS2","OptMPNDS3"];
    problems = ["MPDMP1", "MPDMP2", "MPDMP3", "MPDMP4", "MPDMP5", "MPDMP6", "MPDMP7", "MPDMP8"];
    population = 200;
    evaluation = 120000;

    %problems = ["MPDMP9", "MPDMP10", "MPDMP11", "MPDMP12"];
    %evaluation = 80000;
    dim = 2;
    FileOrder = 0;

    test_case = {

            @OptPS, @MPDMP11, population, 1, 1, evaluation, dim;

            };
    %% run the algorithms
    for FileOrder = 0
        for problem = problems

            test_case{2} = str2func(problem);
            for k = 1:size(alg, 2)
                test_case{1} = str2func(alg(k));
                Score = [];

                for j = 0:30:29
                    spmd(30)
                    disp(labindex);
                    s = RandStream.create('mrg32k3a', 'NumStreams', 30, 'StreamIndices', labindex);
                    RandStream.setGlobalStream(s);
                    result = main('-algorithm', test_case{1}, ...
                        '-problem', test_case{2}, '-N', test_case{3}, ...
                        '-save', test_case{4}, '-run', test_case{5}, ...
                        '-evaluation', test_case{6}, '-D', test_case{7}, ...
                    '-rate', FileOrder / 10);
                    end

                result = cat(1, result{1:end});
                Score = [Score; result];
                end

            result_mean = mean(Score);
            result_std = std(Score);
            location = {sprintf('Data/%d/%s', FileOrder, func2str(test_case{1}))};
            [~, ~] = mkdir(sprintf('%s/%d/', location{1}, dim));
            save(sprintf('%s/%d/%s_%s(%d).mat', location{1}, dim, ...
                func2str(test_case{2}), func2str(test_case{1}), test_case{6}), ...
                'result_mean', 'result_std', 'Score');
            end

            DataPro(string(FileOrder), problem, alg, string(evaluation));
        end
    end
end
 