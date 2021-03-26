function [rescalingiterations,totaliterations,cputime,feasibility,condition,sizem,partitionB,correctB] = TestPartitionRescaled(n,N)
%% Test the One and Multi direction rescaling algorithms on N randomly 
%% instances of m by n generated with partition.  The value m is 
%% determined as we generate the instances.
%
%
% Initialization
rescalingiterations = zeros(N,1) ;
totaliterations = zeros(N,1) ; 
cputime = zeros(N,1) ;
feasibility = zeros(N,1) ;
condition = zeros(N,1) ; 
sizem = zeros(N,1) ;       % Records m = dim(L) for each instance L
partitionB =  zeros(N,1) ; % Records the size of partition B for each instance
correctB =  zeros(N,1) ;   % Checks whether the partition found by the algorithm is correct

% Initialization of the algorithm inputs
z0 = ones(n,1)/n ; % Initial solution
U = 1e10 ; % An upper bound on the rescaling matrix

for i = 1: N
    i
     %% Generate random instances with non-trivial partition
     
    % Generate a random number of B, l and k. Set m = k + 1 ;
    B = randi([2,n-2],1) ; l = randi([1,n-B],1) ; k = randi([1,B],1) ; m = k+l ;
    
    sizem(i) = m ;
    partitionB(i) = B ;
    
    % Generate the most interior solution x
    x = rand(n,1) ;   
    xB = x(1:B)/max(x(1:B)) ;
    xN = x(B+1:n)/max(x(B+1:n)) ;
    condition(i) = min(sum(log(xB)), sum(log(xN)));
    
    % Generate random instances with non-trivial condition measure 
    [A, AA] = matrix(n, B, k, l, x) ; 
    
    
    %% Multi-direction EPRA
    tic ;  
    [multi_feas, ~, ~, multi_k, multi_Total, multi_Bset, ~] =  MultiEPRA(A, AA, n, z0, U) ;  
    
    % Record the CPU time, the number of rescaling iterations, the total number of iterations,
    % and the feasibility type returned by multi-directions MPRA 
    cputime(i) = toc ;                              % Record CPU time
    rescalingiterations(i) = multi_k ;              % Record the number of rescaling iterations
    totaliterations(i) = multi_Total ;              % Record the total number of iterations
    feasibility(i) = multi_feas ;                   % Record the feasibility type
    
    % Check if the partition found by the algorithm is correct
    if (length(multi_Bset) == B) 
        correctB(i) = (norm(multi_Bset-(1:B)') == 0) ;
    else
        correctB(i) = 0 ;
    end    
end


fprintf('SUMMARY OF EPRA ALGORITHM ON A SET OF INSTANCES WITH NON-TRIVIAL PARTITION FOR n = %i, N = %i\n',n,N)
fprintf('Average m: %f\n',mean(sizem)) ;
fprintf('Average number of rescaling iterations: %f\n',mean(rescalingiterations)) ;
fprintf('Average number of total basic iterations: %f\n',mean(totaliterations)) ;
fprintf('Average cpu time: %f\n',mean(cputime)) ;
fprintf('Success rate in finding partition: %f\n',sum(correctB)/N) ;
