function DataPro(FileOrder, problem, algorithms, evaluation)
    dim = "2";
    OutFilePath = ".\test.xlsx";
    temp = [];
    row = [];
    rate = "1";

    for alg = algorithms
        temp = [temp, alg, "&"];

        line1 = ReadIn(FileOrder, alg, rate, evaluation, ...
            problem, dim);
        row = [row, line1.readFile(), "&"];
    end

    T = [temp; row];
    T = cat(2, ["problem"; problem], T);
    T = cat(2, ["rate"; FileOrder], T);
    writematrix(T, OutFilePath, 'WriteMode', 'append');
end
