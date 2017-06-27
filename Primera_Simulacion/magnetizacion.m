function [ M ] = magnetizacion(N,H)
% Devuelve el valor esperado de la magnetizacion
% de una cadena de espines dado el numero de espines N
% y la matriz hamiltoniana
%% Matrices de pauli
sz=[1,0;0,-1];
I=eye(2); % Identidad
% Gran matriz de espines z
Sz=cat(3,I,sz);
%% Inicializacion de magnetizacion
M=zeros([N,1]);
%% Vector estado base del Hamiltoniano
[V,~]=eig(H);
P0=V(:,1);
%%
for i=1:N
    S=1;
    for j=1:N
        S=kron(S,Sz(:,:,(j==i)+1));
    end
    M(i)=P0'*S*P0;
end
end

