%{
Técnicas de Control - Curso 2022/23
 UD1- Ejercicio 2 
Fuyutsuky
%}

%***************Definición e inicialización de variables:****************

a=0 %Coeficiente del polo
b=0 %Coeficiente del cero
ts=1 %Tiempo de muestreo
den=[1 -a] %Denominador de FDT
num=[b]    %Numerador de FDT
phi=[0.9 0.1] %Matriz de coeficientes

%Recorremos la matriz de coeficientes phi y creamos las diferentes
%funciones de transferencia, ejecutando despues la prueba con entrada
%escalon
prompt="Introduzca el valor del periodo de control: "
m = input(prompt) %Pedimos al usuario el valor del periodo de control m
for i=1:m
    a=phi(1,1)
    b=1-(a^i) %obtenemos b^m de la ecuacion b=1-a^m
    den=[1 -a^i] %modificamos el valor de a siendo a^m
    num=[b]
    Z=tf(num,den,ts)
    polos = pole(Z)
    %***************Ânalisis de respuesta escalon**************
    y =step(Z)
    n=length(y);
    k=0:1:n-1;
    stem(k,y);    
    fprintf("Mostrando respuesta escalón, para m=%d Pulse una tecla para continuar",i)
    pause
end