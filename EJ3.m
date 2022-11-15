%{
Técnicas de Control - Curso 2022/23
 UD1- Ejercicio 3 
Fuyutsuky
%}

%***************Definición e inicialización de variables:****************

a1=0; 
a2=0;
b=0;
ts=0.01 %Tiempo de muestreo
den=[1 -a1 -a2] %Denominador de FDT
num=[b]    %Numerador de FDT
phi=[1.6 -0.64 0.04; 1 -0.25 0.25;0.4 -0.04 0.64;1 -0.16 0.16; 1.9 -0.88 0.02] %Matriz de coeficientes
H= tf([1],[1 0],ts) %definimos una funcion realimentacion unitaria

%Recorremos la matriz de coeficientes phi y creamos las diferentes
%funciones de transferencia, ejecutando despues la prueba con entrada
%escalon e imprimiendo la gráfica asi como lugar de las raices
for i=1:5
    a1=phi(i,1)
    a2=phi(i,2)
    b=phi(i,3)
    den=[1 -a1 -a2]
    num=[b]
    Z=tf(num,den,ts)
    polosZ = pole(Z)
    %***************Ânalisis de respuesta escalon**************
    y =step(Z)
    n=length(y);
    k=0:1:n-1;
    stem(k,y);    
    fprintf("Mostrando respuesta escalón en i=%d:,Pulse una tecla para continuar",i)
    pause
    %********************Lugar de las raices***********************
    ZH=feedback(Z, H)
    polos = pole(ZH) 
    moduloPolo = abs(polos)
    fprintf("Mostrando lugar de las raices,pulse una tecla para continuar")
    rlocus(ZH) 
    pause
end