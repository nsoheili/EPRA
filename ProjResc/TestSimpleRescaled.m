function [rescalingiterations,totaliterations,cputime,feasibility] = TestSimpleRescaled(m,n,N)
%% Test the One and Multi direction rescaling algorithms on on N randomly 
%% instances of size m by n randomly generated 

% Initialization
rescalingiterations = zeros(N,2) ;
totaliterations = zeros(N,2) ; 
cputime = zeros(N,2) ;
feasibility = zeros(N,2) ;

% Initialization of the algorithm inputs
z0 = ones(n,1)/n ; % Initial solution
U = 1e10 ; % An upper bound on the rescaling matrix

for i = 1: N
    i
    
    % Generate random instances
    A = randn(m,n) ;
    [Q,~] = qr(A') ;
    A = Q(:,1:m)' ;
    AA = Q(:,m+1:n)' ;
        
    %% Multi-direction MPRA
    tic ;  
    [multi_feas, ~, ~, multi_k, multi_Total, ~, ~] =  MultiEPRA(A, AA, n, z0, U) ;  
    
    % Record the CPU time, the number of rescaling iterations, total number of iterations,
    % and the feasibility type returned by multi-directions MPRA 
    cputime(i, 1) = toc ;                              % Record CPU time
    rescalingiterations(i, 1) = multi_k ;              % Record the number of rescaling iterations
    totaliterations(i, 1) = multi_Total ;              % Record the total number of iterations
    feasibility(i, 1) = multi_feas ;                   % Record the feasibility type
    
    %% One-direction MPRA: v2 includes a more efficient update of the projection matrix
    tic ;  
    % [one_feas, ~, ~, one_k, one_Total, ~, ~] = OneEPRA(A, AA, n, z0, U) ;    
    [one_feas, ~, ~, one_k, one_Total, ~, ~] = OneEPRAv2(A, AA, n, z0, U) ;
    % Record the CPU time, the number of rescaling iterations, total number of iterations,
    % and the feasibility type returned by one-direction MPRA
    cputime(i, 2) = toc ;                               % Record CPU time
    rescalingiterations(i,2) = one_k ;                  % Record the number of rescaling iterations
    totaliterations(i,2) = one_Total ;                  % Record the total number of iterations
    feasibility(i, 2) = one_feas ;                      % Record the feasibility type
end

fprintf('SUMMARY OF EPRA ALGORITHM ON A SET OF NAIVE RANDOM INSTANCES FOR m = %i, n = %i, N = %i\n',m,n,N)
fprintf('Average number of rescaling iterations (multiple rescaling): %f\n',mean(rescalingiterations(:,1))) ;
fprintf('Average number of rescaling iterations (single rescaling): %f\n',mean(rescalingiterations(:,2))) ;
fprintf('Average number of total basic iterations (multiple rescaling): %f\n',mean(totaliterations(:,1))) ;
fprintf('Average number of total basic iterations (single rescaling): %f\n',mean(totaliterations(:,2))) ;
fprintf('Average cpu time (multiple rescaling): %f\n',mean(cputime(:,1))) ;
fprintf('Average cpu time (single rescaling): %f\n',mean(cputime(:,2))) ;
fprintf('Feasibility status (L, L^perp, failure) multiple rescaling: (%f,%f,%f)\n',sum(feasibility(:,1)==1)/N,sum(feasibility(:,1)==2)/N,sum(feasibility(:,1)==0)/N) ;
fprintf('Feasibility status (L, L^perp, failure) single rescaling: (%f,%f,%f)\n',sum(feasibility(:,2)==1)/N,sum(feasibility(:,2)==2)/N,sum(feasibility(:,2)==0)/N) ;
