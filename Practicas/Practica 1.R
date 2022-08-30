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
a <- readline("Ingrese un numero : ")
x<- as.numeric(a)
inversa_x  <- (1/x)
inversa_x

#A) I)1 II)0.33 III)-0.05 IV)0.001 V)INF   TODO OK

rm(list=ls())
a <- readline("Ingrese un numero : ")
x<- as.numeric(a)
inversa_x  <- (1/x)
inversa_x


#B) I) INF II)NA (justamente porque no son numeros los que ingresamos)            
#I) nos dio eso porque R no tomo a 0 como un entero, entonces nos dice que el resultado de 1/(algo cercano a 0) es inf

rm(list=ls())
a <- readline("Ingrese un numero : ")
x<- as.numeric(a)
inversa_x  <- (1/X)
inversa_x


#C)Al cambiar la x por una X, R diferencia las amtusculas y las minusculas. Nosotros definimos x y no X.

rm(list=ls())
a <- readline("Ingrese un numero : ")
x<- as.numeric(a)
inversa_x  <- (1/X)
inversa_x

#D)
rm(list=ls())
a <- readlin("Ingrese un numero : ")   #Nos da error, no reconoce a "readlin"
x<- as.numeric(a)
inversa_x  <- (1/X)
inversa_x

#------------ej7-----------

#a) Armar un programa tal que se ingrese por pantalla el valor de una latitud y que el programa
#calcule y muestre por pantalla el valor del par´ametro de Coriolis.
#b) Armar un programa que dada la temperatura en grados Fahrenheit la convierta a grados cent´ıgrados. 
#c) De acuerdo con la ley de los gases ideales, la presi´on del gas es proporcional al producto de la
#densidad y la temperatura. Armar un script que pida ingresar un valor de temperatura y de
#densidad en un sistema de unidades seleccionado y que calcule la presi´on. Imprimir por pantalla
#los valores ingresados y el resultado junto con sus respectivas unidades.
#d) Dada la f´ormula para el c´alculo del per´ıodo de un p´endulo en funci´on de la longitud del hilo y
#de la gravedad terrestre, escribir un programa que pida ingresar un valor para L y que calcule e
#imprima el valor de T correspondiente.
#T = 2πsqrt(g/l)

#Valor del parametro de coriolis p = 2 OMEGA sen Phi
#phi depende de la latitud
#Omega es la velocidad angular de la tierra  = 
OMEGA<- 7.27*10^-5 #En rad/s.
Latitud <- readline("Ingresar un valor de latitud:" )
Latitud<-as.numeric(Latitud)
p<-2*OMEGA*sin(Latitud)

#Queremos un programa que al ingresar un dato de temperatura en Fahrenheit nos la pase a grados centigrados.
#Definimos F como la temperatura en grados Fahrenheit.
#Definimos C como la temperatura en grados celcius.
f <- readline("Ingresar un valor de Temperatura en Fahrenheit:" )
f<-as.numeric(f)
c<-(((f-32))*(5/9))

#La formula de Gases ideales es PV = nRT o usando la densidad y despejando la presion (p), p=rtd/m
#Tomamos R=0,08205746	dm3 atm / (K mol) m=1 kg ,n=1 mol
#Pedimos un valor de densidad (d) y otro de temperatura (t1)
r<- 0.08205746
n<- 1
m<- 1
t<-readline("Ingresar un valor de temperatura en kelvin: ")
d<-readline ("Ingresar un valor de densidad en kg/dm3 ")
t<-as.numeric(t)
d <- as.numeric(d)
p<- (*d*r*t)/(m)

#Nos piden un programa que imprima el valor del periodo (t) en un pendulo fisico
#Siendo g=9.8 en mts/seg2
#Siendo pi = 3,14...
#l la longitud de la soga
g<- 9.8
l<- readline("Ingresar lonfitud de l en mts : ")
l<-as.numeric(l)
t<- 2*pi*sqrt(l/g)
print(t)

#------------ej8-----------

#a) Dise˜nar y programar un algoritmo al que se le ingrese el a˜no, el mes y el d´ıa por separado en el
#formato YYYY, MM, DD y que genere una variable caracter cuyo contenido sea la fecha en el
#siguiente formato YYYY.MM.DD
#b) Dise˜nar y programar un algoritmo al que se le ingrese la fecha en el formato YYYY-MM-DD y
#que devuelva por pantalla una frase diciendo: “La fecha ingresada es: DD del MM de YYYY”.
#c) Dise˜nar y programar un algoritmo al que se le ingrese el nombre de una persona y que permita
#obtener su primera y ´ultima letra. Testear el programa con nombres de diferentes longitudes.


