% Dá load dos diversas sistemas Ax=d enunciados, para executar as outras funções
% 
% Input
% >> select - Seleção do sistema pretendido.
%   >> 0 - Sistema de teste (A estritamente dominante aleatória)
%   >> 1 - Sistema da Parte III.I
%   >> 2 - Sistema da Parte III.II
% >> n - Dimensão do sistema
% 
% Output
% >> A - Matriz real A do sistema
% >> d - Vetor real d do sistema
% >> x_0 - Iterada inicial


function [A,d,x_0]= load_sistema(select, n)
    
    % Matriz simétrica estritamente dominante aleatória
    if select == 0
        A = rand(n); 
        A = (A + A')/2 + 2 * n * eye(n);
        d = sum(A, 2);
        x_0 = rand(n,1);

    %  Matriz III.I
    elseif select == 1
        A = diag([7, 9 * ones(1, n-1)]) + diag([5, 2 * ones(1, n - 2)], 1) + ...
            diag([5, 2 * ones(1, n - 2)], -1) + diag(-1 * ones(1, n - 2), 2) + ...
            diag(-1 * ones(1, n - 2), -2) + diag(-1 * ones(1, n - 3), 3) + ...
            diag(-1 * ones(1, n - 3), -3); 
        d = ones(n,1);
        x_0 = zeros(n, 1);   

    % Matriz III.II
    elseif select == 2
        A = diag(200.1 * ones(1,n)) + diag(-100 * ones(1,n-1), 1) + diag(-100 * ones(1,n-1), -1);
        d = -1 * ones(n,1);  
        x_0 = zeros(n, 1);
    end
end