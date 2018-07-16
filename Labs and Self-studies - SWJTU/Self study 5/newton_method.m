function xnew = newton_method(xold, N)
% Calculate new value of x based on previous 

xnew = xold - (355*xold - 300*sin(xold) - N)/(355 - 300*cos(xold));

end