#Piden un programa en donde se deba ingresar YYYY (años), MM (meses), DD (dia) y que imprima el resutado
#YYYY.MM.DD
YYYY<-readline("Ingresar año: ")
MM<-readline("Ingresar Mes : ")
DD<-readline("Ingresar dia : ")
print(paste(YYYY,".",MM,".",DD))

#Piden un programa en donde se deba ingresar YYYY (años), MM (meses), DD (dia) y que imprima el resutado
#“La fecha ingresada es: DD del MM de YYYY”.
Fecha<-readline("Ingresar fecha en formato YYYY-MM-DD incluyendo los guiones : ")

print(paste("La fecha ingresada es:"," ",substr(Fecha,1,4)," ","del", " ",substr(Fecha,6,7)," ","de"," ",substr(Fecha,9,10)))


#Nos piden un programa en el que alguien ingrese su nombre y nos devuelva la priemra y ultima letra
#Usamos nchar para sacar el largo del nombre. Como queriamos la ultima letra, le pedimos que que substr vaya de la ultima letra a la ultima letra
#Usamos substr y le pédimos que nos devuelva la priemr letra, es decir que vaya de 1 a 1.

nombre<-readline("Ingresar nombre : ")
print(paste(substr(nombre,1,1)," ",substr(nombre,nchar(nombre),nchar(nombre))))


#------------ej9-----------

#Hacer un programa que pida el ingreso del nombre y la edad de una persona y calcule la
#edad que tendr ́ıa en 2030. Luego, el programa debe imprimir un cartel que dice:
#“Nombre va a tener X a ̃nos en 2030”
#donde Nombre es el nombre ingresado y X la edad que tendr ́ıa en 2030. Asuma que esa persona
#todav ́ıa no cumpli ́o a ̃nos en 2022

#Pedimos al usuario que ingrese los datos de nombre y edad

Nombre<-readline("Ingresar el nombre : ")
Edad<-readline("Ingresar la edad : ")  
#Deinifimos X como la edad que va a tener la persona en 2030
#Uso as.numeric(substr(Sys.Date(),1,4)) para setear la fecha actual. ES decir que alguien en 2023 podria usar este codigo!
#La edad esta ingresada como un character, tenemos que hacerlo numerico para operar. Por eso usamos as.numeric
X<-2030-as.numeric(substr(Sys.Date(),1,4)) + as.numeric(Edad)
X
print(paste(Nombre, " " ,"va a tener", " " , X , " " ,"años en 2030"))

#------------ej10-----------

#Hacer un programa que le pida a un alumno de la carrera de Licenciatura en Ciencias
#de la Atm ́osfera sus datos personales (Nombre, Apellido), su libreta universitaria en formato N/AA,
#donde N es un n ́umero (que puede tener de 1 a 4 cifras) y AA es la terminaci ́on del a ̃no en que se
#inscribi ́o, y la cantidad de materias aprobadas. Luego el programa debe imprimir el siguiente mensaje:
#  “El alumno Nombre y Apellido se inscribi ́o como alumno de Exactas en el puesto N en el a ̃no 20AA
#y debe aprobar X materias para obtener el t ́ıtulo de grado”
#donde Nombre, Apellido, N y AA son los datos ingresados por el usuario. Notar que N y AA no se
#ingresan por separado, sino que corresponden al ingreso de la libreta universitaria. Asumir que la
#carrera cuenta con 20 materias en total y que el alumno se inscribi ́o despu ́es de 1999. Antes de escribir
#el c ́odigo, escriba el diagrama de flujo asociado

Nombre<-readline("Ingresar su nombre : ")
Apellido<-readline("Ingresar su apellido : ")
Libreta<-readline("Ingresar su Numero de libreta en formato N/AA : ")
MateriasAprobadas<-("INgresar cantidad de materias aprobadas : ")

print(paste("El alumno",Nombre,"y",Apellido, "se inscribío como alumno de Exactas en el puesto" N en el a ̃no 20AA
y debe aprobar X materias para obtener el t ́ıtulo de grado"))


