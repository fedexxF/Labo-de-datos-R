##################################################################
# # Laboratorio de Procesamiento de Informaci�n Meteorol�gica (Oceanogr�fica)

# 2� cuatrimestre 2022
##################################################################

# Clase_objetos   ALUMNOS

##################################################################

## LOS PRIMEROS EJEMPLOS que se ven durante la clase los tienen que tipear ustedes

# comienzo en el diapositiva 29
getwd()

prueba<-'genero una cadena de caracteres'
class(prueba)
prueba2=substr(prueba,8,15)


nombre='Juan'
apellido='Perez'

iniciales=as.character(c("",""))
iniciales[1]=substr(nombre,1,1) #Sustrae del nombre la primer letra y lo devuelve con iniciales
iniciales[2]=substr(apellido,1,1)
iniciales
completo<-paste(nombre,apellido,sep=" ") #a completo, devuelve nombre + apellido, el sep, es el espacio entre caracteres)
completo


rm(list=ls()) #Remueve todos los datos de las variables asginadas!

###############################
nombre='Marta'
edad='25'
ls.str()
completo=paste(nombre,as.character(edad),sep=" ") #Hay que forzar que la edad sea un caracter


#################################
mes=07
exp='Test01'
titulo=paste0(exp,", mes",as.character(mes),", Temp") #Notar que algunas cosas tiene "", estamos llamando nuemas variables o Strings para ser usadas.

##############################
c(1:10)
cumsum(1:10)
cumprod(1:10)
z<-c(3:1,2:0,4:2)
cummax(z)
cummin(z)


range(5:1)
prod(5:1)
sum(1:7)

x<-c(T,T,F,F)
y<-c(T,F,T,F)
x&y
x|y
xor(x,y)
any(x)
all(x)


#Ejercicios en clases, asignar vareables y usar distintos comandos.
#Tanto en la consola como en el script!
#Con crlt+enter se corren las lineas en el script
#Con enter se corren las lineas en la terminal

x<-2
print(x)
class(x)
x<6/2

#Ahora asignamos valores a x1 
x1<-6/2 
print(x1)
class(x1)

#ASignar explicitamente un numero entero

x2<-23L;print(x2)   #Puedo separar con ";" o usar un renglon aparte
class(x2)           #Obtenemos un "integer"!!! Enterooooooooo   

#hacemos vectores ahora

c(4,2,-8)  #Creamos el vector (no tiene utilidad esto)
u<- c(4,2,-8) #Asignamos al vector una letra u. Lo llamamos u

assign("w",c(4,2,-8)) #Asignamos al vector una letra W. Lo llamamos W

#Asignar NA a la variable x

x3<- NA
x3 + 1 

#Asignar al vector y dos NA

y1<-c(x3,3,5,x3)

#Calcular la media teniendo en cuenta los NA

mean(y1)

#Calcular la media SIN tener en cuenta NA

mean(y,na.rm=TRUE)

#Vemos que pasa con las raicez imaginarias
sqrt(-17)
sqrt(-17+0i)

#Veamos que pasa con las indeterminaciones 
x4<-5/0
exp(-x4)

exp(x4)-exp(x4)

#Asignavos numeros del 1 al 10 para x5 y vemos que tipo de dato es
x5<-c(1:10)
is.numeric(x5)
is.vector(x5)
is.complex(x5)
is.character(x5)
is.double(x5)
#Asignamos numeros del 1 al 10 para x6 y lo forzamos a ser un character.
#Vemos como la variable toma valores pero los da entre "".
x6<-c(1:10)
x6<-as.character(x6)

# 

x7<-c(1,3)
mode(x7)  #Devuelve el tipo de dato
length(x7) #Devuelve la longitud
str(x7)    #Devuelve el objeto

.last.value(x7) 

object.size(x7) #Tamaño del objeto

ls.str(x7)
ls(x7)