#################################################
# ejemplo3.R
# Laboratorio de Procesamiento de Informaci?n Meteorol?gica/Oceanogr?fica
# 2? cuatrimestre 2021
################################################################

# testea si pi elevado a la e es mayor o igual a e elevado a la pi

# variables de entrada
# no tiene

# variables de salida
# texto en pantalla

##################################################################

# el numero de euler "e" (2.7183...) est? defnido por exp(1) en R
# exp(2) es e al cuadrado
# expm1(x) computes exp(x) - 1:

###################################################################
  
e=exp(1)

a=e^pi
sprintf('e elevado a la pi = %s',a)
b=pi^e
sprintf('pi elevado a la e = %s',b)

if (b>=a) 
 print('pi elevado a la e es mayor o igual a e elevado a la pi') else 
  print('e elevado a la pi es mayor o igual a pi elevado a la e')

