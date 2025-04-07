function y = eulerAngles(caso, matriz)

% Caso 1: 
% r33 = +-1; theta = 0
% r13 = r23 = r31 = r32 = 0
% phi + psi = atan2d(r21,r11)

% Caso 2:
% r33 < 1;
% theta = atan2d(sqrt(1-r33),r33)
% phi = atan2d(r23,r13)
% psi = atan2d(r32,r31)

    switch caso
    
        case 1
        
            y(1) = 0;
            y(2) = atan2d(matriz(2,1),matriz(1,1));

            fprintf('Theta = %.2f \nPhi + Psi = %.2f \n', y(1), y(2));
    
        case 2
            
            y(1) = atan2d(sqrt(1-matriz(3,3)^2), matriz(3,3));
            y(2) = atan2d(matriz(2,3), matriz(1,3));
            y(3) = atan2d(-matriz(3,2), matriz(3,1));

            fprintf('Theta = %.2f \nPhi = %.2f \nPsi = %.2f \n', y(1), y(2), y(3));
    
        otherwise
            disp('Os casos disponíveis são 1(r33 = 1) e 2 (r33 <1)');
    
    end

end