function sol = resolver_sistema(equacoes, variaveis)
    % RESOLVER_SISTEMA Resolve um sistema de equações simbólicas.
    %
    %   sol = resolver_sistema(equacoes, variaveis)
    %
    % Entrada:
    %   - equacoes: Um vetor de equações simbólicas
    %   - variaveis: Um vetor das variáveis a serem resolvidas
    %
    % Saída:
    %   - sol: Estrutura contendo as soluções para as variáveis
    %
    % Exemplo de uso:
    %   syms x y
    %   eqs = [x + y == 5, x - y == 1];
    %   sol = resolver_sistema(eqs, [x, y]);

    % Resolver o sistema de equações
    sol = solve(equacoes, variaveis);

    % Exibir os resultados
    disp('Soluções encontradas:')
    disp(sol)
end