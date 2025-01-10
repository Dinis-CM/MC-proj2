function raio_espectral(n)

    for i = 1:19

        omega = i * 0.1;  
       
        A = diag([7, 9 * ones(1, n-1)]) + diag([5, 2 * ones(1, n - 2)], 1) + ...
            diag([5, 2 * ones(1, n - 2)], -1) + diag(-1 * ones(1, n - 2), 2) + ...
            diag(-1 * ones(1, n - 2), -2) + diag(-1 * ones(1, n - 3), 3) + ...
            diag(-1 * ones(1, n - 3), -3); 
        
        D = diag(diag(A)); % Diagonal de A
        L = tril(A, -1); % Matriz triangular inferior de A
        
        C = eye(n) - omega * A /(omega*L + D) ; % Calculo de C(omega)
    
        rho(i) = max(abs(eig(C))); % Raio espectral de C(omega) para este n
          
    end

    plot(0.1:0.1:1.9,rho,'o'); % Da plot de rho em funcao de n
    xlabel('omega'); % Nome do eixo x
    ylabel('rho'); % Nome do eixo y
    ylim([0 1]); %Limite do eixo y
    title('Raio espectral por omega') % Nome do gráfico
end
