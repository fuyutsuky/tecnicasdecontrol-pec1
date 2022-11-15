%{
Técnicas de Control - Curso 2022/23
 UD1- Ejercicio 4 
Fuyutsuky
%}

%***************Definición e inicialización de variables:****************

a1=0; 
a2=0;
b=0;
ts=0.01 %Tiempo de muestreo
den=[1 -a1 -a2] %Denominador de FDT
num=[b]    %Numerador de FDT
phi=[1.2 -0.7 0.17;1.2 -0.45 0.25;1.2 -0.72 0.52;1.2 -1 0.8;1.2 -1.17 0.97] %Matriz de coeficientes
H= tf([1],[1 0],ts) %definimos una funcion realimentacion unitaria

%Recorremos la matriz de coeficientes phi y creamos las diferentes
%funciones de transferencia, ejecutando despues la prueba con entrada
%escalon e imprimiendo la gráfica asi como lugar de las raices
for i=1:5
    a1=phi(i,1)
    a2=phi(i,2)
    b=phi(i,3)
    den=[1 -a1 -a2]
    num=[b 0]
    Z=tf(num,den,ts)
    polos = pole(Z)
    modulo = abs(polos)
    %***************Ânalisis de respuesta escalon**************
    y =step(Z)
    n=length(y);
    k=0:1:n-1;
    stem(k,y);    
    fprintf("Mostrando respuesta escalón en i=%d:,Pulse una tecla para continuar",i)
    pause
end