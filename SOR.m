%% Implementacao do metodo de SOR

% Aproxima a solução x de um sistema linear Ax = d
% Inputs:
% A - Matriz do sistema
% d - Vetor real do sistema
% x_0 - Iterada inicial
% Nmax - Numero máximo de iterações
% omega - Parametro do metodo
% epsilon - Criterio de paragem
%
% Outputs:
% x_iteradas - Vetor das iteradas

function x_iteradas = SOR(A, d, x_0, Nmax, omega, epsilon)
    
    D = diag(diag(A)); % Diagonal de A
    L = tril(A, -1);  % Matriz triangular inferior de A
    U = triu(A, 1);  % Matriz triangular superior de A
    x_iteradas = x_0; %Inicialização do vetor das iteradas
    x_k = x_0; 

    %Calculo das iteradas
    for k = 1:Nmax
        x_k1 = (omega*L + D) \ (omega*d - ((omega-1)*D + omega*U) * x_k);
        x_iteradas = [x_iteradas, x_k1];
        
        % Verifica o criterio de paragem
        if norm(x_k1 - x_k, inf) < epsilon
            break;
        end

        %Atualiza iterada utilizada no calculo da seguinte
        x_k = x_k1;      
    end

end