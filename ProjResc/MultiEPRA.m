%% Multi-direction EPRA
% *Inputs:*
% A and AA       : Instances such that L = null(A) and Lperp = null(AA) ;
% n              : Number of columns in A 
% z0             : Initial solution
% U              : An upper bound on the rescaling matrix 

% *Outputs:*
% feas           : Feasibility status of the problem identified by the algorithm
% xL             : Solution found in L\cap\R^n_+
% xLperp         : Solution found in Lperp\cap\R^n_+
% k              : Number of rescaling iterations
% Total          : Total number of iterations
% Bset and Nset  : Partition (B,N) identified by the algorithm

function [feas, xL, xLperp, k, Total, Bset, Nset] = MultiEPRA(A, AA, n, z0, U)
[Q, ~] = qr(AA',0) ;      % Compute economy size QR 
P = Q*Q' ;               % Compute the projection matrix onto L

[QQ, ~] = qr(A',0) ;    % Compute economy size QR 
PP = QQ*QQ' ;            % Compute the the projection matrix onto Lperp

% *Initialization*
totalprimal = 0 ;
totaldual = 0 ;
k = 0 ;
feas = 0 ;

zz0 = z0 ;
D = eye(n) ;
DD = D ;

xL = [] ;
xLperp = [] ;

RescalingLimit = 1e2 ; % An upper bound on the number of rescaling iterations

while (feas == 0) && (k <= RescalingLimit)
   
    %% ***** Basic procedure phase (smooth perceptron algorithm)
    % Primal
    [y, z, totalitrsmooth] = smooth(P, z0, 0.5) ;
    totalprimal = totalprimal + totalitrsmooth ;
    
    % Dual 
    [yLperp, zLperp, totalitrsmooth] = smooth(PP, zz0, 0.5) ;
    totaldual = totaldual + totalitrsmooth ;
    
    %% ***** Partition identification phase
    xL = D\y; 
    xLperp = DD\yLperp ;
    
    Nset = find(xL < max(abs(xL))/U) ; Nsetcomp = find(xL >= max(abs(xL))/U) ;
    Bset = find(xLperp < max(abs(xLperp))/U) ; Bsetcomp = find(xLperp >= max(abs(xLperp))/U) ;        
    
    % Check if one of "easy" cases holds
    if (isempty(Nset)), feas = 1 ; break ;    
    elseif (isempty(Bset)), feas = 2 ; break ;
    end 
    
    if (length(Bset) + length(Nset) == n) && (norm(Nset - Bsetcomp) == 0) && (norm(Bset - Nsetcomp) == 0)
    % Got candidate for partition.  Determine which of the three cases holds
        if (max(abs(xL(Nset))) < max(abs(xL))/U) && (max(abs(xLperp(Bset))) < max(abs(xLperp))/U)
            feas = 3 ; break ;
        end
    end
    
    %% ***** Rescaling phase
    
    % ** Primal rescaling
    % Find all possible directions for rescaling L
    e = max(z/sum(max(P*z,0))-1,0) ; 
        
    % Update the rescaling matrix 
    B = eye(length(z)) + diag(e) ;
    D = min(B*D,U) ; % Capping D
        
    % Update the projection matrix after rescaling
    [Q,~] = qr(D*AA',0) ;
    P = Q*Q' ;
    
    % ** Dual rescaling
    % Find all possible directions for rescaling Lperp
    e = max(zLperp/sum(max(PP*zLperp,0))-1,0) ;
       
    % Update the rescaling matrix 
    B = eye(length(zLperp)) + diag(e) ;
    DD = min(B*DD,U) ; % Capping DD
       
    % Update the projection matrix after rescaling
    [QQ,~] = qr(DD*A',0) ;
    PP = QQ*QQ' ;
    k = k+1 ;
end

if (k > 0); k = k-1 ; end 

Total = totalprimal + totaldual ; % Compute the total number of iterations