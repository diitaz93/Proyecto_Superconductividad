function [M] = matriz(N)
% MATRIZ crea la matriz de coeficientes.
% Cada fila es un término en el que se debe hacer producto tensorial
% entre sus entradas:
% Si es 1, va una matriz de Pauli,
% si es 0, va la identidad.
M=zeros([N-1,N]);
for i=1:N-1
    for j=1:N
        if j==i||j==i+1
            M(i,j)=1;
        else
            M(i,j)=0;
        end
    end
end

end

