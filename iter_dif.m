% Indica a solução do sistema linear Ay=d, bem como as aproximações obtidas pelo método de SOR para vários omega. 
%
% Input
% >> select - Seleciona sistema a ser testado (ver load_sistema)
% >> n - Dimensão do sistema
% >> Nmax - Numero máximo de iterações
% >> omega - Parâmetro de relaxação
% >> epsilon - Tolerância para paragem do cálculo de iteradas
% 
% Output
% >> k - Índice da iterada máxima calculada
% >> y_h - Solução do sistema linear
% >> y_hw - Vetor com a maior iterada calculada para cada omega

function [k, y_h, y_hw] = iter_dif(select, n, Nmax, omega, epsilon)
    
    % Load de sistema pretendido
    [A,d,y_0] = load_sistema(select, n);

    % Resoolução do sistema linear Ay=d
    y_h = linsolve(A,d);

    % Inicialização dos outputs
    y_hw=zeros(n,length(omega));
    k = zeros(1,length(omega));
     
    % Para cada omega
    for j = 1:length(omega)

        % Método de SOR
        [y_iteradas, k(j)] = SOR_dif(A, d, y_0, Nmax, omega(j), epsilon, y_h);

        % Seleção da maior iterada
        y_hw(:,j) = y_iteradas(:, end);

    end
end