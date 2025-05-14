function dh = denavit(a, alpha, d, teta)
    % DENAVIT Gera a matriz de transformação homogênea usando os parâmetros DH.
%
%   dh = DENAVIT(a, alpha, d, teta) retorna a matriz de transformação 4x4
%   baseada na convenção de Denavit-Hartenberg (DH), que é amplamente usada
%   na modelagem cinemática de manipuladores robóticos.
%
%   Entradas:
%       a     - Distância entre os eixos z_{i-1} e z_i ao longo de x_{i-1}
%       alpha - Ângulo entre os eixos z_{i-1} e z_i ao longo de x_{i-1} (em graus ou rad)
%       d     - Distância entre os eixos x_{i-1} e x_i ao longo de z_i
%       teta  - Ângulo entre os eixos x_{i-1} e x_i ao longo de z_i (em graus ou rad)
%
%   Saída:
%       dh    - Matriz de transformação homogênea 4x4 correspondente aos parâmetros DH
%
%   Observações:
%       - Se todos os parâmetros forem numéricos, os ângulos são considerados em GRAUS.
%       - Se algum dos parâmetros for simbólico (sym), os ângulos são considerados em RADIANOS.
%       - A matriz resultante é usada para descrever a transformação entre dois elos consecutivos.
%
%   Exemplos:
%       % Com valores numéricos (graus):
%       T = denavit(1, 90, 2, 45)
%
%       % Com valores simbólicos (radianos):
%       syms a alpha d theta
%       T = denavit(a, alpha, d, theta)
%
%   Veja também: sym, cos, sin, cosd, sind


    isNumero = false;
    % Definir as variáveis como simbólicas se não forem numéricas
    if ~isa(teta, 'sym') && ~isa(d, 'sym') && ~isa(a, 'sym') && ~isa(alpha, 'sym')
        isNumero = true;
    end

    if isNumero
    dh = [cosd(teta) -cosd(alpha)*sind(teta) sind(alpha)*sind(teta) a*cosd(teta)
          sind(teta) cosd(alpha)*cosd(teta) -sind(alpha)*cosd(teta) a*sind(teta)
          0 sind(alpha) cosd(alpha) d
          0 0 0 1];
    else
        dh = [cos(teta) -cos(alpha)*sin(teta) sin(alpha)*sin(teta) a*cos(teta)
          sin(teta) cos(alpha)*cos(teta) -sin(alpha)*cos(teta) a*sin(teta)
          0 sin(alpha) cos(alpha) d
          0 0 0 1];
    end
end