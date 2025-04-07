function y = matriz_rotacao(caracter, x)
    % MATRIZ_ROTACAO Calcula a matriz de rotação 3D em torno do eixo fornecido.
    %
    %   y = MATRIZ_ROTACAO(caracter, x)
    %
    %   Entrada:
    %       x - Ângulo de rotação em graus (em torno do eixo fornecido).
    %
    %   Saída:
    %       y - Matriz de rotação 3x3 associada à rotação em torno do eixo fornecido.
    %
    %   Exemplo de uso:
    %       R = matriz_rotacao('x', 30);
    %       Isso irá gerar a matriz de rotação em torno do eixo X com um ângulo de 30 graus.
    %
    %   Obs: A matriz de rotação é usada em transformações geométricas 3D para rotacionar 
    %        pontos ou objetos no plano YZ (em torno do eixo X).

    isNumero = false;
    if ~isa(x, 'sym')
        x = sym(x);
        isNumero = true;
    end

    switch caracter
        case 'x'

            if(isNumero)
                y = [1 0 0;                    % Primeira linha: sem rotação no eixo X (componente fixo)
                0 cosd(x) -sind(x);        % Segunda linha: rotação no eixo Y e Z
                0 sind(x) cosd(x)];        % Terceira linha: rotação no eixo Y e Z
            else
                y = [1 0 0;                    % Primeira linha: sem rotação no eixo X (componente fixo)
                0 cos(x) -sin(x);        % Segunda linha: rotação no eixo Y e Z
                0 sin(x) cos(x)];        % Terceira linha: rotação no eixo Y e Z
            end
        
        case 'y'

            if(isNumero)
                y = [cosd(x) 0 sind(x);  % Primeira linha: rotação no eixo X e Z
                    0 1 0;               % Segunda linha: sem rotação no eixo Y (componente fixo)
                    -sind(x) 0 cosd(x)]; % Terceira linha: rotação no eixo X e Z
            else
                y = [cos(x) 0 sin(x);  % Primeira linha: rotação no eixo X e Z
                    0 1 0;               % Segunda linha: sem rotação no eixo Y (componente fixo)
                    -sin(x) 0 cos(x)]; % Terceira linha: rotação no eixo X e Z
            end

        case 'z'

            if(isNumero)
                y = [cosd(x) -sind(x) 0;  % Primeira linha: rotação em torno de Z no eixo X e Y
                    sind(x) cosd(x) 0;   % Segunda linha: rotação em torno de Z no eixo X e Y
                    0 0 1];               % Terceira linha: não há rotação no eixo Z (homogeneidade)
            else
                y = [cos(x) -sin(x) 0;  % Primeira linha: rotação em torno de Z no eixo X e Y
                    sin(x) cos(x) 0;   % Segunda linha: rotação em torno de Z no eixo X e Y
                    0 0 1];               % Terceira linha: não há rotação no eixo Z (homogeneidade)
            end

        otherwise
            disp('O eixo fornecido não é válido.')
                
    end
    
    % Exibe a matriz de rotação no console
    fprintf('A matriz de rotação é \n');
    disp(y);
end
