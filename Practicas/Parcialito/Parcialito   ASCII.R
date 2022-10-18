############# Clase 12: Lectura y escritura de archivos .txt####################
# Ejemplos lectura

rm(list=ls())

# Seteo el espacio de trabajo [MODIFICAR CON SU RUTA]
setwd("~/Escritorio/LABO/Labo-de-datos-R-main/Practicas/Parcialito")

# Una vez seteado el setwd prueben  
library(here)

# VAMOS A USAR LA FUNCION READ.TABLE

####################################################
#ARCHIVO 1
####################################################

archivo1 <- here("datos", "ejemplo_lectura_1.txt")

#Lectura del archivo
# Abrimos el archivo sin especificar otro argumento
tabla1<- read.table(archivo1)
class(tabla1)
dim(tabla1)
print(tabla1)
head(tabla1)
# La lectura directa me devuelve una tabla de 7 filas y 4 columnas, sin 
# considerar que la primer linea son los campos de las variables

# Utilizo la opcion HEADER
tabla2<- read.table(archivo1,header=TRUE)
print(tabla2)

# Ahora obtengo una tabla con 6 filas y 4 columnas, considerando que hay un  
# header. Ese header es utilizado para definir los campos de una lista
tab2<- as.list(tabla2)
print(tab2)


####################################################
#ARCHIVO 2
####################################################
archivo2 <- here("datos", "ejemplo_lectura_2.txt")
tabla3<- read.table(archivo2,header=TRUE)
print(tabla3)
# La lectura directa de este archivo, aun considerando el header, 
# me devuelve 6 filas y una unica columna

# Podemos ver que el archivo tiene encabezado y ademas esta
#separado por comas
# Entonces para leerlo correctamente usamos header=TRUE
# y sep= ","
tabla4<- read.table(archivo2,header=TRUE,sep=",")
print(tabla4)

####################################################
#ARCHIVO 3
####################################################
# Este archivo es igual al anterior pero sin el HEADER
archivo3 <- here("datos", "ejemplo_lectura_3.txt")
tabla5<- read.table(archivo3,sep=",")
print(tabla5)

# Me devuelve la tabla sin los campos
# Entonces puedo usar COL.NAMES
# Genero un vector con los nombres de las columnas
header <- c("NOMBRE","EDAD","ALTURA","PESO")
tabla5b<- read.table(archivo3, sep=",",col.names=header)
print(tabla5b)


####################################################
#ARCHIVO 4
####################################################
# Este archivo tiene un dato faltante con un espacio en blanco (lo considera NA)
archivo4 <- here("datos", "ejemplo_lectura_4.txt")
tabla6<- read.table(archivo4,header=TRUE,sep=",")
print(tabla6)

####################################################
#ARCHIVO 5
####################################################
# Este archivo contiene un faltante codificado con un *
# Quiero que lo tome directamente como un NA
archivo5 <- here("datos", "ejemplo_lectura_5.txt")
tabla8<- read.table(archivo5,header=TRUE)
print(tabla8)
# Si no lo especifico, me lee el codigo como esta
# Usando NA.STRINGS puedo definir valores que seran tomados como NA
tabla9<- read.table(archivo5,header=TRUE, na.strings="*")
print(tabla9)





#################CLASE PRACTICA Ejemplos escritura#####################

rm(list=ls())

# Seteo el espacio de trabajo [MODIFICAR CON SU RUTA]
setwd("~/Escritorio/LABO/Labo-de-datos-R-main/Practicas/Parcialito")

# Una vez seteado el setwd 
library(here)

# VAMOS A USAR LA FUNCION WRITE.TABLE

####################################################
#ARCHIVO 5
####################################################
# Tomo como datos el archivo ejemplo 5
archivo5 <- here("datos", "ejemplo_lectura_5.txt")
datos<- read.table(archivo5,header=TRUE, na.strings="*")

#primero seteo el directorio de salidas y el nombre del archivo
# Recuerden que la carpeta salidas/ debe existir previamente en su directorio
archivo_salida <- here("salidas", "ejemplo_escritura_datos.txt")

