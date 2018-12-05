function [L, U, P, Invm] = luFactor(A)
% This is a LU factorization function!!!
% It will take matrix A and apply LU factorization to get matricies L, U
% and P. 
% A - the coefficient matrix
% L - lower matrix
% U - upper matrix
% P - the pivot matrix
% Check the number of function inputs and outputs (vector and scalar inputs)
% Make sure to Clear variables in workspace prior to running tests

[m,n] = size(A);        % Identify dimensions of matrix, col & row
if m > n;
    warning('over constrained system of equations, ignoring extra equations');
    m=n;       % error if input is incorrect
elseif m < n
    error('Too many variables, cannot solve system');
else
               % do do anything   
end

L=eye(m);

P=eye(m);

for y=1:n-1
    
    [~,maxr]=max(abs(A(y:m,y)));
    maxr=maxr+y-1;
    Atp=A;                  % Upper traignular matrix
    % Set up to pivot A
    A(y,:)=A(maxr,:);   
    A(maxr,:)=Atp(y,:); 
    
    Ptp=P;  
    % Set P to pivot point
    P(y,:)=P(maxr,:);
    P(maxr,:)=Ptp(y,:);
    
    if y ~= 1                % as if j=1,j-1=0. Improper coordinates.
        
        Ltp = L;             % lower triangular matrix
        % set L to pivot
        L(y,1:y-1) = L(maxr,1:y-1);
        L(maxr,1:y-1) = Ltp(y,1:y-1);
    end
    
    for x= y+1:m
        
        if  A(y,y)~=0                             % check for division by zero, this is bad
            L(x,y)=A(x,y)/A(y,y);                    
            A(x,:)=A(x,:)-L(x,y)*A(y,:);
        end                                 % Loop condition skips column if not square...
    end
end

U=A;
% Finding Inverse: ADDITION TO MY LU function
INF=zeros(n);         %Start inverse matrix
for y=1:n
    d = INF(:,y);
    z = d;
    
        
    for x=1:n           % Forward Sub
        if x==1
        d(1)=P(1,y);
        else
        d(x)=P(x,y)-(L(x,1:x-1)*d(1:x-1));
        end
    end
    
    for x=1:n              % Backwards SUB
        xsub = n+1-x;
        
        if xsub ==n           % First element, BACK SUB
        z(n)=d(n)/U(n,n);
        
        else                  % Rest of BACK SUB
        z(xsub) = (d(xsub)-(U(xsub,xsub+1:n)*z(xsub+1:n)))/U(xsub,xsub);
        end
        
    end
    Invm(:,y)=z;            % Assign final value
    
end


end
