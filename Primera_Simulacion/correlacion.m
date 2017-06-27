function [ C ] = correlacion( N,H,n1,n2,q )
% Arroja la correlacion  en el eje q
% entre los espines de los sitios
% n1 y n2 dado en numero total de espines N y la
% matriz hamiltoniana H.
% q representa el eje, donde x es 1, y es 2, y z es 3
%% Matrices de Pauli
sx=[0,1;1,0];
sy=[0,-1i;1i,0];
sz=[1,0;0,-1];
I=eye(2); % Identidad
% Gran matriz de espines. git
S=cat(3,I,sx,sy,sz);
% Usamos sólo el eje requerido
S=cat(3,I,S(:,:,q+1));
%% Estado base hamiltoniano
[V,~]=eig(H);
P0=V(:,1);
%%
s=1;
for j=1:N
    s=kron(s,S(:,:,(j==n1|j==n2)+1));
end
C=P0'*s*P0;
end

