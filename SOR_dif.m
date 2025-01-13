% Aproxima a solução x de um sistema linear Ay = d, correspondente a uma equação diferencial, pelo método de SOR
%
% Input
% >> A - Matriz real A do sistema
% >> d - Vetor real d do sistema
% >> y_0 - Iterada inicial
% >> Nmax - Numero máximo de iterações
% >> omega - Parâmetro de relaxação
% >> epsilon - Tolerância para paragem do cálculo de iteradas
% >> y_h - Vetor da resolução linear do sistema 
% 
% Output
% >> y_iteradas - Vetor com todas as iteradas
% >> k - Índice da iterada máxima calculada

function [y_iteradas, k] = SOR_dif(A, d, y_0, Nmax, omega, epsilon, y_h)
   
    D = diag(diag(A)); % Diagonal de A
    L = tril(A, -1);  % Matriz estritamente inferior de A
    U = triu(A, 1);  % Matriz estritamente superior de A
    y_iteradas = [y_0, zeros(length(y_0), Nmax)]; % Inicialização do vetor das iteradas
    y_hw_k = y_0; 

   % Cálculo das iteradas
    for k = 1:Nmax
        
        y_hw_k1 = (omega*L + D) \ (omega*d - ((omega-1)*D + omega*U) * y_hw_k);
       
        % Adiciona nova iterada ao vetor
        y_iteradas(:,k+1) = y_hw_k1;
        
        % Verifica o critério de paragem
        if norm(y_h - y_hw_k1, inf) < epsilon
            break;
        end

        % Atualiza iterada utilizada no calculo da seguinte
        y_hw_k = y_hw_k1;    

    end
    
    % Limpa iteradas não calculadas
    y_iteradas = y_iteradas(:, 1:k+1);

end