#luego uso la funcion write.table especificando primero la
# variable datos_salida
# y luego el nombre de archivo con su ruta correspondiente
write.table(datos,archivo_salida)
# Si no especifico nada, va usar las comillas para mostrar strings,  
# al igual que el output por pantalla

# # si quiero especificar que los caracteres sean sin comillas uso 
# quote=FALSE
write.table(datos,archivo_salida,quote=FALSE)
# Ojo! sobreescribe el archivo generado anteriormente

# Notar que muestra una columna con el numero de fila
# y una fila con los nombres de las columnas (encabezado)
# Quiero conservar encabezado pero no incluir el numero de fila
# Uso row.names y col.names. Por default, son TRUE
write.table(datos,archivo_salida,quote=FALSE,row.names=FALSE,
            col.names=TRUE)

# Si no quisiera que me sobreescriba el archivo de salida, 
# sino agregar información, entonces usamos APPEND. Por default es FALSE

write.table(datos,archivo_salida,quote=FALSE,row.names=FALSE,
            col.names=TRUE,append = TRUE)

# Quiero que utilice coma para separar los decimales 
# y separar con tabs 
write.table(datos,archivo_salida,quote=FALSE,row.names=FALSE,
            col.names=TRUE,sep="\t",dec=",")



#####Clase_ascii TEORICA Alumnos###############


getwd()
vec <- scan("UnVector.txt")       
print(vec) 


#EXTRAS

# nombre del archivo entre “”, si esta en blanco lee lo que se ingresa
#del teclado. Si el archivo no esta en el directorio de trabajo especificar el PATH
#completo. También se puede usar para conectarse a URL

############################################################################################# 

#what = double(), # el tipo a ser leído. Logical, integer, numeric, complex, character, list
#nmax = -1, n = -1, sep = "", #sep: por default, scan espera que los datos estén
#separados por espacios. Se puede usar sep para identificar el caracter que separa
#los campos.
#quote = if(identical(sep, "\n")) "" else "'\"", dec = ".", #mirar el help
#skip = 0, # skip: el número de líneas del archivo de datos que deben ser
#salteados antes de comenzar a leer los datos.
#nlines = 0, # nlines: si es positivo, el numero máximo de líneas de datos que se
#deben leer.
#na.strings = "NA", flush = FALSE, fill = FALSE, strip.white = FALSE, quiet = FALSE,
#blank.lines.skip = TRUE, multi.line = TRUE, comment.char = "", allowEscapes =
# FALSE, fileEncoding = "", encoding = "unknown", text, skipNul = FALSE)



############################
x <- matrix(1:10, ncol = 5)	# genera una matriz de 2 x 5
x

write(x)		# escribe la matriz sin trasponer #Si no le ponemos nombre, se guarda por default como DATA
getwd()     # para ver mi directorio de trabajo y donde escribió la salida

#MIremos el archivo data y como lo guardo

write(t(x), sep = "\t", append=T)  #Por default me lo guarda con 5 columnas

#ME esta metiendo mas info al mismo DATA ya creado. LO que ya teniamos, quedo ahi PERO
#Ahora le agrego lo que queriamos (eso hace el comando APPEND)

#MIremos el archivo data y como lo guardo

unlink("data")   # borra el archivo donde estuvo escribiendo los datos


write(x, "", sep = "\t")   #en el lugar del archivo colocamos comillas. Imprime por pantalla

################################################################################

#Un objeto se puede escribir en un archivo de texto usando la función write
#write(x, file = "data”, ncolumns = if(is.character(x)) 1 else 5,append = FALSE, sep = " ")
#x: los datos que se quieren escribir en el archivo
#file: una cadena de caracteres indicando el nombre del archivo. Si no se especifica el
#nombre el archivo se llamara data y se genera en el directorio de trabajo
#ncolumns: numero de columnas en los cuales se escribirán los datos. Por DEFAULT son
#5
#append: si es TRUE los datos se agregaran al archivo existente
#sep: caracter usado para separar columnas. Si sep = "\t" las columnas se separan con
#tabulación; default es " "


