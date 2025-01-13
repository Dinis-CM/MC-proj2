% Resolução da pergunta 4 da parte III.II do enunciado

% Variáveis utilizadas
select = 2;
n = 9;
Nmax = 100;
i = 14:18;
omega = 0.1*i;
epsilon = 10^-10;

% Solução da equação diferencial
xlarge = linspace(0, 1, 50);
f = @(x) -10 + (10 - (10 * exp(sqrt(10) / 10) - 10 * exp(sqrt(10) / 5)) / (-exp(sqrt(10) / 5) + 1)) * exp((sqrt(10) / 10) * x) + ...
    ((10 * exp(sqrt(10) / 10) - 10 * exp(sqrt(10) / 5)) / (-exp(sqrt(10) / 5) + 1)) * exp((-sqrt(10) / 10) * x);
y = f(xlarge);

% Aplicação do método de SOR
xsmall = linspace(0.1, 0.9, 9);
[k, y_h, y_hw] = iter_dif(select, n, Nmax, omega, epsilon);

% Gráfico com a solução por todos os métodos
plot(xlarge,y, '-', xsmall,y_h, 'o', xsmall,y_hw, 'o');

xlabel('x'); % Nome do eixo x
ylabel('y(x)'); % Nome do eixo y
ylim([-0.14 0]); % Limite do eixo y
title('Solução para os vários métodos') % Titulo do gráfico
legend('EDO', 'y_h', 'y_h^{1.4}', 'y_h^{1.5}', 'y_h^{1.6}', 'y_h^{1.7}', 'y_h^{1.8}'); %Legenda
