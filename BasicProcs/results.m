% Summarize all the results and save it in a table format
% output a excep file and contains the average number of iterations and
% CPU time taken by the BPs for different values of epsilon

% The first sheet of the excel file contains the summary of results for large epsilon
load('condinfresults100by1000eps1.mat')
perceptronMean = sprintf('%.2f',mean(iterations(:,1)));
VNMean = sprintf('%.2f', mean(iterations(:,2)));
VNawayMean = sprintf('%.2f',mean(iterations(:,3)));
SmoothMean = sprintf('%.2f',mean(iterations(:,4)));

perceptronCPU = sprintf('%.2f',mean(cputime(:,1)));
VNCPU = sprintf('%.2f',mean(cputime(:,2)));
VNawayCPU = sprintf('%.2f',mean(cputime(:,3)));
SmoothCPU = sprintf('%.2f',mean(cputime(:,4)));

perceptronSuccessRate = sprintf('%.2f',sum(iterations(:,1) < 10000)/N);
VNSuccessRate = sprintf('%.2f',sum(iterations(:,2) < 10000)/N);
VNawaySuccessRate = sprintf('%.2f',sum(iterations(:,3) < 10000)/N);
SmoothSuccessRate = sprintf('%.2f',sum(iterations(:,4) < 10000)/N);

A = {'m', 'n', 'PerceptronIter', 'VNIter', 'VNawayIter', 'SmoothIter'; m n perceptronMean VNMean VNawayMean SmoothMean};
B = {'PerceptronCPU', 'VNCPU', 'VNawayCPU', 'SmoothCPU'; perceptronCPU VNCPU VNawayCPU SmoothCPU};
C = {'PerceptronSuccessRate', 'VNSuccessRate', 'VNASuccessRate','SmoothSuccessRate'; perceptronSuccessRate VNSuccessRate VNawaySuccessRate SmoothSuccessRate};
filename = 'summary.xlsx' ;
xlswrite(filename, A, 1, 'A1:F2');
xlswrite(filename, B, 1,'G1:J2');
xlswrite(filename, C, 1,'K1:N2');

load('condinfresults200by1000eps1.mat')
perceptronMean = sprintf('%.2f',mean(iterations(:,1)));
VNMean = sprintf('%.2f', mean(iterations(:,2)));
VNawayMean = sprintf('%.2f',mean(iterations(:,3)));
SmoothMean = sprintf('%.2f',mean(iterations(:,4)));

perceptronCPU = sprintf('%.2f',mean(cputime(:,1)));
VNCPU = sprintf('%.2f',mean(cputime(:,2)));
VNawayCPU = sprintf('%.2f',mean(cputime(:,3)));
SmoothCPU = sprintf('%.2f',mean(cputime(:,4)));

perceptronSuccessRate = sprintf('%.2f',sum(iterations(:,1) < 10000)/N);
VNSuccessRate = sprintf('%.2f',sum(iterations(:,2) < 10000)/N);
VNawaySuccessRate = sprintf('%.2f',sum(iterations(:,3) < 10000)/N);
SmoothSuccessRate = sprintf('%.2f',sum(iterations(:,4) < 10000)/N);

A = {m n perceptronMean VNMean VNawayMean SmoothMean};
B = {perceptronCPU VNCPU VNawayCPU SmoothCPU};
C = {perceptronSuccessRate VNSuccessRate VNawaySuccessRate SmoothSuccessRate};

xlswrite(filename, A, 1, 'A3:F3');
xlswrite(filename, B, 1,'G3:J3');
xlswrite(filename, C, 1,'K3:N3');

load('condinfresults500by1000eps1.mat')
perceptronMean = sprintf('%.2f',mean(iterations(:,1)));
VNMean = sprintf('%.2f', mean(iterations(:,2)));
VNawayMean = sprintf('%.2f',mean(iterations(:,3)));
SmoothMean = sprintf('%.2f',mean(iterations(:,4)));

