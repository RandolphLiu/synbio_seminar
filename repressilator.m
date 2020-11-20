% three-component repressilator

alpha=[1 3 1 1];    % promoter strength
beta=[2 2 2 2];    % degradation rate
Kd=[0.2 0.2 0.2 0.2];    % dissociation constant
n=[4 4 4 4];    % Hill coefficient
P0 = [1;1;0;0];    % protein boundary conditions
tspan = [0 20];

dPdt = @(t,P) [alpha(1)*Kd(1)^n(1)/(Kd(1)^n(1)+P(3)^n(1))-beta(1)*P(1);
    alpha(2)*Kd(2)^n(2)/(Kd(2)^n(2)+P(1)^n(2))-beta(2)*P(2);
    alpha(3)*Kd(3)^n(3)/(Kd(3)^n(3)+P(2)^n(3))-beta(3)*P(3)];
[t, P] = ode45(dPdt , tspan, P0(1:3));
figure; hold on
plot(t,P(:,1)); plot(t,P(:,2)); plot(t,P(:,3))
xlabel('t'); ylabel('Fluo')