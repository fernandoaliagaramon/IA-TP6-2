function [p,V,iter]= iteracion_politica(T, R, discount_factor,iter_valor)
% 
% Funci�n que calcula las utilidades y la pol�tica �ptima de acciones:
% Si 'iter_valor=1', ejecuta 'iteracion_valor' para calcular V (valores de
% Utilidad hasta convergencia en U (Utilidad �ptima))

% Si 'iter_valor=0' ejecuta 'determinacion_valor', que calcula V a partir
% de la politica 'oldp' calculada en iteraci�n anterior.

% Devuelve la politica global 'p' �ptima, la Utilidad 'V' a la que ha
% convergido y el n�mero de iteraciones hasta convergencia.

% S=numero de estados, A=numero de acciones, p=pol�tica �ptima
S = size(T,1);
A = size(T,2);
p = zeros(S,1);
Q = zeros(S, A);
oldQ = Q;
oldp = ones(S,1);
iter = 0;
done = 0;


while ~done
  iter = iter + 1;
  if use_val_iter
    V = value_iteration(T, R, discount_factor, V);
  else
    V = value_determination(oldp, T, R, discount_factor);
  end
  Q = Q_from_V(V, T, R, discount_factor);
  [V, p] = max(Q, [], 2);
  if isequal(p, oldp) | approxeq(Q, oldQ, 1e-3)
    done = 1;
  end
  oldp = p;
  oldQ = Q;
end
