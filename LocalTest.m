function LocalTest()
    delete(gcp('nocreate'));
    parpool('local', 2);
    addpath(genpath(fileparts(mfilename('fullpath')))); %add path
    dim = 2;
    evaluation = 10000 * dim * 2;
    problem = @MPDMP51;
    alg = {@OptAll, @HybridOptMPNDS, @HybridOptMPNDS2, @OptPF};
    test_case = {

            @OptPS, problem, 200, 1, 1, evaluation, dim;

            };
    i = 1;
    for FileOrder = 0
        for k = 1:size(alg, 2)
            test_case{i, 1} = alg{k};
            Score = [];

            for j = 0:2:29
                spmd(2)
                    disp(j + labindex);
                    s = RandStream.create('mrg32k3a', 'NumStreams', 30, ...
                        'StreamIndices', j + labindex);
                    RandStream.setGlobalStream(s);
                    result = main('-algorithm', test_case{i, 1}, ...
                        '-problem', test_case{i, 2}, '-N', test_case{i, 3}, ...
                        '-save', test_case{i, 4}, '-run', test_case{i, 5}, ...
                        '-evaluation', test_case{i, 6}, '-D', test_case{i, 7}, ...
                        '-rate', FileOrder/10);
                end
                result = cat(1, result{1:end});
                Score = [Score; result];
            end

            result_mean = mean(Score);
            result_std = std(Score);
            location = {sprintf('Data/%d/%s', FileOrder, func2str(test_case{i, 1}))};
            [~, ~] = mkdir(sprintf('%s/%d/', location{1}, dim));
            save(sprintf('%s/%d/%s_%s(%d).mat', location{1}, dim, ...
                func2str(test_case{i, 2}), func2str(test_case{i, 1}), ...
                test_case{i, 6}), 'result_mean', 'result_std', 'Score');
        end 
        DataPro(string(FileOrder), func2str(problem), alg, string(evaluation));
    end
end