perceptronCPU = sprintf('%.2f',mean(cputime(:,1)));
VNCPU = sprintf('%.2f',mean(cputime(:,2)));
VNawayCPU = sprintf('%.2f',mean(cputime(:,3)));
SmoothCPU = sprintf('%.2f',mean(cputime(:,4)));


perceptronSuccessRate = sprintf('%.2f',sum(iterations(:,1) < 10000)/N);
VNSuccessRate = sprintf('%.2f',sum(iterations(:,2) < 10000)/N);
VNawaySuccessRate = sprintf('%.2f',sum(iterations(:,3) < 10000)/N);
SmoothSuccessRate = sprintf('%.2f',sum(iterations(:,4) < 10000)/N);

A = {m n perceptronMean VNMean VNawayMean SmoothMean};
B = {perceptronCPU VNCPU VNawayCPU SmoothCPU};
C = {perceptronSuccessRate VNSuccessRate VNawaySuccessRate SmoothSuccessRate};

xlswrite(filename, A, 1, 'A4:F4');
xlswrite(filename, B, 1,'G4:J4');
xlswrite(filename, C, 1,'K4:N4');


load('condinfresults800by1000eps1.mat')
perceptronMean = sprintf('%.2f',mean(iterations(:,1)));
VNMean = sprintf('%.2f', mean(iterations(:,2)));
VNawayMean = sprintf('%.2f',mean(iterations(:,3)));
SmoothMean = sprintf('%.2f',mean(iterations(:,4)));

perceptronCPU = sprintf('%.2f',mean(cputime(:,1)));
VNCPU = sprintf('%.2f',mean(cputime(:,2)));
VNawayCPU = sprintf('%.2f',mean(cputime(:,3)));
SmoothCPU = sprintf('%.2f',mean(cputime(:,4)));


perceptronSuccessRate = sprintf('%.2f',sum(iterations(:,1) < 10000)/N);
VNSuccessRate = sprintf('%.2f',sum(iterations(:,2) < 10000)/N);
VNawaySuccessRate = sprintf('%.2f',sum(iterations(:,3) < 10000)/N);
SmoothSuccessRate = sprintf('%.2f',sum(iterations(:,4) < 10000)/N);

A = {m n perceptronMean VNMean VNawayMean SmoothMean};
B = {perceptronCPU VNCPU VNawayCPU SmoothCPU};
C = {perceptronSuccessRate VNSuccessRate VNawaySuccessRate SmoothSuccessRate};

xlswrite(filename, A, 1, 'A5:F5');
xlswrite(filename, B, 1,'G5:J5');
xlswrite(filename, C, 1,'K5:N5');

load('condinfresults900by1000eps1.mat')
perceptronMean = sprintf('%.2f',mean(iterations(:,1)));
VNMean = sprintf('%.2f', mean(iterations(:,2)));
VNawayMean = sprintf('%.2f',mean(iterations(:,3)));
SmoothMean = sprintf('%.2f',mean(iterations(:,4)));

perceptronCPU = sprintf('%.2f',mean(cputime(:,1)));
VNCPU = sprintf('%.2f',mean(cputime(:,2)));
VNawayCPU = sprintf('%.2f',mean(cputime(:,3)));
SmoothCPU = sprintf('%.2f',mean(cputime(:,4)));


perceptronSuccessRate = sprintf('%.2f',sum(iterations(:,1) < 10000)/N);
VNSuccessRate = sprintf('%.2f',sum(iterations(:,2) < 10000)/N);
VNawaySuccessRate = sprintf('%.2f',sum(iterations(:,3) < 10000)/N);
SmoothSuccessRate = sprintf('%.2f',sum(iterations(:,4) < 10000)/N);

A = {m n perceptronMean VNMean VNawayMean SmoothMean};
B = {perceptronCPU VNCPU VNawayCPU SmoothCPU};
C = {perceptronSuccessRate VNSuccessRate VNawaySuccessRate SmoothSuccessRate};

