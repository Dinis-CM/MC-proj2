%% Implementacao do metodo de SOR

% Aproxima a solução x de um sistema linear Ax = d
% Inputs:
% A - Matriz do sistema
% d - Vetor real do sistema
% x_0 - Iterada inicial
% Nmax - Número máximo de iterações
% omega - Parâmetro do método
% epsilon - Critério de paragem
% y_h - resolucao linear do sistema 
%
% Outputs:
% k - iterada maxima

function k = SOR_diff(A, d, x_0, Nmax, omega, epsilon, y_h)
   
    D = diag(diag(A)); % Diagonal de A
    L = tril(A, -1);  % Matriz triangular inferior de A
    U = triu(A, 1);  % Matriz triangular superior de A
    y_hw_prev = x_0; 

    % Calculo das iteradas
    for k = 1:Nmax
        y_hw = (omega*L + D) \ (omega*d - ((omega-1)*D + omega*U) * y_hw_prev);
        
        % Verifica o criterio de paragem
        if norm(y_h - y_hw, inf) < epsilon
            break;
        end

        % Atualiza iterada utilizada no calculo da seguinte
        y_hw_prev = y_hw;      
    end

end