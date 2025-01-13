% Resolução da pergunta 3 da parte III.II do enunciado

% Variáveis utilizadas
select = 2;
n = 9;
Nmax = 100;
i = 14:18;
omega = 0.1*i;
epsilon = 10^-10;

% Aplicação do método de SOR
[k, y_h, y_hw] = iter_dif(select, n, Nmax, omega, epsilon);

% Tabela da resolução do sistema por linsolve - y_h e das iteradas máximas pelo método
% de SOR -y_hw (indicação do omega utilizado e índice da maior iterada calculada, k).
NomeColunas = [{'y_h'} arrayfun(@(i) sprintf('y_hw || ω = %.1f || k = %d', omega(i), k(i)), 1:length(i), 'UniformOutput', false)];
disp(array2table([y_h y_hw], 'VariableNames', NomeColunas));
