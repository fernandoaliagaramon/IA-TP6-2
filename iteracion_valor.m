function [U,Q,iter,util] = iteracion_valor(T, R, discount_factor)
% Resuelve la ecuaci�n de Bellman iterativamente.
% T(s,a,s') es la matriz de transici�n y R(s,a) la matriz de acciones.
% 'U' es el vector de utilidad para todos los estados
% 'Q' es el valor de Q de la ecuaci�n de Bellman
% 'iter' es el n�mero de iteraciones realizadas.

% Dimensiones del vector de estados
S = size(T,1);

% Valor inicial de V igual a R
oldV = max(R,[],2);

% Algoritmo de iteracion_valor. 
% Calcula Q y de ella las Utilidades V, hasta convergencia definica por un
% umbral de error.
% Utiliza la funci�n �Q_from_V� para resolver la ecuaci�n de Bellman
% Se puede utilizar la funci�n 'approxeq(V, oldV, thresh)' para obtener la
% condici�n de finalizaci�n.


done = 0;

thresh = 10^(-4);

iter = 1;
while ~done
  iter = iter + 1;
  Q = Q_from_V(oldV, T, R, discount_factor);
  U = max(Q,[],2);
  if approxeq(U, oldV, thresh)
      done = 1;
  end
  oldV = U;
  util(iter,:) = U';
end