% Para A simétrica, dá display se esta não for determinada positiva.
% Determinação efetuada pela positividade dos menores principais.
%
% Input
% >> select - Seleciona matriz A a ser testado (ver load_sistema)
% >> n - Vetor das várias dimensões de A a serem testadas

function check_positiva_definida(select, n)

    % Para cada dimensão que se pretende testar
    for i = 1:length(n)

        % Load de A pretendido
        A = load_sistema(select,n(i));

        % Para todos as submatrizes principais pretendidas
        for j = 1:n(i)
            
            sub_A = A(1:j,1:j);
            
            % Verifica positividade dos menores principais, 
            if det(sub_A) <= 0
                % Display se para aquele n não for
                fprintf('Para n=%.0f , A não é definida positiva \n', n(i));
                break;
            end
      
        end
    end
end