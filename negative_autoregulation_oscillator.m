beta1=1; beta2=1;    % degradation rate
alpha1=1; alpha2=1;    % promoter strength
Kd=0.1; n=50;    % dissociation constant, Hill coefficient

% neg. autoregulation captured by a 2-step model 
% (transcription + translation)
% can behave as a damped oscillator
tspan = [0 10];
dPdt = @(t,P) [beta1*Kd^n/(Kd^n+P(2)^n)-alpha1*P(1); beta2*P(1)-alpha2*P(2)];
[t, P] = ode45(dPdt , tspan, [0;0]);
plot(t,P(:,2))
xlabel('t'); ylabel('Fluo')
hold on