#Si x es una matriz de dos dimensiones debe ser traspuesta para que en el archivo sean
#las mismas que en la representación interna de R.


############################

require(MASS)	#Cargamos la libreria MASS 

l= matrix(rnorm(1000),ncol=10)         # genero una matriz de 100 x 10
write.matrix(l,file="matriz100x10") 
write.matrix(l,file="matriz100x10b",blocksize=100)  #ver si hay alguna diferencia,(formas de las columnas) 

#Efectivamente la diferencia es el BLOCKSIZE que le agrega un espacio en blanco al principio


##### A tener en cuenta####

#x: matriz o data frame.
#file: nombre del archivo de salida. Default ("") sale por la consola.
#sep: separador entre las columnas.
#blocksize: Si es provisto y positivo, la salida se escribe en bloques que tiene tantas
#filas como blocksize. Escoger un número lo más grande posible consistente con la
#memoria disponible.


########################

x <- data.frame(a = I("a \ quote"), b = pi)  #Ese quote hace que sean factorones osea ya no son mas caracteres
x
#MIremos el archivo data y como lo guardo

write.table(x, file = "foo.txt", sep = ",", col.names = NA,qmethod = "double")
write.table(x, file = "foo2.txt", sep = ",")
write.table(x, file = "foo3.txt") #Le saque la "," asquerosa

#MIremos el archivo data y como lo guardo


### A tener en cuenta###

#write.table imprime el argumento x como un data.frame a un archivo

#write.table(x, file = "", append = FALSE, quote = TRUE, sep = " ", eol = "\n",
#    na = "NA", dec = ".", row.names = TRUE, col.names = TRUE, 
#           qmethod = c("escape", "double"), fileEncoding = "")

#x: los datos que se quieren escribir en el archivo, preferentemente un data.Frame o una matriz
#file: una cadena de caracteres indicando el nombre del archivo. Si “” escribe en la consola
#na el caracter para usar como dato faltante
#append: si TRUE agrega datos al final del archivo de escritura
#qmethod: como tratar las comillas dobles en los caracteres


################## ejemplo SOLOS###################

#Crear una matriz "a" de 100 datos aleatorios con 10 columnas

l= matrix(runif(100),ncol=10,nrow = 10)
l

# Cargar la librer�a MASS con require(MASS)

require(MASS)

# Escribir la matriz "a" en el archivo matriz_a.txt usando write.matrix

write.matrix(l, file = "matrix_a.txt")

# Escribir la matriz "a" en el mismo archivo con write y la opci�n append=TRUE

write(l,file = "matrix1_a.txt", append = TRUE )

# Escribir la matriz "a" en el mismo archivo con write.table y la opci�n append=TRUE

write.table(l, file = "matrix2_a.txt",append = TRUE )


############ SOLOS ##################

#Crear la matriz b de 10 columnas a partir del vector b=c(1:95,NA,NA,NaN,NaN,Inf)

b= matrix(c(1:95,NA,NA,NaN,NaN,Inf),ncol=10)
b

# Escribir la matriz "b" en el archivo matriz_a.txt usando write.matrix

write.matrix(b, file = "matrix_b.txt")

# Escribir la matriz "a" en el mismo archivo con write y la opci�n append=TRUE

write(b,file = "matrix1_b.txt", append = TRUE )

# Escribir la matriz "a" en el mismo archivo con write.table y la opci�n append=TRUE

write.table(b, file = "matrix2_b.txt",append = TRUE)



#############################################################################################

#Tanto para write.csv como para write.csv2 las opciones son las mismas que
#write.table salvo que
#qmethod = "double" siempre
#col.names =NA si row.names = TRUE(default) sino col.names=TRUE
#Además sep queda definido como:
#  write.csv usa "." para el punto decimal y la coma para separar los números en
#columnas. sep= ,
#write.csv2 usa la coma para el punto decimal y un punto y coma para separar los
#números en columnas.
#Para escribir nuestro ejemplo anterior haríamos
#write.csv(x, file = "foo.csv") #o bien
#write.csv(x, file = "foo2.csv", row.names = FALSE) #abrir archivos y ver diferencias
#write.csv2(x, file = "foo.csv2", row.names = FALSE) #y con este?

