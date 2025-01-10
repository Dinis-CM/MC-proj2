%% Aplicacao metodo de SOR

% Da display da maior iterada calculada pelo metodo de SOR
% Inputs:
% select - Escolha da matriz A, vetor d e vetor x_0 a utilizar:
%   0 - Matriz estritamente dominante aleatória para efeitos de teste do
%       método (tem de dar um vetor com todas as casas a 1)
%   1 - Matriz apresentada no exercicio III.I.1

function input_SOR(select)

    n = 50;
    Nmax = 100;
    omega = 1.2;
    epsilon = 1e-6;
    
    if select ==0
        % Matriz estritamente dominante aleatória
        A = rand(n); 
        A = A + n * eye(n);
        d = sum(A, 2);
        x_0 = rand(n,1);

    elseif select ==1
        % Matriz do exercicio III.I.1
        A = diag([7, 9 * ones(1, n-1)]) + diag([5, 2 * ones(1, n - 2)], 1) + ...
            diag([5, 2 * ones(1, n - 2)], -1) + diag(-1 * ones(1, n - 2), 2) + ...
            diag(-1 * ones(1, n - 2), -2) + diag(-1 * ones(1, n - 3), 3) + ...
            diag(-1 * ones(1, n - 3), -3); 
        d = ones(n,1);
        x_0 = zeros(n, 1);
        
    end
    
    % SOR
    x_iteradas = SOR(A, d, x_0, Nmax, omega, epsilon);
    x_iteradas = x_iteradas(:,size(x_iteradas,2));
    disp(x_iteradas);

end