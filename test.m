function test()
delete(gcp('nocreate'));
parpool('local',30);
addpath(genpath(fileparts(mfilename('fullpath'))));%add path 
dim = 2;
evaluation = 10000*dim*4;
alg = {@OptAll,@OptMPNDS, @OptMPNDS2,@Optnew,@OptPF};
    for k = 1:5
        test_case = {
            
            @OptPS,@MPDMP11,100,1,1,evaluation,dim;
            @OptPS,@MPDMP12,100,1,1,evaluation,dim;

            @OptPS,@MPDMP21,100,1,1,evaluation,dim;
            @OptPS,@MPDMP22,100,1,1,evaluation,dim;

            @OptPS,@MPDMP31,100,1,1,evaluation,dim;
            @OptPS,@MPDMP32,100,1,1,evaluation,dim;

            @OptPS,@MPDMP41,100,1,1,evaluation,dim;
            @OptPS,@MPDMP42,100,1,1,evaluation,dim;

            @OptPS,@MPDMP51,100,1,1,evaluation,dim;
            @OptPS,@MPDMP52,100,1,1,evaluation,dim;
            
            @OptPS,@MPDMP61,100,1,1,evaluation,dim;
            @OptPS,@MPDMP62,100,1,1,evaluation,dim;


            

            };
        for i=1: 12
            test_case{i,1} = alg{k};
            Score=[];
            for j=30
                spmd(30)
                    display(labindex);
                     s = RandStream.create('mrg32k3a','NumStreams',100,'StreamIndices',labindex);
                    RandStream.setGlobalStream(s); 
                    result=main('-algorithm',test_case{i,1},'-problem',test_case{i,2},'-N',test_case{i,3},'-save',test_case{i,4},'-run',test_case{i,5}, ...,
                        '-evaluation',test_case{i,6},'-D',test_case{i,7});
                 end
                   result =  cat(1, result{1:end});          
                   Score = [Score;result];
            end    
            result_mean=mean(Score);
            result_std=std(Score);
            location={sprintf('Data/100/%s',func2str(test_case{i,1}))};
           [~,~]=mkdir(sprintf('%s/%d/',location{1},dim));
           save(sprintf('%s/%d/%s_%s(%d).mat',location{1},dim,func2str(test_case{i,2}),func2str(test_case{i,1}),test_case{i,6}),'result_mean','result_std','Score');
        end 
        
    end
    DatePro5;
end
