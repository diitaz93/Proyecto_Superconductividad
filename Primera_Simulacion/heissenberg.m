function[H]=heissenberg(N,Jx,Jy,Jz)
%%%%%%%%%%%%%%%%% HAMILTONIANO DE HEISSENBERG %%%%%%%%%%%%%%
% Genera la matriz del Hamiltoniano de Heissenberg en 1D con
% condiciones de frontera fijas.
% Jx, Jy, Jz son las constantes de intercambio para cada eje
% y N es el numero de espines
%-----------------------------------------------------------
%% Incluye anisotropia con parámetros variables
% if nargin==2
%     J=varargin{1};
%     N=varargin{2};
% elseif nargin==4
%     Jx=varargin{1};
%     Jy=varargin[2};
%     Jz=varargin{3};
%     N=varargin{4};
% end
%% Anisotropia modo facil
J=[Jx,Jy,Jz];
%% Definici�n de matrices de Pauli
sx=[0,1;1,0];
sy=[0,-1i;1i,0];
sz=[1,0;0,-1];
I=eye(2); % Identidad
%% Gran matriz de espines. 
% Es una matriz en 3D con la primera capa la identidad, y las siguientes 
% capas las matrices de Pauli en orden x, y , z.
S=cat(3,I,sx,sy,sz);
%% Matriz de coeficientes
% Ver documentacion
M=matriz(N);
% Se inicializa el hamiltoniano en cero
H=0;
% Se empieza por calcular los t�rminos de cada eje x,y o z
for d=1:3
    % Se recorre la matriz de coeficientes
    % Por fila
    for i=1:N-1
        t=1; % Se inicializa el t�rmino del hamiltoniano en 1
        % Por cada entrada de la fila
        for j=1:N
            % Producto tensorial con identidad o matriz de Pauli
            t=kron(t,S(:,:,d*M(i,j)+1));
        end
        H = H + J(d)*t;
    end
end
end
        