function f =  Umu(v,mu,u0)
% Solves argmin u'*v + 0.5*mu*\|u-u0\|^2 over u in Delta

% Initialization
n = length(v) ;
u = -v/mu + u0 ;
usort = sort(u) ;
sumvalue = zeros(n,1) ;
lambda = 0 ;

for i = n-1: -1: 1
    lambda = usort(i) ;
    g = (n-i)*(usort(i+1) - usort(i)) ;
    sumvalue(i) = sumvalue(i+1) + g ;
    if sumvalue(i) >=1
        lambda = (1-sumvalue(i))*((usort(i+1)-usort(i))/(sumvalue(i+1)-sumvalue(i)))+ usort(i) ;
        break;
    end
    if (i == 1)
        lambda = usort(1) + (sumvalue(1)-1)/n ;
    end
end
f = max(zeros(n,1), u-lambda*ones(n,1)) ;