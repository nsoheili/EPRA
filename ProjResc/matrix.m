                                                                                                                                                                  %% Generating instances with controlled condition measures and partitions
% A random balanced matrix A is generated such that
% A_Bx_B = 0, A_N'y = s_N, s_B = A_B'y = 0 for some y and [x_B; s_N] > 0 ;
% rank(A_N) = l and rank(A) = m = k+l ;

% Matrices A_B and A_N with controlled condition measures are generated 
% using the "matrix_controlledcondition" function ;
% Given solutions xB > 0 and sN > 0, "matrix_controlledcondition" generates instances A_B and and A_N
% such that xB and sN are the most interior solutions to L_B\cap\R^n_{++} and
% L_N\cap\R^n_{++}, respectively, where L_B = null(A_B) and L_N = null(A_N) ;

% *Inputs:*
% n : number of columns in A ;
% B : size of partition B ;
% k : rank A_B ;
% l : rank A_N ;
% x : the most interior solution in L\cap\R^n_{++}

% *Outputs:*
% Balanced matrices A and AA that contain the orthogonal bases of L and Lperp ;

function [A, AA] = matrix(n, B, k, l, x)

xB = x(1:B)/max(x(1:B)) ;       % Normalize xB such that ||xB||_infty = 1 ;
if B > 0
    [ABB,~] = matrix_controlledcondition(k, B, xB) ;
else 
    ABB = [] ;
end

sN = x(B+1:n)/max(x(B+1:n)) ;   % Normalize sN such that ||sN||_infty = 1 ;
if B < n
    [~,ANN] = matrix_controlledcondition(n-B-l, n-B, sN) ;
else
    ANN = [] ;
end

% Generate balanced A with canonical partition B and N
A = [ABB, randn(k,n-B); zeros(l,B), ANN] ;

[Q, ~] = qr(A') ;
A = Q(:,1:k+l)' ;
AA = Q(:,k+l+1:n)' ;