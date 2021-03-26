%% Generating random instances with controlled condition measures
% Given solution x> 0, "matrix_controlledcondition" generates instance A
% such that x is the most interior solutions to null(A)\cap\R^n_{++} ;


% *Inputs:*
% m : Number of rows ;
% n : Number of columns ;
% x : The most interior solution. Assume \|x\|_\inf = 1 ;

% *Outputs:*
% A random balanced matrix A such that Ax = 0 ;

function [A, B] = matrix_controlledcondition(m, n, x)

A = randn(m-1,n) ;
A = A - (A*x)*x'/(x'*x) ;

u = zeros(n,1) ;
indx = find(x==1) ;
u(indx) = rand(length(indx),1) ;
u = n*u/sum(abs(u)) ;
A = [A; u'-1./x'] ;

[Q, ~] = qr(A') ;
A = Q(:,1:m)' ;
B = Q(:,m+1:n)' ;