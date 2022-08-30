#ejercicio 1. práctica 1
.Machine$double.eps #distancia entre 1 y el primer número de precisión doble distinto y mayor que 1
.Machine$double.neg.eps #distancia entre 1 y el primer número de precisión doble distinto y menor que 1
.Machine$double.xmin # mínimo nro. que puede ser representado por la computadora
.Machine$double.xmax # máximo nro. que puede ser representado por la computadora
.Machine$double.base # base numérica en la que trabaja la computadora
.Machine$double.digits # signo del número + mantisa
.Machine$integer.max # mayor nro. entero que puede ser representado por la computadora

k<-1 
is.integer(k) # pregunto si k es un número entero (para R)
y<-as.integer(3)
class(y) # pregunto qué tipo de elemento es y
texto<-"cadena123"
texto
x<-3.14
as.character(x) # transformo a x en un caracter
name<-"Juan";lname<-"Perez"
paste(name,lname,sep=" ")
substr("María tiene un perro lindo",start=3,stop=12)
sub("perro","gato","María tiene un perro lindo")
nombre<-readline("Ingrese su nombre:")

#Arme un código que : 

# 1. Elimine todos los posibles elementos del Enviroment
# 2. Fije su espacio de trabajo en una carpeta del escritorio con su nombre
# 3. Defina: 
# 
# x <- 12.3
# y <- 12L
# 
# 4. Indiqué de qué clase son x e y 
# 5. Indiqué si son de doble precisión 
# 6. Imprima por pantalla la frase ("DCAO 2022") sin comillas 
# 7. Repita el ítem anterior pero en dos pasos:
#   Pida por pantalla el año actual 
#   Pegue la palabra "DCAO" y el año ingresado para formar la frase del punto 7
#   Imprima el resultado por pantalla
#Ayuda: utilice la función readline o print de R

#***Aclaración: Comente en cada paso que está realizando

rm(list=ls()) # con este comando borro todas las variables creadas previamente
getwd() # con este comando obtengo el directorio de trabajo actual
setwd("/home/clinux01/Escritorio") # con este comando determino el directorio de trabajo
x<-12.3 # Asigno a la variable "x" el valor 12.3
class(x) # con este comando obtengo el tipo de elemento que es la variable "x" (numeric)
y<-12L # Asigno a la variable "y" el valor 12 y lo defino como número entero en R (L del final)
class(y) # idem que en 48 para y (integer)
is.double(x) # con este comando determino si la variable "x" como está definida es un elemento de doble precisión
is.double(y) # idem que 51 pero para la variable "y"
print("DCAO 2022",quote=FALSE) #con quote=false le pido que lo imprima sin comillas
añoactual<-readline("Ingrese el año actual:") #creo una variable que sea el resultado de lo ingresado en la consola
print(paste("DCAO",añoactual,sep=" "),quote=FALSE) #uso paste para separar las palabras concatenado
