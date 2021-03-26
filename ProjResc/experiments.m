%% Experiments: Enhanced Projection and Rescaling Algorithm

% Naive random instances
clear all
N = 100; m = 50 ; n = 100 ;
[rescalingiterations,totaliterations,cputime,feasibility] = TestSimpleRescaled(m,n,N) ;
pause

% Controlled condition instances
clear all
delta = 0.001 ; N = 100 ; m = 50 ; n = 100 ;
[rescalingiterations,totaliterations,cputime,feasibility,condition] = TestControlledConditionRescaled(m,n,N,delta) ;
pause

%Instances with non-trivial partitions
clear all
N = 100 ; n = 100 ;
[rescalingiterations,totaliterations,cputime,feasibility,condition,sizem,partitionB,correctB] = TestPartitionRescaled(n,N) ;
