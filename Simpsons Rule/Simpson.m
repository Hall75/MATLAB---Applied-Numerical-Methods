function I = Simpson(x,y)
% function for integrating experimental data using Simpson?s 1/3 rule. 
% function checks if there are an odd number of intervals. 
% if there are, the trapezoidal rule will be used for the last interval.
% algorithm runs for at least 2 different input values
% algorithm checks that it does not produce extraneous output
% Error checks that the inputs are the same length
% Error checks that the x input is equally spaced
% Function warn the user (not an error, just a warning) if the trapezoidal rule has to
% be used on the last interval.


xx = length(x);         % Create lenghts for X and Y
yy = length(y);         % Create lenghts for X and Y


n=diff(x)               % Check for matching intervals for X
            
if min(n)~=max(n)
    error('Spacing between intervals must be equal')       %ERROR displayed
end


if xx~=yy               % Check for if X and Y are equal in length
    error('Vector lengths must be identical')       %ERROR displayed
end


% Even intervals
even_int = mod(xx,2);

if even_int == 0            % If not even, display warning
    warning('Odd number of Intervals, using Trapezoidal Rule Integration')       %Warning to tell user that trap rule is being used instead of simpson
    
    J= xx-1
else 
    J=xx
end

%SIMPSONS Rule

h = (max(x)-min(x))/J;
I = sum(y(1:2:J-2)+(4*y(2:2:J-1))+(y(3:2:J).*h./3);

if even_int == 0
    I = I + (((y(xx-1)+y(xx))/2)*h);
end
    
    
    
    
end