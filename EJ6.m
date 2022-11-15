
%{
Técnicas de Control - Curso 2022/23
 UD1- Ejercicio 6 
Fuyutsuky
%}

%***************Definición e inicialización de variables:****************

a1=0; 
a2=0;
b1=0;
b2=0
ts=0.01 %Tiempo de muestreo
den=[1 -a1 -a2] %Denominador de FDT
num=[b1 b2]    %Numerador de FDT
phi=[1 -0.25 0.416 0.083;1 -0.25 0.333 0.166;1 -0.25 0.294 0.205;1 -0.25 0.263 0.236;1 -0.25 0.238 0.261] %Matriz de coeficientes
H= tf([1],[1 0],ts) %definimos una funcion realimentacion unitaria

%Recorremos la matriz de coeficientes phi y creamos las diferentes
%funciones de transferencia, ejecutando despues la prueba con entrada
%escalon e imprimiendo la gráfica asi como lugar de las raices
for i=1:5
    a1=phi(i,1)
    a2=phi(i,2)
    b1=phi(i,3)
    b2=phi(i,4)
    den=[1 -a1 -a2] %Denominador de FDT
    num=[b1 b2 0]    %Numerador de FDT
    Z=tf(num,den,ts)
    polos=pole(Z)
    ceros=zero(Z)
    modulo=abs(polos)
    ganancia=dcgain(Z)
    pause
    %***************Ânalisis de respuesta escalon**************
    y =step(Z)
    n=length(y);
    k=0:1:n-1;
    stem(k,y);    
    fprintf("Mostrando respuesta escalón en i=%d:,Pulse una tecla para continuar",i)
    pause
end