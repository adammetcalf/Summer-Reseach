function [d,i,rts] = quadratic(a,b,c) 
% QUADRATIC calculates the type of roots of a quadratic equation

   d = b^2 - 4*a*c;
   if (d<0)
      i = 0;
   elseif (d>0)
      i = 2;
   else
      i = 1;
   end
   
   % rts output for exercise 4.1.3 only.
   rts = roots([a,b,c]); % rts output for exercise 4.1.3 only.