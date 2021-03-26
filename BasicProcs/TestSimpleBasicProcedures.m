function [iterations,cputime,feasibility] = TestSimpleBasicProcedures(m,n,N,epsilon)
%% Compare the performance of the perceptron, von Neumann (VN), von Neumann with 
% away-steps (VNA), and the smooth perceptron (smooth) schemes on N randomly instances of size m by n
%
% The number of iterations, cputime, and feasibility status for each of the four schemes 
% and for each instance and in the above ordering are saved in the three output N by 4 vectors. 
% The type of feasibility is as follows.
% "1"  : Primal feasibility, 
% "2"  : Dual feasibility, 
% "0"  : Epsilon stopping criterion is satisfied (can be used for rescaling), 
% "-1" : Reached maximum number of iterations limit (10,000) ;

iterations = zeros(N, 4) ;
cputime = zeros(N, 4) ;
feasibility = zeros(N, 4) ;

% Generate N random matrices and run Basic Procedures 
% (=Perceptron & =VN & =VNA & =Smooth)

z0 = ones(n,1)/n ; % Initial solution
for i = 1: N
    i
    % Generate projection matrix P = P_L onto a random L with dim(L) = m
    % using the "ProjMatrix" function
    P = ProjMatrix(m, n) ;
    
    % Call basic procedures
    tic ; [z, zz, stage, t] = perceptron(P, z0, epsilon) ;     
    cputime(i, 1) = toc ; iterations(i, 1) = t ; feasibility(i,1) = stage ;
    
    tic ; [z, zz, stage, t] = VN(P, z0, epsilon) ;             
    cputime(i, 2) = toc ; iterations(i, 2) = t ; feasibility(i,2) = stage ;
    
    tic ; [z, zz, stage, t] = VNA(P, z0, epsilon) ;            
    cputime(i, 3) = toc ; iterations(i, 3) = t ; feasibility(i,3) = stage ;
    
    tic ; [u, z, uu, zz, stage, t] = smooth(P, z0, epsilon) ;  
    cputime(i, 4) = toc ; iterations(i, 4) = t ; feasibility(i,4) = stage ;    
end


fprintf('SUMMARY OF BASIC PROCEDURES ON A SET OF NAIVE RANDOM INSTANCES FOR m = %i, n = %i, N = %i, epsilon = %f\n',m,n,N,epsilon)
fprintf('Next report (average number iterations, average cpu time, success rate) for each scheme\n') ;
fprintf('Perceptron: (%f,%f,%f)\n',mean(iterations(:,1)),mean(cputime(:,1)),1-sum(feasibility(:,1)==-1)/N) ;
fprintf('Von Neumann: (%f,%f,%f)\n',mean(iterations(:,2)),mean(cputime(:,2)),1-sum(feasibility(:,2)==-1)/N) ;
fprintf('Von Neumann with away steps: (%f,%f,%f)\n',mean(iterations(:,3)),mean(cputime(:,3)),1-sum(feasibility(:,3)==-1)/N) ;
fprintf('Smooth perceptron: (%f,%f,%f)\n',mean(iterations(:,4)),mean(cputime(:,4)),1-sum(feasibility(:,4)==-1)/N) ;
