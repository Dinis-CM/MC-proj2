function isPositiveDefinite = APositivaDefinida(n)
    
    isPositiveDefinite = true;

    for i = 3:n
    
        % Define A segundo estilo exposto em III.I
        A = diag([7, 9 * ones(1, i-1)]) + diag([5, 2 * ones(1, i - 2)], 1) + ...
            diag([5, 2 * ones(1, i - 2)], -1) + diag(-1 * ones(1, i - 2), 2) + ...
            diag(-1 * ones(1, i - 2), -2) + diag(-1 * ones(1, i - 3), 3) + ...
            diag(-1 * ones(1, i - 3), -3); 
        
        if det(A)<=0
            isPositiveDefinite = false;
        end
    end
end    
