%% Basic procedure: smooth perceptron scheme for use within symmetric rescaling

% *Inputs:*
% P       : The projection matrix onto L or Lperp,
% u0      : Initial solution in Delta, 
% epsilon : An upper bound on the rescaling condition in ||(Pz)+||_1/max(z)<= epsilon ;

% *Output:*
% y  : Pu,
% z  : A solution satisfying either Pz > 0 or the rescaling condition
%      sum(max(Pz,0)) <= epsilon*max(z),
% k  : Number of iterations taken by the smooth perceptron algorithm ;

function [y, z, k] = smooth(P, u0, epsilon)

% *Initialization*
k = 0 ;
mu = 2;

u = u0 ;
y = P*u; 
z = Umu(y,mu,u0);
w = P*z ;

% Smooth perceptron updates
while (sum(max(w,0))/max(z) > epsilon) && (sum(y < 0) > 0)     
    theta = 2/(k+3);
    u = (1-theta)*(u+theta*z) + theta^2*Umu(y,mu,u0) ;
    mu = (1-theta)*mu;
    y = P*u ; 
    z = (1-theta)*z + theta*Umu(y,mu,u0);
    w = P*z ;
    k = k+1 ;
end 

if k > 0
    k = k-1;
end

