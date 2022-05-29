FileOrder = "5";
evaluation = "40000";
dim = "2";
OutFilePath = "C:\Users\szng\code\matlab\paper2\test.xlsx";
T = [];
rate = "2";
for i = [1, 2]
    block = [];
for alg = ["OptAll", "OptMPNDS", "OptMPNDS2", "OptPS", "OptPF"]
    row = [];
    for problem = ["MPDMP1", "MPDMP3", "MPDMP4", "MPDMP5", "MPDMP6"]
            line1 = ReadIn(FileOrder, alg, rate, evaluation, ...
                 problem + num2str(i), dim);
            row = [row, line1.readFile(), "&"];
    end
        row(end) = "\\";
        row = ["&", alg, "&", row];
        block = [block; row];
end
if i == 1
    block(1, 1) = "\multirow{4}{*}{Eucidean} &";
else
    block(1, 1) = "\multirow{4}{*}{Manhattan} &";
end
T = [T; block];
end
T = ["Measures	&","Algorithms","&","MPDMP1","&","MPDMP2","&",...
    "MPDMP3","&","MPDMP4","&","MPDMP5","\\"; T];
writematrix(T, OutFilePath, 'WriteMode', 'append');
            