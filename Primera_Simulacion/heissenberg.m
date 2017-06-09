%%%%%%%%%%%%%%%%% HAMILTONIANO DE HEISSENBERG %%%%%%%%%%%%%%%%%%%%%%%%
clear all
close all
%clc
tic
J=1; % Constante de intercambio
N=5; % Número de espines
%% Definición de matrices de Pauli
sx=[0,1;1,0];
sy=[0,-1i;1i,0];
sz=[1,0;0,-1];
I=eye(2); % Identidad
%% Gran matriz de espines. 
% Es una matriz en 3D con la primera capa la identidad, y las siguientes 
% capas las matrices de Pauli en orden x, y , z.
S=cat(3,I,sx,sy,sz);
%% Matriz de coeficientes
% Ver documentación
M=matriz(N);
% Se inicializa el hamiltoniano en cero
H=0;
% Se empieza por calcular los términos de cada eje x,y o z
for d=1:3
    % Se recorre la matriz de coeficientes
    % Por fila
    for i=1:N-1
        t=1; % Se inicializa el término del hamiltoniano en 1
        % Por cada entrada de la fila
        for j=1:N
            % Producto tensorial con identidad o matriz de Pauli
            t=kron(t,S(:,:,d*M(i,j)+1));
        end
        H=H+t;
    end
end
H=J*H
t=toc
        