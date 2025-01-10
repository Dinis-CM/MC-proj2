%% Aplicacao metodo de SOR

% Da display, para diversos omega, do numero de iteradas necessarias para a 
% solução de Ax=d calculada por linsolve menos a aproximada pelo metodo de
% SOR tiver norma infinita inferior a epsilon

% Inputs:
%   x - valores de x para qual se pretende calcular y
%   Nmax - Numero maximo de iteracoes
%   epsilon - Criterio de paragem
%   omega - Valores de omega a testar

function iter_diff(x, Nmax, epsilon, omega)
     
    % Inicializacao de valores
    n = length(x);
    A = diag(200.1 * ones(1,n)) + diag(-100 * ones(1,n-1), 1) + diag(-100 * ones(1,n-1), -1);
    d = -1 * ones(n,1);  
    x_0 = zeros(n, 1);

    % Solucao do sistema linear Ax=d
    y_h = linsolve(A,d);
     
    % Iteracao pelo metodo de SOR da solucao do sistema linear Ax=d
    for i = 1:length(omega)

        % Número de iteradas calculadas
        % Criterio de paragem com norm(y_h - iterada calculada, inf) < epsilon
        iter(i) = SOR_diff(A, d, x_0, Nmax, omega(i), epsilon, y_h);

    end

    % Tabela de iter para cada omega
    NomeColunas = arrayfun(@(i) sprintf('omega = %.1f', omega(i)), 1:length(omega), 'UniformOutput', false);
    disp(array2table(iter, 'VariableNames', NomeColunas, 'RowNames',  {'Iterada máxima'}));

end