% Dá plot do raio espectral da matriz iteradora C(omega) do sistema Ax=d em função de omega
%
% Input
% >> select - Seleciona matriz A a ser testada (ver load_sistema)
% >> n - Vetor das várias dimensões de A a serem testadas
% >> i - Vetor auxiliar aos varios omega a ser calculados (1:19 para garantir convergência)      

function plot_raio_espectral(select, n, i)
    
    % Valores de omega a ser testados
    omega = 0.1 * i;

    % Para cada dimensão que se pretende testar
    for j = 1:length(n)
        
        % Load de A pretendido
        A = load_sistema(select,n(j));

        % Para cada omega
        for k = 1:length(i)

            % Cálculo da matriz C e respetivo raio espectral
            C = eye(n(j)) - omega(k) * A /(omega(k)*tril(A, -1) + diag(diag(A)));
            rho(k) = max(abs(eig(C)));

        end

        % Plot de rho por omega
        plot(omega, rho,'o');
        hold on

    end

    hold off
    xlabel('ω'); % Nome do eixo x
    ylabel('ρ'); % Nome do eixo y
    ylim([0 1]); % Limite do eixo y
    title('Raio Espectral em função de ω') % Titulo do gráfico

end

