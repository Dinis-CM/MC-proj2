% Dá plot do raio espectral da matriz iteradora C(omega) do sistema Ax=d em função de omega
%
% Input
% >> select - Seleciona sistema a ser testado (ver load_sistema)
% >> n - Dimensão do sistema

function y_h = linsolve_dif(select,n)

    % Load do sistema
    [A,d] = load_sistema(select,n);

    % Resolução do sistema linear A * y_h = d
    y_h = linsolve(A,d);

end