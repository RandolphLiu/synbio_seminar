K_u = 0.5; K_v = 0.5;    % the dissociate (sensitivity) constants
% K_u = 0.5; K_v = 1.0;    % a failed switch due to sensitivity mismatch
alpha_u = 1; alpha_v = 1;    % the expression coefficient
beta = 1;    % the degradation coefficient
% n_u = 1.5; n_v = 1.5;    % a failed switch due to low cooperativity
n_u = 4; n_v = 4;

% the vector field
[U, V] = meshgrid(0:0.1:1.5, 0:0.1:1.5);
dUdt = alpha_u ./ (1 + (V/K_v).^n_v) - beta * U;
dVdt = alpha_v ./ (1 + (U/K_u).^n_u) - beta * V;
nU = dUdt ./ sqrt(dUdt.^2 + dVdt.^2);    % normalized
nV = dVdt ./ sqrt(dUdt.^2 + dVdt.^2);

% nullcline
x = 0:0.02:1.5;
nucU = (alpha_u/beta) ./ (1 + (x/K_v).^n_v);
nucV = (alpha_v/beta) ./ (1 + (x/K_u).^n_u);

hold on
quiver(V, U, nV, nU, 0.4)    % normalized
% quiver(U, V, dUdt, dVdt)    % the original vectors
plot(x, nucU)
plot(nucV, x)
axis([0 1.5 0 1.5])
xlabel('U'); ylabel('V')
leg = legend('$(\frac{dU}{dt},\frac{dV}{dt})$', '$\frac{dU}{dt}=0$', '$\frac{dV}{dt}=0$');
set(leg, 'Interpreter', 'latex')
set(leg, 'FontSize', 12)
set(gcf,'Position',[100 100 500 500])