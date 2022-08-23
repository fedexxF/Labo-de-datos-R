#Guia 1 Labo de datos
#23/08
#

#------------ej1----------
#Ejecutar e interpretar el resultado del siguiente conjunto de sentencias:
#Todos ocupan 64 bits, son de doble precision


#Es floating mas pequeño positivo que reulta de 1+x!=1
#La dsitancia, epsilon, desde el 1 hasta el siguinete numero de precision doble

.Machine$double.eps

#el epsilon tal que 1-x!=1

.Machine$double.neg.eps

# el numero de punto flotante mas pequeño que puede representar la maquina

.Machine$double.xmin

#el numero de punto flotante mas grande que puede representar la maquina

.Machine$double.xmax

#Es la base para la cual se representa el punto flotante

.Machine$double.base

#la cantidad de digitos en el significado del numero del punto flotante (la mantisa)

.Machine$double.digits

#El entero maximo que puede representar la maaquina

.Machine$integer.max

#------------ej2----------

#Interpretar el resultado de la siguiente operacíon:

a <-as.integer(1) #Le asignamos la clase entera a "a"
b <- as.integer(2) #Le asignamos la clase entera a "b"
a/b               #Dividimos dichos numeros a y b
class(a/b)        #EL resultado de dividir 1/2 nos da un numero decimal, ademas al dividir dos numeros la operacion
                  #Nos dara un numero y debemos indicarle a R si es un integer 

#Comparar el resultado de las siguientes operaciones:

a <- as.double(1)
b <- as.double(3)
a/b
class(a/b)

a <- as.single(1)
b <- as.single(3)
a/b
class(a/b)

#Analizar los resultados de las siguientes sentencias:

a <- as.integer(2) #Numero entero
b <- 3.14159       #Numero decimal  

is.integer(a)
is.integer(b)
is.numeric(a)
is.numeric(b)
is.double(a)
is.double(b)




#Interpretar el resultado de la siguiente operacíon:
a <- as.integer(3)
b <- as.integer(3.14159) #EStamos obligando a que sea un entero... osea 3 supongo
a*b                      # 3 . 3 = 9


#------------ej3-------------

#Determinar el resultado de las siguientes operaciones, dado a un ńumero real y b un n ́umero entero:
a <-0.85
b<- as.integer(2)
b <-round(a)  #Redondea el valor de a al entero mas proximo a "a"
b <-ceiling(a) # Redondea al siguiente valor superior entero de "a"
b <-floor(a)  # Redondea al siguiente valor inferior entero de "a"
b <-trunc(a) # "Corta" la parte decimal y se queda solo con la entera (no redondea nada)


#------------ej4-------------

#a) Armar un programa que escriba por pantalla la frase “Hola mundo”.
#b) Armar un programa que pida ingresar un n ́umero y que luego imprima por pantalla el n ́umero
#ingresado

print("Hola mundo") #Imrpime el argumento en la consola

#Usamos readline y definimos en su argumento una instruccion clara a realizar por el usuraio en la consola
#Despues imprimimos ese valor en la consola usando print
numero<-readline("Ingresar un numero n cualquiera :")  
print(numero, quote = FALSE) #Lo vi en clases y quise quitarle las comillas con quote=False.


#------------ej5-------------
#a) Escribir en lenguaje R las siguientes expresiones y encontrar la soluci ́on para los siguientes
#valores: 
#a=1 b=2 c=3 d=5 e=2 f=-4 g=1/3 
#a=1, b=2, c=3, d=-3,e=4, f=-4, g=4

a<- 1
b<- 2
c<- 3
d<- 5
e<- 2
f<- -4
g<- 1/3

#i) 
((a+b/(c+d))+exp(2))


#ii)
a+b/(c+(d/e+f))

#iii) 
((a+1)^2-1/(c+d)^2) /(f + g)^4

#iv) 
(3(a)^2-2a)/(7(b)^3+4(b)^2-2))

a<- 1
b<- 2
c<- 3
d<- -3
e<- 4
f<- -4
g<- 4


#i) 
((a+b/(c+d))+exp(2))


#ii)
a+b/(c+(d/e+f))

#iii) 
((a+1)^2-1/(c+d)^2) /(f + g)^4

#iv) 
(3(a)^2-2a)/(7(b)^3+4(b)^2-2))




#b) Evaluar las siguientes expresiones escritas en lenguaje R, siendo a, b y c tres n ́umeros reales:
  
a<- 2
b<- 5
c<- 3

#i)
a / b / c
#ii)
a / ( b / c )
#iii
( a / b ) / c
#iv
a + b * a -c
#v
( a + b ) * ( a - c )
#vi
( a + b ) * a - c
#vii
( -a )^ b

#------------ej6-----------
#Utilizar el editor de scripts de R para tipear el script y guardarlo como inversa.R 
#a) Verificar que el c ́odigo est ́e correcto, ejecutar el script para testear los resultados con los siguiente
#valores:
#  1.0 3.0 -20.0 1000.0 1.0e-400
#b) Ver qu ́e pasa cuando se ingresan alguno de los siguientes valores. ¿Por qu ́e?
#  0.0 ‘pepe’
#c) Editar el archivo, en la l ́ınea correspondiente al c ́alculo de la inversa cambiar x por X. ¿C ́omo
#reacciona R al intentar ejecutar el programa y por qu ́e?
 # d) Deshacer el cambio anterior y modificar el nombre de la sentencia “readline” por el de “readlin”.
#Intentar ejecutar el script.


#Programa para calcular la inversa de un n ́umero

rm(list=ls())
a <- readline(‘‘ Ingrese un numero’’)
x<- as.numeric(a)
inversa x <- (1/x)
inversa x


