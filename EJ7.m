
%{
Técnicas de Control - Curso 2022/23
 UD1- Ejercicio 7 
Fuyutsuky
%}

%***************Definición e inicialización de variables:****************

a1=0; 
a2=0;
b1=0;
b2=0;
f=0;
ts=0.01 %Tiempo de muestreo
den=[1 -a1 -a2] %Denominador de FDT
num=[b1 b2]    %Numerador de FDT
phi=[0.9 0 0.1 0 0.25;0.9 0 0.1 0 0.75; 1 -0.25 0.333 0.166 0.25;1 -0.25 0.333 0.166 0.75] %Matriz de coeficientes

%Recorremos la matriz de coeficientes phi y creamos las diferentes
%funciones de transferencia, ejecutando despues la prueba con entrada
%escalon e imprimiendo la gráfica asi como lugar de las raices
for i=1:4
    a1=phi(i,1)
    a2=phi(i,2)
    b1=phi(i,3)
    b2=phi(i,4)
    f=phi(i,5)
    %Funcion de transferencia del sistema sin ruido
    den=[1 -a1 -a2] %Denominador de FDT
    num=[b1 b2 0]    %Numerador de FDT
    fprintf("Funcion de salida sin filtro:")
    Z=tf(num,den,ts)
    polos=pole(Z)
    ceros=zero(Z)
    modulo=abs(polos)
    ganancia=dcgain(Z)
    %Funcion del Filtro
    fprintf("Funcion de filtro:")
    denFiltro=[f 0]
    numFiltro=[1 (1-f)]
    F=tf(numFiltro,denFiltro,ts)
    polosF=pole(F)
    cerosF=zero(F)
    moduloF=abs(polosF)
    %Funcion con filtro
    fprintf("Funcion de salida con filtro:")
    ZF=(Z*F)
    polosZF=pole(ZF)
    cerosZF=zero(ZF)
    moduloZR=abs(polosZF)
    ganaciaZF=dcgain(ZF)
    pause
    %***************Ânalisis de respuesta escalon**************
    y =step(Z)
    n=length(y);
    k=0:1:n-1;
    stem(k,y);    
    fprintf("Mostrando respuesta escalón en i=%d:, salida sin filtro. Pulse una tecla para continuar",i)
    pause
    yF =step(ZF)
    n=length(yF);
    k=0:1:n-1;
    stem(k,yF); 
    fprintf("Mostrando respuesta escalón en i=%d:, salida con filtro. Pulse una tecla para continuar",i)
    pause
end