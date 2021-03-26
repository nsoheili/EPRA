%% Von Neumann with away-steps  scheme PRIMAL-DUAL version
%
% *Inputs* 
% P        : Orthogonal projection onto L ;
% z0       : Initial solution in Delta ;
% epsilon  : Upper bound on the rescaling condition ;
%
% Notice: PP = I - P is the orthogonal projection onto Lperp ;
%
% *Outputs* 
% z and zz : Solutions in Delta such that either Pz > 0, or PPzz > 0, or 
%            sum(max(Pz,0)) <= epsilon*max(z), or sum(max(PPzz,0)) <= epsilon*max(zz) ;
% stage    : Type of feasibility.  
%            1 = primal feasible, 2 = dual feasible, 0 = rescale ("normal")
%           -1 = Max_Iterations reached without solving problem  ("abnormal")
% t        : Number of iterations taken by the algorithm ;

function [z, zz, stage, t] = VNA(P, z0, epsilon)

% *Initialization*
t = 0 ;                 
stage = -1 ; 

% Initial solutions to solve Pz > 0 where P = P_L
z = z0 ;     
y = P*z ; 
v = z - y ;

% Initial solutions to solve PPzz > 0 where PP = P_Lperp
PP = eye(size(P,2)) - P ;        
zz = z0 ;
yy = PP*zz ;
vv = zz - yy ;

%Max_Iterations = 1000000 ; % Upper bound on the number of iterations

%% Von-Neumann with away-steps updates 
while ((sum(y <= 0) > 0) && (sum(v <= 0) > 0) && (sum(max(y,0))/max(z) > epsilon) ...
    && (sum(yy <= 0) > 0) && (sum(vv <= 0) > 0) && (sum(max(yy,0))/max(zz) > epsilon))             
    % Force stop when t is too large
%     if (t >= Max_Iterations) 
%         stage = -1 ; 
%         break ; 
%     end 
    
    %% Primal solution update
    [minPz,j] = min(y) ; [maxPz,ell] = max(y.*(z>0)) ;
    y2 = y'*y ;
    if (y2 - minPz > maxPz - y2) || (sum(z>0) < 2) % regular step
        a = -z ; a(j) = a(j)+1 ; gammamax = 1 ;
    else % away step
        a = z ; a(ell) = a(ell)-1 ; gammamax = z(ell)/(1-z(ell)) ;
    end
    gamma = min(gammamax,-y'*a/(a'*P*a)) ; 
    z = z + gamma*a ; 
    y = P*z ; v = z-y ;

    %% Dual solution update
    [minPz,j] = min(yy) ; [maxPz,ell] = max(yy.*(zz>0)) ;
    yy2 = yy'*yy ;
    if (yy2 - minPz > maxPz - yy2) || (sum(zz>0) < 2) % regular step
        a = -zz ; a(j) = a(j)+1 ; gammamax = 1 ;
    else % away step
        a = zz ; a(ell) = a(ell)-1 ; gammamax = zz(ell)/(1-zz(ell)) ;
    end
    gamma = min(gammamax,-yy'*a/(a'*PP*a)) ; 
    zz = zz + gamma*a ; 
    yy = PP*zz ; vv = zz-yy ;
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
elseif (sum(max(y,0))/max(z) < epsilon) || (sum(max(yy,0))/max(zz) < epsilon)
    stage = 0 ; 
end 







