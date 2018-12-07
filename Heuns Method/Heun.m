function [t,y] = Heun(dydt, tspan, y0, h, es, maxit)

% Heuns Method Algorithm:
% This algorithm uses heuns method to solve differential equations.
% For inputs of only 4 or 5 values, function auto fills remaining spots.
% Algorithm checks for not producing extraneous output
% the function finds the numerical solution to the differential equation dydt, 
% over the span tspan, with an initial condition y0, and step size h. 
% The variables es and maxit should be optional and default to 0.001 and 
% 50 if a user does not specify values for those inputs. es and maxit refer 
% to the stopping criterion and maximum number of iterations, respectively, 
% for iterations involving the predictor-corrector.
% 




if nargin == 4              % check for number of arguemnts
    es = 0.001;             % auto fill for 4 inputs
    maxit = 50;
else nargin == 5            % check for number of arguemnts
    maxit = 50;             % auto fill for 5 inputs
end


[m,n] = size(tspan);

if m==1 && n==2;
     
    t= [tspan(1):h:tspan(2)];               %create vector for domain values
    y= y0;                                  %create range vector, y axis, increasing
    tt = length(t);            
    
    for i = [1:tt-1];
           EA= 100000;                  % error start
           iter= 1;                     % iteration start
           
           %predictor for first iteration
           y(i+1) = y(i)+dydt(t(i),y(i))*h; 
           

           while iter <= maxit && EA >= abs(es)             %correcting values
               
                 y1  = y(i+1);
                 
                 %Correction Equation
                 y(i+1)=y(i)+(dydt(t(i+1),y(i+1))+dydt(t(i),y(i)))/2*h; 
                 y2=y(i+1);
                 
                 EA= abs(((dydt(t(i+1),y2)-dydt(t(i+1),y1))/dydt(t(i+1),y2))*100);
                 
                 iter  = iter + 1;
           end
        end
  plot(t,y,'-o')
  grid  
  xlabel('t')           %domain
  ylabel('y')           %range
  title('Function using Heuns Method')
  
else
    error('Span of tspan may be inncorrect')
end



end