xlswrite(filename, A, 1, 'A6:F6');
xlswrite(filename, B, 1,'G6:J6');
xlswrite(filename, C, 1,'K6:N6');

% The second sheet of the excel file contains the summary of results for medium epsilon
load('condinfresults100by1000eps4.mat')
perceptronMean = sprintf('%.2f',mean(iterations(:,1)));
VNMean = sprintf('%.2f', mean(iterations(:,2)));
VNawayMean = sprintf('%.2f',mean(iterations(:,3)));
SmoothMean = sprintf('%.2f',mean(iterations(:,4)));

perceptronCPU = sprintf('%.2f',mean(cputime(:,1)));
VNCPU = sprintf('%.2f',mean(cputime(:,2)));
VNawayCPU = sprintf('%.2f',mean(cputime(:,3)));
SmoothCPU = sprintf('%.2f',mean(cputime(:,4)));

perceptronSuccessRate = sprintf('%.2f',sum(iterations(:,1) < 10000)/N);
VNSuccessRate = sprintf('%.2f',sum(iterations(:,2) < 10000)/N);
VNawaySuccessRate = sprintf('%.2f',sum(iterations(:,3) < 10000)/N);
SmoothSuccessRate = sprintf('%.2f',sum(iterations(:,4) < 10000)/N);

A = {'m', 'n', 'PerceptronIter', 'VNIter', 'VNawayIter', 'SmoothIter'; m n perceptronMean VNMean VNawayMean SmoothMean};
B = {'PerceptronCPU', 'VNCPU', 'VNawayCPU', 'SmoothCPU'; perceptronCPU VNCPU VNawayCPU SmoothCPU};
C = {'PerceptronSuccessRate', 'VNSuccessRate', 'VNASuccessRate','SmoothSuccessRate'; perceptronSuccessRate VNSuccessRate VNawaySuccessRate SmoothSuccessRate};
filename = 'summary.xlsx' ;
xlswrite(filename, A, 2, 'A1:F2');
xlswrite(filename, B, 2,'G1:J2');
xlswrite(filename, C, 2,'K1:N2');

load('condinfresults200by1000eps4.mat')
perceptronMean = sprintf('%.2f',mean(iterations(:,1)));
VNMean = sprintf('%.2f', mean(iterations(:,2)));
VNawayMean = sprintf('%.2f',mean(iterations(:,3)));
SmoothMean = sprintf('%.2f',mean(iterations(:,4)));

perceptronCPU = sprintf('%.2f',mean(cputime(:,1)));
VNCPU = sprintf('%.2f',mean(cputime(:,2)));
VNawayCPU = sprintf('%.2f',mean(cputime(:,3)));
SmoothCPU = sprintf('%.2f',mean(cputime(:,4)));

perceptronSuccessRate = sprintf('%.2f',sum(iterations(:,1) < 10000)/N);
VNSuccessRate = sprintf('%.2f',sum(iterations(:,2) < 10000)/N);
VNawaySuccessRate = sprintf('%.2f',sum(iterations(:,3) < 10000)/N);
SmoothSuccessRate = sprintf('%.2f',sum(iterations(:,4) < 10000)/N);

A = {m n perceptronMean VNMean VNawayMean SmoothMean};
B = {perceptronCPU VNCPU VNawayCPU SmoothCPU};
C = {perceptronSuccessRate VNSuccessRate VNawaySuccessRate SmoothSuccessRate};

xlswrite(filename, A, 2, 'A3:F3');
xlswrite(filename, B, 2,'G3:J3');
xlswrite(filename, C, 2,'K3:N3');

load('condinfresults500by1000eps4.mat')
perceptronMean = sprintf('%.2f',mean(iterations(:,1)));
VNMean = sprintf('%.2f', mean(iterations(:,2)));
VNawayMean = sprintf('%.2f',mean(iterations(:,3)));
SmoothMean = sprintf('%.2f',mean(iterations(:,4)));

