%% Verificacao se A simetrica e definida positiva
% Para A de dimensão n, verifica se A e simetrica e definida positiva 
% pela decomposicao de Cholesky 

for n=3:1000

    A = diag([7, 9 * ones(1, n-1)]) + diag([5, 2 * ones(1, n - 2)], 1) + ...
            diag([5, 2 * ones(1, n - 2)], -1) + diag(-1 * ones(1, n - 2), 2) + ...
            diag(-1 * ones(1, n - 2), -2) + diag(-1 * ones(1, n - 3), 3) + ...
            diag(-1 * ones(1, n - 3), -3); 

    try chol(A);
    catch ME
        disp('Para n=%d a matriz A nao e simetrica definida positiva.', n)
    end

end