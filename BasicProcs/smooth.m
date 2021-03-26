%% Smooth perceptron scheme PRIMAL-DUAL version
%
% *Inputs* 
% P               : Orthogonal projection onto L ;
% u0              : Initial solution in Delta ;
% epsilon         : Upper bound on the rescaling condition ;
%
% Notice: PP = I - P is the orthogonal projection onto Lperp ;
%
% *Outputs* 
% u, z, uu and zz : Solutions in Delta such that either Pu > 0, or PPuu > 0, or 
%                   sum(max(Pz,0)) <= epsilon*max(z), or sum(max(PPzz,0)) <= epsilon*max(zz) ;
% stage           : Type of feasibility.  
%                   1 = primal feasible, 2 = dual feasible, 0 = rescale ("normal")
%                   -1 = Max_Iterations reached without solving problem  ("abnormal")
% t               : Number of iterations taken by the algorithm ;
 
function [u, z, uu, zz, stage, t] = smooth(P, u0, epsilon)

% *Initialization*
t = 0 ;                  
stage = -1 ; 
mu = 2;

% Initial solutions to solve Pz > 0 where P = P_L
u = u0 ;
y = P*u; v = u-y ;
z = Umu(y,mu,u0);    
w = P*z ;

% Initial solutions to solve PPzz > 0 where PP = P_Lperp
PP = eye(size(P,2)) - P ;        
uu = u0 ;
yy = PP*uu ; vv = uu-yy ; 
zz = Umu(yy,mu,u0);  
ww = PP*zz ;

%Max_Iterations = 1000000 ; % Upper bound on the number of iterations

%% Smooth perceptron updates
while ((sum(y <= 0) > 0) && (sum(v <= 0) > 0) && (sum(max(y,0))/max(z) > epsilon) ...
    && (sum(yy <= 0) > 0) && (sum(vv <= 0) > 0) && (sum(max(yy,0))/max(zz) > epsilon))             
    % Force stop when t is too large
%     if (t >= Max_Iterations) 
%         stage = -1 ; 
%         break ; 
%     end 
    
    %% Primal solution update
    theta = 2/(t+3);
    u = (1-theta)*(u+theta*z) + theta^2*Umu(y,mu,u0) ;
    mu = (1-theta)*mu;
    y = P*u ; v = u-y ;
    z = (1-theta)*z + theta*Umu(y,mu,u0);
    w = P*z ;
     
    %% Dual solution update
    mu = mu/(1-theta) ;  % undo the above setting for the dual step
    uu = (1-theta)*(uu+theta*zz) + theta^2*Umu(yy,mu,u0) ;
    mu = (1-theta)*mu;
    yy = PP*uu ; vv = uu-yy ;
    zz = (1-theta)*zz + theta*Umu(yy,mu,u0);
    ww = PP*zz ;
    
    t = t+1 ;
end 

%% Checking the feasibility type
% if  Pz > 0 or  Pzz > 0 then stage = 1 (the problem is primal feasible) ;
% if PPz > 0 or PPzz > 0 then stage = 2 (the problem is dual feasible) ;
% if (||(Pz)+||_1)/max(z) < epsilon  or (||(PPzz)+||_1)/max(zz) < epsilon
% then stage = 0 ;
if (min(y) > 0) || (min(vv) > 0)
    stage = 1 ; 
elseif (min(v) > 0) || (min(yy) > 0)
    stage = 2 ;
elseif (sum(max(w,0))/max(z) < epsilon) || (sum(max(ww,0))/max(zz) < epsilon)
    stage = 0 ;     
end 

