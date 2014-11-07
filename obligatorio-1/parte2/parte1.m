
load euler.m
load trapecio.m


%%Parametros
global alfa;
alfa = 1;
global gama;
gama = 0.5;
M = @(X_t) \
    [1, 1, 1; \
     1, X_t(1)/(1-X_t(2)), 0; \
     0, 0, 0];

%%Inicializacion
x1 = zeros(1,10);
x2 = zeros(1,10);
x3 = zeros(1,10);

% x1 = [1:1:10];
% x2 = [1:2:20];
% x3 = [1:3:30];

X = [x1; x2; x3];


%% FUNCIONES

%% Gi = @(X, t) (alfa .* M(X,t)') - M(X,t);
%% Gt = @(X, t) (1-alfa) .* X(t)' * M(X,t) * X(t);
global Gi_;
Gi_ = @(X_t) (X_t*((alfa .* M(X_t)') - M(X_t)));
function [Gi_x] = Gi(X, t)
    global Gi_;
    X_t = X(:,t)
    Gi_x = Gi_(X_t);
end

global Gt;
Gt = @(Gi_X_t, X_t) (Gi_X_t * X_t');

global Fh;
Fh = @(x_h, g_h, Gt) gama * (g_h-Gt);
Fi_ = @(X, g_h_minus_Gi_X) -gama .* X .* (g_h_minus_Gi_X);
global Fi;
Fi = @(X, Gi_X, g_h) Fi_(X,g_h.-Gi_X);

function [dX] = F_(X_t)
    global Gi_;
    global Gt;
    global Fh;
    global Fi;
    Gi_X_t = Gi_(X_t);
    [_, Gm_i] = max(Gi_X_t);
    Gt(Gi_X_t, X_t);
    dX_h = Fh(X_t(Gm_i),Gi_X_t(Gm_i),Gt(Gi_X_t, X_t));
    X_resto = [X_t(1:Gm_i-1),0,X_t(Gm_i+1:length(Gi_X_t))];
    Gi_resto = [Gi_X_t(1:Gm_i-1),0,Gi_X_t(Gm_i+1:length(Gi_X_t))];
    dX = Fi(X_resto,Gi_resto,Gi_X_t(Gm_i));
    dX(Gm_i) = dX_h;
end

function [dX] = F(t, X)
    if (size(X)(2) == 1)
        X_t = X';
    else
        X_t = X(:,t)';
    end
    dX = F_(X_t);
end

t0 = 1;
n = 20;
tf = t0 + 10;
X0 = [1,2,3]';

[X_graf,Y_graf] = euler (t0, X0', tf, n, @F);

X_graf
Y_graf

hold on;
plot(X_graf,Y_graf, 'dr;euler;','markersize', 10, 'markeredgecolor', 'r', 'markerfacecolor', 'r', 'linewidth', 3);
plot(X_graf,Y_graf, '-b;euler;');
hold off;


function pause()
    input('>','s');
end

pause();