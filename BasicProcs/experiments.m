%% Experiments: Basic Procedures Comparison

% Compare basic procedures on naive random instances
clear all ;
m = 50; n = 100 ; N = 100 ; epsilon = 1e-1 ;
[iterations,cputime,feasibility] = TestSimpleBasicProcedures(m,n,N,epsilon) ;
pause

% Compare basic procedures on instances with controlled condition measures
clear all ;
m = 50; n = 100 ; N = 100 ; epsilon = 1e-1 ; delta = 0.001 ;
[iterations,cputime,feasibility,condition] = TestControlledConditionBasicProcedures(m,n,N,epsilon,delta) ;
