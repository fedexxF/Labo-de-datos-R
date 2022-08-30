#################################################
# ejemplo5.R
# Laboratorio de Procesamiento de Informaci?n Meteorol?gica
# 2? cuatrimestre 2021
################################################# 

# Cu?l es el mayor valor de N tal que la suma 1^2 + 2^2 + 3^2 + ? + N^2 
# sea menor que 10 

# variables de entrada
# No tiene

# variables de salida
# texto en pantalla
######################################################################
#Este ciclo lo que hace es preguntarse si "suma" es menor a 10, si es verdadero, se opera. 
#Osea que n llega hasta 4 (osea que recorre 3 veces la sentencia)
#OJO porque con n = 3 la suma nos da 14 pero como n=n+1 esta al final del ciclo, entonces le suma 1 a n igual. Osea n=4 PERO ahora
#EL señor ciclo while se pregunta "che, pero suma es menor a 10?", ya habiamos visto que suma = 14. 
#Entonces corta el ciclo con n =4 y no sigue operando.

suma=0;
n=0;
print(c('n', 'suma')) #cartel para la salida de valores
while (suma<10){ #Mientras se cumple esto, me haces esto
suma=suma+n^2    # Opera
print(c(n, suma))  # muestra los valores en pantalla en la misma linea
n=n+1;            #a n anda sumandole 1
}

print('El valor de N es')
print(n-2)
 