perceptronCPU = sprintf('%.2f',mean(cputime(:,1)));
VNCPU = sprintf('%.2f',mean(cputime(:,2)));
VNawayCPU = sprintf('%.2f',mean(cputime(:,3)));
SmoothCPU = sprintf('%.2f',mean(cputime(:,4)));


perceptronSuccessRate = sprintf('%.2f',sum(iterations(:,1) < 10000)/N);
VNSuccessRate = sprintf('%.2f',sum(iterations(:,2) < 10000)/N);
VNawaySuccessRate = sprintf('%.2f',sum(iterations(:,3) < 10000)/N);
SmoothSuccessRate = sprintf('%.2f',sum(iterations(:,4) < 10000)/N);

A = {m n perceptronMean VNMean VNawayMean SmoothMean};
B = {perceptronCPU VNCPU VNawayCPU SmoothCPU};
C = {perceptronSuccessRate VNSuccessRate VNawaySuccessRate SmoothSuccessRate};

xlswrite(filename, A, 2, 'A4:F4');
xlswrite(filename, B, 2,'G4:J4');
xlswrite(filename, C, 2,'K4:N4');


load('condinfresults800by1000eps4.mat')
perceptronMean = sprintf('%.2f',mean(iterations(:,1)));
VNMean = sprintf('%.2f', mean(iterations(:,2)));
VNawayMean = sprintf('%.2f',mean(iterations(:,3)));
SmoothMean = sprintf('%.2f',mean(iterations(:,4)));

perceptronCPU = sprintf('%.2f',mean(cputime(:,1)));
VNCPU = sprintf('%.2f',mean(cputime(:,2)));
VNawayCPU = sprintf('%.2f',mean(cputime(:,3)));
SmoothCPU = sprintf('%.2f',mean(cputime(:,4)));


perceptronSuccessRate = sprintf('%.2f',sum(iterations(:,1) < 10000)/N);
VNSuccessRate = sprintf('%.2f',sum(iterations(:,2) < 10000)/N);
VNawaySuccessRate = sprintf('%.2f',sum(iterations(:,3) < 10000)/N);
SmoothSuccessRate = sprintf('%.2f',sum(iterations(:,4) < 10000)/N);

A = {m n perceptronMean VNMean VNawayMean SmoothMean};
B = {perceptronCPU VNCPU VNawayCPU SmoothCPU};
C = {perceptronSuccessRate VNSuccessRate VNawaySuccessRate SmoothSuccessRate};

xlswrite(filename, A, 2, 'A5:F5');
xlswrite(filename, B, 2,'G5:J5');
xlswrite(filename, C, 2,'K5:N5');

load('condinfresults900by1000eps4.mat')
perceptronMean = sprintf('%.2f',mean(iterations(:,1)));
VNMean = sprintf('%.2f', mean(iterations(:,2)));
VNawayMean = sprintf('%.2f',mean(iterations(:,3)));
SmoothMean = sprintf('%.2f',mean(iterations(:,4)));

perceptronCPU = sprintf('%.2f',mean(cputime(:,1)));
VNCPU = sprintf('%.2f',mean(cputime(:,2)));
VNawayCPU = sprintf('%.2f',mean(cputime(:,3)));
SmoothCPU = sprintf('%.2f',mean(cputime(:,4)));


perceptronSuccessRate = sprintf('%.2f',sum(iterations(:,1) < 10000)/N);
VNSuccessRate = sprintf('%.2f',sum(iterations(:,2) < 10000)/N);
VNawaySuccessRate = sprintf('%.2f',sum(iterations(:,3) < 10000)/N);
SmoothSuccessRate = sprintf('%.2f',sum(iterations(:,4) < 10000)/N);

A = {m n perceptronMean VNMean VNawayMean SmoothMean};
B = {perceptronCPU VNCPU VNawayCPU SmoothCPU};
C = {perceptronSuccessRate VNSuccessRate VNawaySuccessRate SmoothSuccessRate};

xlswrite(filename, A, 2, 'A6:F6');
xlswrite(filename, B, 2,'G6:J6');
xlswrite(filename, C, 2,'K6:N6');