
function [X, Y] = trapecio (x0, y0, xf, n, F_in)
    h = (xf - x0) / (n-1);
    X = [x0: h: xf];
    Y = zeros(1, length(X));
    Y(1) = y0;

    for i = 2:length(X)
        E(i) = Y(i-1) + h * F_in(X(i-1), Y(i-1));
        Y(i) = Y(i-1) + h * (F_in(X(i-1), Y(i-1)) + F_in(X(i), E(i)))/2;
    endfor
end

