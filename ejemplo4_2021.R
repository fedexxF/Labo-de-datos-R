#################################################
# ejemplo4.R
# Laboratorio de Procesamiento de Informaci?n Meteorol?gica
# 2? cuatrimestre 2021
################################################

# Calcular la suma de los n primeros t?rminos de la sucesi?n 1, 2x, 3x^2,
# 4x^3, ...

# variables de entrada
# n: n?mero de t?rminos a sumar
# x: n?mero al cual se le aplica la sucesi?n

# variables de salida
# texto en pantalla
#######################################################################
# programa
print('?Cu?ntos t?rminos quieres sumar? ')
n<-scan()      #Le damos "enter" dos veces porque sino me sigue pidiendo valores de "n"
print('Dame el valor del numero x ')
x<-scan()     #Le damos "enter" dos veces porque sino me sigue pidiendo valores de "x"
suma=0        #Primero la inicializamos, va a valer 0
for (i in 1:n) {   #Recorre de 1 a n (osea 4)
  suma=suma+i*x^(i-1) #Haceme suma=suma+i*x^(i-1)
}

print('El valor pedido es')
print(suma)

print(paste("el valor pedido es"," ",suma))