#############################################################################################

#Podemos abrirlo en un excel, csv es formato de excel

x <- data.frame(a = I("a \ quote"), b = pi)
write.csv(x, file = "foo.csv")      
write.csv(x, file = "foo2.csv", row.names = FALSE)   
write.csv2(x, file = "foo.csv2", row.names = FALSE)     

#################################
#################################Cargar datos - read.table#########################################
#Lee un archivo con formato de tabla y crea un data frame,donde los casos

#corresponden a las lineas y las variables a los campos en el archivo.
#read.table(file, header = FALSE, # header: un valor lógico indicando si el archivo
#contiene el nombre de las variables en la primer línea

# sep = "", quote = "\"'",dec = ".",       #sep: el default es espacio en blanco
#                                          #"dec: el caracter usado para el punto decimal
# numerals = c("allow.loss", "warn.loss", "no.loss"),row.names, 

#row.names un vector con los nombres de las filas: nombres, numero indicando la columna donde están, o el nombre de la columna que loscontiene. Si no se usa las filas son numeradas
#    col.names, as.is = !stringsAsFactors,na.strings = "NA”, #na.strings los caracteres
#que deben tomarse como NA. Los espacios en blanco se consideran NA
#colClasses = NA,nrows = -1,skip = 0, check.names = TRUE,fill = !blank.lines.skip,
#strip.white = FALSE, blank.lines.skip = TRUE,comment.char = "#",allowEscapes =
#           FALSE, flush = FALSE,stringsAsFactors = default.stringsAsFactors(),fileEncoding = "",
#           encoding = "unknown", text, skipNul = FALSE)
#14
#Cargar datos - read.csv, read.csv2, read.delim, read.delim2
#read.csv(file, header = TRUE, sep = ",", quote = "\"",dec = ".", fill = TRUE, comment.char = "",
#         ...)
#read.csv2(file, header = TRUE, sep = ";", quote = "\"",dec = ",", fill = TRUE, comment.char = "",
#          ...)
#read.delim(file, header = TRUE, sep = "\t", quote = "\"",dec = ".", fill = TRUE, comment.char =
#             "", ...)
#read.delim2(file, header = TRUE, sep = "\t", quote = "\"",dec = ",", fill = TRUE, comment.char =
#              "", ...)
#read.csv and read.csv2 son idénticos a read.table excepto por los defaults. Son
#para ser usados para leer archivos (‘.csv’) con ‘valores separados por coma’ (.csv2)
#por punto y coma.
#read.delim y read.delim2 son para leer archivos que usan el TAB para separar los
#valores, y cambia el símbolo decimal.

#Cargar datos - read.fwf
#Lee una tabla con datos de formato ancho fijo y lo convierte en un data.frame.
#Los records de más de una línea son concatenados a una sola línea antes de ser
#procesados.
#read.fwf(file, widths, header = FALSE, sep = "\t",
#         skip = 0, row.names, col.names, n = -1,
#         buffersize = 2000, fileEncoding = "", ...)
#widths: un vector entero que contiene los anchos de los campos (de una línea) o
#una lista de vectores enteros que contiene los anchos de varias líneas
#Colocar un valor negativo indica la cantidad de columnas que se deben saltear,
#e.g., -5 saltear 5 columnas.
#Tanto read.table como read.fwf usan scan para leer el archivo y luego procesan
#los resultados. Son muy convenientes pero a veces es mejor usar scan
#directamente.
#Otras funciones de lectura:
#  read.fortran
#read.ftable

#################################EJ 1 LECTURA DE ARCHIVOS IMPROTANTE ##########################################

