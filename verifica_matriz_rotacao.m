function verifica_matriz_rotacao(matrix)
    % VERIFICA_MATRIZ_ROTACAO Verifica se uma matriz fornecida é uma matriz de rotação.
    %
    %   VERIFICA_MATRIZ_ROTACAO(matrix)
    %
    %   Entrada:
    %       matrix - Matriz que será verificada para determinar se é uma matriz
    %                de rotação. 
    %
    %   A função verifica duas condições principais:
    %   1. Se a matriz é ortogonal (inv(matrix) = transpose(matrix)).
    %   2. Se o determinante da matriz é igual a 1 (det(matrix) == 1).
    %
    %   Se ambas as condições forem atendidas, a função conclui que a matriz é uma matriz de rotação.
    %   Caso contrário, ela é considerada não sendo uma matriz de rotação.
    
    % Verifica se o determinante da matriz é zero, indicando que a matriz é singular.
    if det(matrix) == 0
        fprintf('A matriz fornecida não é uma matriz de rotação.\n');
        return;  % Se a matriz for singular, ela não é uma matriz de rotação, então retornamos
    end

    % Verifica se a matriz é ortogonal. Uma matriz de rotação deve ser ortogonal,
    % ou seja, a inversa da matriz deve ser igual à sua transposta.
    ortogonal = all(abs(inv(matrix) - transpose(matrix)) < 1e-6, 'all');
    
    % Verifica se a matriz é ortogonal e se seu determinante é 1.
    if det(matrix) == 1 && ortogonal
        fprintf('A matriz fornecida é uma matriz de rotação.\n');
    else
        fprintf('A matriz fornecida não é uma matriz de rotação.\n');
    end
end
