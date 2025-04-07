function y = rollPitchYawAngles(matriz)
    % ROLLPITCHYAWANGLES Calcula os ângulos RAG (Rolagem, Arfagem, Guinada) a partir de uma matriz de rotação 3x3.
    %
    %   y = rollPitchYawAngles(matriz)
    %
    %   Esta função recebe uma matriz de rotação 3x3 e retorna os ângulos RAG
    %   no formato [theta, phi, psi], correspondentes à:
    %       theta - Arfagem (Pitch)
    %       phi   - Rolagem (Roll)
    %       psi   - Guinada (Yaw)
    %
    %   Os ângulos são retornados em graus e assumem uma convenção de extrair os ângulos
    %   a partir da matriz de rotação com base na sequência de rotações: Yaw → Pitch → Roll.
    %
    %   Entrada:
    %       matriz - matriz de rotação 3x3 (assumida como válida e ortonormal)
    %
    %   Saída:
    %       y - vetor linha [theta, phi, psi] com os ângulos RAG (em graus)
    %
    %   Exemplo:
    %       R = [cosd(30) -sind(30) 0;
    %            sind(30)  cosd(30) 0;
    %            0         0        1];
    %       angulos = rollPitchYawAngles(R);
    %
    %   A função também imprime os ângulos calculados no console no formato:
    %       Theta = ...
    %       Phi   = ...
    %       Psi   = ...

    y(2) = atan2d(matriz(2,1),matriz(1,1)); % phi
    y(1) = atan2d(-matriz(3,1),(matriz(1,1)*cosd(y(2))) + (matriz(2,1)*sind(y(2)))); % theta
    y(3) = atan2d(-matriz(2,3)*cosd(y(2)) + matriz(1,3)*sind(y(2)), matriz(2,2)*cosd(y(2)) - matriz(1,2)*sind(y(2))); % psi
    
    fprintf('Theta = %.2f \nPhi = %.2f \nPsi = %.2f \n', y(1), y(2), y(3));
end