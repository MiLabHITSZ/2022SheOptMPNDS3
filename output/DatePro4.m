FileOrder = "3";
evaluation = "40000";
dim = "2";
OutFilePath = "C:\Users\szng\code\matlab\paper2\test.xlsx";
T = [];
rate = "1";
for i = [1, 2]
    block = [];
    temp = ["Problems", "&"];
    j = 0;
for problem = ["MPDMP1", "MPDMP3", "MPDMP4", "MPDMP5", "MPDMP6"]
    row = [];
    for alg = ["OptAll", "OptMPNDS", "OptMPNDS2", "OptPS", "OptPF"]
        if problem == "MPDMP1"
            temp = [temp, alg, "&"];
        end
        if alg == "OptPF"
            rate = "2";
            FileOrder = "0";
        else
            rate = "1";
            FileOrder = "3";
        end
            line1 = ReadIn(FileOrder, alg, rate, evaluation, ...
                 problem + num2str(i), dim);
            row = [row, line1.readFile(), "&"];
    end
        row(end) = "\\";
        j = j+1;
        row = ["MPDMP"+ num2str(j), "&", row];
        block = [block; row];
end
temp(end)  = "\\ \hline";
if i == 1
    block = [temp; block];
end
block(end, end) = "\\ \hline";
T = [T; block];
end
writematrix(T, OutFilePath, 'WriteMode', 'append');
            