#################################################
# ejemplo13.R
# Laboratorio de Procesamiento de Informaci?n Meteorol?gica
# 2? cuatrimestre 2018
################################################# 
# Leer datos en formato ascii
#
# CASO 1: matriz numerica cuadrada
# Archivo a leer: Caudales01.txt
# Funcion load
#
# CASO 2: tabla conteniendo columnas de numeros mas leyendas
# Archivo a leer: Caudales04.txt
# Funcion importdata
#
# CASO 3:tabla conteniendo columnas de numeros mas leyendas
# Archivo a leer: Caudales04.txt
# Funcion importdata
# Leer los datos de latitud, longitud, altitud y area. Conservarlos 
# como un arreglo numerico para eventualmente operar con ellos.
#

##########################################################

## CASO 1
# Limpio el espacio de trabajo
rm(list=ls())

# Lectura
dir_datos='/home/clinux01/Escritorio/LABO/Labo-de-datos-R-main/Practicas/Parcialito/datos/Caudales01.txt';
a<-scan(dir_datos)


## CASO 2

# Limpio el espacio de trabajo
rm(list=ls())
# Leo los datos (el 11 indica cuantas lineas salta antes 
# considerar "dato" los n?neros que encuentra
dir_datos='/home/clinux01/Escritorio/LABO/Labo-de-datos-R-main/Practicas/Parcialito/datos/Caudales04.txt';
datos2=read.table(dir_datos,nrows=24,skip=11)  #Saltea 11 filas y aparatir de la fila 12 y me muestra la info
datos2
class(datos2)

#Las lineas seapradoras, rompen R. Por eso las skipeamos con el comando de arriba

# Limpio el espacio de trabajo para estudiar otro ejemplo
# en este caso cambio el ultimo flag (11 a 35)
rm(list=ls())
# Leo los datos (el 36 indica cuantas lineas salta antes de
# considerar "dato" los n?meros que encuentra
dir_datos='/home/clinux01/Escritorio/LABO/Labo-de-datos-R-main/Practicas/Parcialito/datos/Caudales04.txt';
datos2=read.table(dir_datos,nrows=3,skip=36) #Skipeamos 36 filas (las linitas + encabezado + info de meses) 
#y dame 3 filas
datos2

## CASO 3

rm(list=ls()) 
dir_datos='/home/clinux01/Escritorio/LABO/Labo-de-datos-R-main/Practicas/Parcialito/datos/Caudales04.txt';
#primera forma usando scan
datos1=scan(dir_datos,character(),nmax=28) #Hace que sean  caracteres hasta 28 elementos
datos1                                    #Si no pongo nmax... ME LEE TODO 

#creo una matriz solo con los datos que me interesan
latitud1=as.integer(c(datos1[7],datos1[8],datos1[9])) #Va guardando datos
longitud1=as.integer(c(datos1[14],datos1[15],datos1[16]))
altitud1=as.integer(c(datos1[21],NA,NA))
area1=as.integer(c(datos1[28],NA,NA))

parametros1=rbind(latitud1,longitud1,altitud1,area1) #Unimos todo

parametros1

#segunda forma usando read.fwf
datos2=read.fwf(dir_datos,widths = list(c(15,-39,21,-30,9,-7,2,-1,2,-1,2),
                                        c(16,-2,10,-78,10,-5,2,-1,2,-1,2),
                                        c(17,-89,14,-6,3),
                                        c(25,-81,11,-9,3)),
                n=1)

#Va leyendo esas posicciones, saltea la otra, lee la que sigue, saltea la otra... creo jaja

#tercera forma usando read.table
datos3=read.table(dir_datos,nrows=4,fill=TRUE)
datos3

###########################EJ 2 lectura de datos ascii que contienen datos faltantes:#################################

################################################# 

# lectura de datos ascii que contienen datos faltantes:
# test1.dat
# 1, 2, 3
# 4, ,  6
#  , 8, 9

rm(list=ls())
dir_datos='/home/clinux01/Escritorio/LABO/Labo-de-datos-R-main/Practicas/Parcialito/datos/test1.dat'
dir_datos
fid = file(dir_datos);	
D = matrix(scan(fid,integer(),sep=','),ncol=3,byrow=TRUE)
D








