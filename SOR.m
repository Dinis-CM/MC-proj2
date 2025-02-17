% Aproxima a solução x de um sistema linear Ax = d pelo método de SOR
%
% Input
% >> A - Matriz real A do sistema
% >> d - Vetor real d do sistema
% >> x_0 - Iterada inicial
% >> Nmax - Numero máximo de iterações
% >> omega - Parâmetro de relaxação
% >> epsilon - Tolerância para paragem do cálculo de iteradas
% 
% Output
% >> x_iteradas - Vetor com todas as iteradas
% >> k - Índice da iterada máxima calculada


function [x_iteradas, k] = SOR(A, d, x_0, Nmax, omega, epsilon)
    
    D = diag(diag(A)); % Diagonal de A
    L = tril(A, -1);  % Matriz estritamente inferior de A
    U = triu(A, 1);  % Matriz estritamente superior de A
    x_iteradas = [x_0, zeros(length(x_0), Nmax)]; % Inicialização do vetor das iteradas
    x_k = x_0; 


    % Cálculo das iteradas
    for k = 1:Nmax
        
        x_k1 = (omega*L + D) \ (omega*d - ((omega-1)*D + omega*U) * x_k);
        
        % Adiciona nova iterada ao vetor
        x_iteradas(:,k+1) = x_k1;
        
        % Verifica o critério de paragem
        if norm(x_k1 - x_k, inf) < epsilon
            break;
        end

        % Atualiza iterada utilizada no calculo da seguinte
        x_k = x_k1;    

    end
    
    % Limpa iteradas não calculadas
    x_iteradas = x_iteradas(:, 1:k+1);

end