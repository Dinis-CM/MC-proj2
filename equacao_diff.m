%% Calculo analitico eq diferencial y
% Calcula os valores de ySol(k), solucao da eq diferencial y''-0.1y =1
% para um dado k
%
% Inputs:
% k - Vetor dos valores para qual se pretende determinar ySol(k)
%
% Outputs:
% out - ySol(k) para k input

function out = equacao_diff(k)

% Definicao da eq diferencial
syms y(x)
ode = diff(y,x,2) -0.1 * y(x) == 1;
conds = [y(0) == 0; y(1) == 0];

% Resolucao da eq diferencial
ySol = matlabFunction(dsolve(ode,conds));

% Calculo de ySol para k dado
out = ySol(k');

end
