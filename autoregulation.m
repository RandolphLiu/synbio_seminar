% promoter strength, dissociation constant, degradation rate
alpha = 0.5; K = 0.2; beta = 1;
tspan = [0 8];
[t, P] = ode45(@(t,P) alpha-beta*P, tspan, 0);    % free regulation
% tweak the promoter strength of negative autoregulation
% for it to be the same level as free regulation
alpha_na = alpha*(1+alpha/(beta*K));
[tna, Pna] = ode45(@(t,P) alpha_na*K/(K+P)-beta*P, tspan, 0);
% positive autoregulation
alpha_pa = (alpha+beta*K);
[tpa, Ppa] = ode45(@(t,P) alpha_pa*P/(K+P)-beta*P, tspan, 1E-3);
figure; hold on
plot(t, P)
plot(tna, Pna)
plot(tpa, Ppa)
xlabel('t'); ylabel('[P]')
legend('Free', 'Negative Autoregulation', 'Positive Autoregulation')