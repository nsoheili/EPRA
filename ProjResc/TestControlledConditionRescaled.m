function [rescalingiterations,totaliterations,cputime,feasibility,condition] = TestControlledConditionRescaled(m,n,N,delta)
%% Test the One and Multi direction rescaling algorithms on N randomly 
%% instances of size m by n generated with controlled condition by delta

% Initialization
cputime = zeros(N,1) ;
feasibility = zeros(N,1) ;
totaliterations = zeros(N,1) ;
rescalingiterations = zeros(N,1) ;
condition = zeros(N,1) ; % records the condition measure of each instance

% Initialization of the algorithm inputs
z0 = ones(n,1)/n ; % Initial solution
U = 1e10 ; % An upper bound on the rescaling matrix 


for i = 1: N
    i
    %% Generate random instances with controlled conditions
    
    % Generate the most interior solution x
    n0 = round(rand*n*0.1) ;
    x(1:n0,1) = rand(n0,1) ; x(n0+1:n,1) = delta*rand(n-n0,1) ;
    x = x/max(x) ;
    
    % Generate instance L = null(A) such that x is the most interior
    % solution to L\cap\R^n_+
    [A,AA] = matrix_controlledcondition(m,n,x) ;
    condition(i) = sum(log(x)) ;
        
    %% Multi-direction EPRA
    tic ;  
    [multi_feas, ~, ~, multi_k, multi_Total, ~, ~] =  MultiEPRA(A, AA, n, z0, U) ;  
    
    % Record the CPU time, the number of rescaling iterations, the total number of iterations,
    % and the feasibility type returned by multi-directions EPRA 
    cputime(i, 1) = toc ;                              % Record CPU time
    rescalingiterations(i) = multi_k ;              % Record the number of rescaling iterations
    totaliterations(i) = multi_Total ;              % Record the total number of iterations
    feasibility(i) = multi_feas ;                   % Record the feasibility type
end

fprintf('SUMMARY OF EPRA ALGORITHM ON A SET OF FEASIBLE INSTANCES WITH CONTROLLED CONDITION FOR m = %i, n = %i, N = %i\n',m,n,N)
fprintf('Average number of rescaling iterations: %f\n',mean(rescalingiterations)) ;
fprintf('Average number of total basic iterations: %f\n',mean(totaliterations)) ;
fprintf('Average cpu time: %f\n',mean(cputime)) ;

