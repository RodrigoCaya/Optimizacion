% Use this editor as a MiniZinc scratch book

var int: c = value; %capacidad bin
set of int: bins = 1..u; %i
set of int: item = 1..n; %j

array[1..u] of var 0..1: y; %y_i
array[1..u,1..n] of var 0..1: x; %x_ij


%Restricciones

%Primera restricción, donde j corresponde a w_j en la función, que corresponde al valor del número
constraint forall(i in bins)(sum(j in item)(j * x[i,j]) <= c * y[i]); 
%Segunda restricción
constraint forall(j in item)(sum(i in bins)(x[i,j]) = 1);

%Función Objetivo
solve minimize sum(i in bins)(y[i]);
