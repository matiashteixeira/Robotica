function matriz = transformacao_homogenea(caracter, theta, x, y, z)
    % TRANSFORMACAO_HOMOGENEA Calcula a matriz de transformação homogênea
    % em torno do eixo informado, incluindo rotação e translação.
    %
    %   matriz = TRANSFORMACAO_HOMOGENEA(caracter, theta, x, y, z)
    %
    %   Entrada:
    %       caracter - Eixo que será relaizada a rotação.
    %       theta - Ângulo de rotação em graus (em torno do eixo X).
    %       x, y, z - Coordenadas de translação (em relação ao ponto de origem).
    %
    %   Saída:
    %       matriz - Matriz de transformação homogênea 4x4 que inclui rotação
    %                em torno do eixo informado e a translação especificada por x, y, z.
    %
    %   Exemplo de uso:
    %       T = transformacao_homogenea_x('x', 45, 1, 2, 3);
    %       Isso irá gerar uma matriz de transformação homogênea com rotação de 45 graus
    %       ao longo do eixo X e translação de 1, 2, 3 nas direções X, Y e Z, respectivamente.
    %
    
    isNumero = false;
    % Definir as variáveis como simbólicas se não forem numéricas
    if ~isa(theta, 'sym')
        theta = sym(theta);
        isNumero = true;
    end
    if ~isa(x, 'sym')
        x = sym(x);
    end
    if ~isa(y, 'sym')
        y = sym(y);
    end
    if ~isa(z, 'sym')
        z = sym(z);
    end

    switch caracter

        case 'x'

            if(isNumero)
                matriz = [1 0 0 x; 
                    0 cosd(theta) -sind(theta) y; 
                    0 sind(theta) cosd(theta) z; 
                    0 0 0 1];
            else
                matriz = [1 0 0 x; 
                    0 cos(theta) -sin(theta) y; 
                    0 sin(theta) cos(theta) z; 
                    0 0 0 1];
            end

        case 'y'
            if(isNumero)
                matriz = [cosd(theta) 0 sind(theta) x; 
                    0 1 0 y; 
                    -sind(theta) 0 cosd(theta) z; 
                    0 0 0 1];
            else
                matriz = [cos(theta) 0 sin(theta) x; 
                    0 1 0 y; 
                    -sin(theta) 0 cos(theta) z; 
                    0 0 0 1];
            end

        case 'z'

            if(isNumero)
                matriz = [cosd(theta) -sind(theta) 0 x;  % Primeira linha: rotação e translação no eixo X
                    sind(theta) cosd(theta) 0 y;  % Segunda linha: rotação e translação no eixo Y
                    0 0 1 z;                      % Terceira linha: rotação e translação no eixo Z
                    0 0 0 1];                     % Última linha fixa para homogeneidade
            else
                matriz = [cos(theta) -sin(theta) 0 x;  % Primeira linha: rotação e translação no eixo X
                    sin(theta) cos(theta) 0 y;  % Segunda linha: rotação e translação no eixo Y
                    0 0 1 z;                      % Terceira linha: rotação e translação no eixo Z
                    0 0 0 1];                     % Última linha fixa para homogeneidade
            end

        otherwise
            disp('O eixo indicado não existe! Matriz de transformação homogênea não foi calculada!');
            return;
    end

    % Exibe a matriz no console
    fprintf('A transformação homogênea é:\n');
    disp(matriz);
end
