
function [X, Y] = euler (x0, Y0, xf, n, F_in)
    h = (xf - x0) / (n-1);
    X = [x0: h: xf];
    Y = zeros(size(Y0)(2),length(X));
    Y(:,1) = Y0;

    for i = 2:length(X)
        % Y(X(i)) = Y(X(i-1)) + h * F_in(X(i-1), Y(X(i-1)));
        Y(:,i) = Y(:,i-1) .+ h .* F_in(X(i-1), Y(:,i-1))';
    endfor
end
