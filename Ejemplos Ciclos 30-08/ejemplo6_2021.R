#################################################
# ejemplo6.R
# Laboratorio de Procesamiento de Informaci?n Meteorol?gica
# 2? cuatrimestre 2021
################################################

# Cual es el mayor valor de N tal que la suma 1^2 + 2^2 + 3^2 + ... + N^2 
# sea menor que 100 y N sea menor que 5 

# variables de entrada
# no tiene

# variables de salida
# texto en pantalla

####################################################################

#Es un while vs if ¿Quien corta primero?

suma=0
n=0
while (suma<100){ #Mientras suma sea menor a 100
suma=suma+n^2    #operamos
print(c(n, suma)) #imprimime los resultados

n=n+1            #le sumamos 1 a n
if (n>4) break ##### cambie de lugar el break por eso le sumo 1!!!! #PERO si n>5 CORTA EL CICLO
}

print('El valor de N es')
print(n-2)

####### HACER SOLOS ##############

#AHORA CAMBIO LA CONSIGNA

# Cual es el mayor valor de N tal que la suma 1^2 + 2^2 + 3^2 + ... + N^2 
# sea menor que 100 

# y N sea menor que 7    <-ESTE ES EL CAMBIO

# ?DONDE HACEN ESTE CAMBIO?
# ?QUE DIFERENCIA HAY EN LO QUE SE IMPRIME POR PANTALLA?

