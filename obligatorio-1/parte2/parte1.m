
%%Parametros
alfa = 1;
M = @(X, t) \
    [1, 1, 1; \
     1, X(1,:)(t)/(1-X(2,:)(t)), 0; \
     0, 0, 0];

%%Inicializacion
x1 = zeros(1,10);
x2 = zeros(1,10);
x3 = zeros(1,10);

x1 = [1:1:10];
x2 = [1:2:20];
x3 = [1:3:30];

X = [x1; x2; x3];
%%Gi = @(X, t) (alfa .* M(X,t)') - M(X,t);
%% Gt = @(X, t) (1-alfa) .* X(t)' * M(X,t) * X(t);
Gi = @(X, t) (alfa .* M(X,t)') - M(X,t);
Gt = @(X, t) (1-alfa) .* X(t)' * M(X,t) * X(t);

Fh = @(x_h, g_h, Gt) gama * (g_h-Gt) ); 
Fi = @(x_i, g_i, g_h, Gt) - gama * x_i * (g_h-g_i) ); 

%%F = @(X, t) Gi_X = Gi(X, t) ; [_, Gm_i] = max(Gi_X) ; dX(Gm_i) = Fh(X(Gm_i,t),Gi_X(Gm_i),)