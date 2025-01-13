% Resolução da pergunta 3 da parte III.I do enunciado

% Variáveis utilizadas
select = 1;
n = 50;
Nmax = 100;
omega = 1.2;
epsilon = 1e-6;

% Load dos valores necessários para o cálculo
[A, d, x_0] = load_sistema(select,n);

% Aplicação do método de SOR
x_iteradas = SOR(A, d, x_0, Nmax, omega, epsilon);

% Limpeza e apresentação de resultados
iterada_max = x_iteradas(:,end);
disp(iterada_max);

