
function [root, fx, ea, iter] = falsePosition (func, xl, xu, es, maxiter)

% falsePosition Function:
% function that uses the false position algorithm to find the roots of any
% function input

% func = the function being evaluated 
% xl = the lower guess
% xu = the upper guess
% es = the desired relative error (default to 0.0001)
% maxiter = number of iterations (default to 200)
% root = estimated root location
% fx = function value at the root
% ea = approximate relative error
% iter = number of iterations performed 

if nargin < 3           % Check for required amount of inputs
    error('at least 3 input arguments are required to compute function');
end 
if isempty('es') == 0         % es defaults to 0.0001 if not input
    es = 0.0001;
end
if isempty('maxiter') == 0        % maxiter defaults to 200 if not input
    maxiter = 200;    
end 

while ea>es && iter<maxiter      % false position formula 
    xr = root;
    if (func(xl)*func(xu))>0        % less than zero, incorrect bounds
        error('xl and xu are not in ideal bounnds')
    end 
    root = xu-((func(xu)*(xl-xu))/(func(xl)-func(xu)));

    if (func(xl)*func(root))<0      % evaluate test greater than Zero
        xu = root;
    else 
        xl = root;
    end 
    
    if iter > 0
        ea = (abs((xr-root)/(root)))*100;
    end 
    
    iter = iter+1;
end 
fx = func(root);
fprintf('The root is %.2f\n. The function evaluated at the root is %.2f\n. The approximate relative error is %f\n. The number of iterations performed was %.1f\n', root, xf,ea, iter)
end 
