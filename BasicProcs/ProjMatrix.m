%% Generate a projection matrix onto a linear subspace L 
%
% *Inputs*
% m : Dimension of L
% n: Dimension of ambient space
%
% *Output:*
% Projection matrix P onto L

function P = ProjMatrix(m, n)

% Generate random matrix A of size m*n
A = randn(m, n) ;

% Compute the projection matrix P = Q'*Q where A' = QR
[Q, ~] = qr(A') ; % Compute economy size QR
P = Q(:,1:m)*Q(:,1:m)' ;
