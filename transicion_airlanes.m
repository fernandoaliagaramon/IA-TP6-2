function [T,R] = transicion_airlines
% Define la matriz de transición (T) y la de recompensas (R) para el modelo MDP.
% T(s,a,s'): Matriz tridimensional definida como objeto Matlab
% R: Matriz de dimension (nes,nac), siendo 'nes' el numero de estados y
% 'nac' el de acciones

% Definición del número de estados y de acciones
nes=5;
nac=4;

% Define R (nes x nac)

R = zeros(nes,nac);
R(1,:) = 0;
R(2,:) = 1;
R(3,:) = 1;
R(4,:) = 1;
R(5,:) = 2;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matriz Ta auxiliar para calcular T. Ta{a1}, Ta{a2}, ... son matrices de
% dimensión (nes x nac) que define para cada acción 'ai' la matriz de
% transición Ta(s,s')
% Ejemplo: Transición para acción 1
% Ta{1}=[p(1|1) p(2|1) ....     p(nes|1);
%        ...                            ;
%        ...                            ;
%        p(1|nes) p(2|nes) ... p(nes|nes)];
%    


Ta{1}=[0.1 0.7 0 0.2 0;
       0 1 0 0 0;
       0 0 1 0 0;
       0 0 0 1 0;
      0 0 0 0 1]

Ta{2} = [  0   0  1    0   0;
           0.1 0  0.2  0.7 0;
           0   0  0.3  0.7 0;
           0   0  0    1   0;
           0   0  0    0   1]

Ta{3} = [  1   0   0    0   0;
           0   0.2 0    0   0.8;
           0   0   1    0   0;
           0   0   0    1   0;
           0   0   0    0   1]
       
Ta{4} = [  1   0   0    0   0;
           0   1   0    0   0;
           0   0   1    0   0;
           0   0   0.1  0   0.9;
           0   0   0    0   1]
		   

% Calcula T a partir de Ta: T(s,a,s')=P(s'|s,a)
   for i=1:nac
       T(1:nes,i,1:nes)=Ta{i};
   end
   

       


