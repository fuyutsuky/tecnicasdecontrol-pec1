%{
Técnicas de Control - Curso 2022/23
 UD1- Ejercicio 1 
Fuyutsuky
%}

%***************Definición e inicialización de variables:****************

a=0 %Coeficiente del polo
b=0 %Coeficiente del cero
ts=0.01 %Tiempo de muestreo
den=[1 -a] %Denominador de FDT
num=[b]    %Numerador de FDT
phi=[0.4 0.6; 0.9 0.1;1.0 0.1;1.1 0.1] %Matriz de coeficientes
H= tf([1],[1 0],ts) %definimos una funcion realimentacion unitaria

%Recorremos la matriz de coeficientes phi y creamos las diferentes
%funciones de transferencia, ejecutando despues la prueba con entrada
%escalon e imprimiendo la gráfica asi como lugar de las raices
for i=1:4
    a=phi(i,1)
    b=phi(i,2)
    den=[1 -a]
    num=[b]
    Z=tf(num,den,ts,'IODelay',10)
    Z1=tf(num,den,ts)
    %***************Ânalisis de respuesta escalon**************
    y =step(Z)
    n=length(y);
    k=0:1:n-1;
    stem(k,y);  
    polos = pole(Z)
    fprintf("Mostrando respuesta escalón de caso %d, Pulse una tecla para continuar",i)
    pause
    %********************Lugar de las raices ***********************
    %Se hace en lazo cerrado con realimentacion unitaria
    ZH=feedback(Z1, H)
    polosLR = pole(ZH) 
    moduloPolo = abs(polos)
    fprintf("Mostrando lugar de las raices de caso:%d , pulse una tecla para continuar",i)
    rlocus(Z1*H) 
    pause
end