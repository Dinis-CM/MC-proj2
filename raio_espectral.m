%% Calculadora Raio Espectral
% Para cada valor de omega na particao [0.1;1.9] com passo de 0.1, e para
% cada n dimensao da matriz A, calcula o raio espectral da matriz C(omega)
% 
% Da um plot para cada omega da evolucao do raio espectral da matriz 
% C(omega) em funcao de n

% Circula pelos varios omega
for i = 1:19

    omega = i * 0.1;

    figure(i) % Seleciona a figura respetiva ao omega
   
    % Circula para A de diferentes dimensoes
    for n = 3:100

        % Define A segundo estilo exposto em III.I
        A = diag([7, 9 * ones(1, n-1)]) + diag([5, 2 * ones(1, n - 2)], 1) + ...
            diag([5, 2 * ones(1, n - 2)], -1) + diag(-1 * ones(1, n - 2), 2) + ...
            diag(-1 * ones(1, n - 2), -2) + diag(-1 * ones(1, n - 3), 3) + ...
            diag(-1 * ones(1, n - 3), -3); 
        
        D = diag(diag(A)); % Diagonal de A
        L = tril(A, -1); % Matriz triangular inferior de A
        
        C = eye(n) - omega * A /(omega*L + D) ; % Calculo de C(omega)

        rho = max(abs(eig(C))); % Raio espectral de C(omega) para este n
         
        plot(n,rho,'o'); % Da plot de rho em funcao de n
        xlabel('n'); % Nome do eixo x
        ylabel('rho'); % Nome do eixo y
        ylim([0 1]); %Limite do eixo y
        title(['Omega = ', num2str(omega)]) % Nome do gráfico
        hold on
    end

    hold off
    
end