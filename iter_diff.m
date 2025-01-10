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
       
    n = length(x);
    A = diag(200.1 * ones(1,n)) + diag(-100 * ones(1,n-1), 1) + diag(-100 * ones(1,n-1), -1);
    d = -1 * ones(n,1);  
    x_0 = zeros(n, 1);

    y_h = linsolve(A,d);
     
    for i = 1:length(omega)
        iter(i) = SOR_diff(A, d, x_0, Nmax, omega(i), epsilon, y_h);
    end
    
    NomeColunas = arrayfun(@(i) sprintf('omega = %.1f', omega(i)), 1:length(omega), 'UniformOutput', false);
    disp(array2table(iter, 'VariableNames', NomeColunas));

end