
function [X, Y] = euler (x0, y0, xf, n, F_in)
    h = (xf - x0) / (n-1);
    X = [x0: h: xf];
    Y = zeros(1, length(X));
    Y(1) = y0;

    for i = 2:length(X)
        % Y(X(i)) = Y(X(i-1)) + h * F_in(X(i-1), Y(X(i-1)));
        Y(i) = Y(i-1) + h * F_in(X(i-1), Y(i-1));
    endfor
end

function compare(x0, f, F)
    [X, Ye] = euler(x0, f(x0), 20, 10, F);
    Y = arrayfun(f, X);
    compare(X,Y,Ye);

    hold on;
    plot(X,Ye, 'dr;euler;','markersize', 10, 'markeredgecolor', 'r', 'markerfacecolor', 'r', 'linewidth', 3);
    plot(X,Y, '-b;original;');
    hold off;
end

% Voy a hace la prueba con la de y(x) = e^x
% La exponencial cumple que es igual a su derivada
f = @exp;
F = @(x, y) y;
x0 = 1
compare(x0, f, F);

% Voy a hace la prueba con la de y(x) = sqrt(2*x)
%%%%%%%%% 
%dy/dx = 1/y
%y dy = dx
%(y^2)/2 = x
%y = sqrt(2*x)
%%%%%%%%% 
f = @log
F = @(x, y) 1/x;
x0 = 1
compare(x0, f, F);

% Voy a hace la prueba con la de y(x) = ln(x)
%%%%%%%%% 
%dy/dx = 1/x
%y = log(x)
%%%%%%%%% 
f = @log
F = @(x, y) 1/x;
x0 = 1
compare(x0, f, F);

% Voy a hace la prueba con la de y(x) = x
f = @(x) x; %Identidad
F = @(x, y) 1;
x0 = 1
compare(x0, f, F);
