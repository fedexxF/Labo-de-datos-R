# Clase 12: Lectura y escritura de archivos .txt
# Ejemplos lectura

rm(list=ls())

# Seteo el espacio de trabajo [MODIFICAR CON SU RUTA]
setwd("~/Escritorio/Labo/Labo-de-datos-R-main/Clases Practicas/Clase 04-10")

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

