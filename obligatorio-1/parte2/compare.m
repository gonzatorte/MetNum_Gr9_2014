
load euler.m
load trapecio.m

function compare(x0, f, F)
    [X, Ye] = euler(x0, f(x0), 20, 10, F);
    [X_, Yt] = trapecio(x0, f(x0), 20, 10, F);
    assert(X_, X);
    X_w = [X(1): 0.1: X(length(X))];
    Y_w = arrayfun(f, X_w);

    hold on;
    plot(X,Ye, 'dr;euler;','markersize', 10, 'markeredgecolor', 'r', 'markerfacecolor', 'r', 'linewidth', 3);
    plot(X,Yt, '+r;trapecio;','markersize', 15, 'markeredgecolor', 'b', 'markerfacecolor', 'b', 'linewidth', 5);
    plot(X_w,Y_w, '-b;original;');
    hold off;
end

function pause()
    input('>','s');
end

% Voy a hace la prueba con la de y(x) = e^x
% La exponencial cumple que es igual a su derivada
f = @exp;
F = @(x, y) y;
x0 = 1;
compare(x0, f, F);

pause();

% Voy a hace la prueba con la de y(x) = sqrt(2*x)
%%%%%%%%% 
%dy/dx = 1/y
%y dy = dx
%(y^2)/2 = x
%y = sqrt(2*x)
%%%%%%%%% 
f = @(x, y) sqrt(2*x);
F = @(x, y) 1/y;
x0 = 1;
compare(x0, f, F);

pause();

% Voy a hace la prueba con la de y(x) = ln(x)
%%%%%%%%% 
%dy/dx = 1/x
%y = log(x)
%%%%%%%%% 
f = @log;
F = @(x, y) 1/x;
x0 = 1;
compare(x0, f, F);

pause();

% Voy a hace la prueba con la de y(x) = x
f = @(x) x; %Identidad
F = @(x, y) 1;
x0 = 1;
compare(x0, f, F);

pause();
