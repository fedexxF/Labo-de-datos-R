#Parcialito 2 - 20 de octubre de 2022

#(*) Este archivo contiene datos de temperatura mensual para 3 niveles de presión diferentes,
#para todo el globo, durante el periodo 2015-2021. Lo pueden descargar desde el siguiente
#enlace:
#https://drive.google.com/file/d/1oAo0C1lf7x_JCYZRHz5_zppEBGi8kI8a/view?usp=sharing

#Ejercicio:
#  A partir del archivo air_temp_mon_2015_2021_levels.nc (*), resuelva las siguientes
#cuestiones.

#a) Armar un array de 3 dimensiones que contenga la temperatura en grados centígrados
#de la temperatura en el nivel de 1000 hPa, para todas las latitudes, longitudes y tiempos
#que contiene la variable del archivo de entrada. Agregue como comentarios en su
#código qué dimensiones tiene el array generado (a qué corresponde cada dimensión y
# qué tamaño tiene cada una).

rm(list=ls()) #Primero limpiamos el Environment

# Seteo el espacio de trabajo 
setwd("~/Escritorio/Parcialito")
setwd("D:/Users/Windows 10/Desktop/LABO4")

#Vamoos a necesitar la libreria HERE y ncdf4 para poder cargar y manipular el archivo, por lo cual las instalamos

library(here)
require(ncdf4)

# Primero voy a abrir el archivo que me piden, indicnado el nombre de la carpeta en donde esta guardado y el nombre del archivo

archivo <- here("datos", "air_temp_mon_2015_2021_levels.nc")

# ABrimos el archivo con nc_open 
nc<- nc_open(archivo)

#Vemos que contiene este archivo

nombre_var<-names(nc$var)          #Vemos de que variable se trata
nombres_dimensiones<-names(nc$dim) #Vemos el nombre de las dimensiones que contiene

#Extraigo los datos de cada variable y los alamaceno en una variable

lon<-ncvar_get(nc,"longitude")
lats<-ncvar_get(nc,"latitude")
level<-ncvar_get(nc,"level")
time<-ncvar_get(nc,"time")

#Quiero ver mas en detalle que contiene cada dimension, asique voy a acceder uno por uno

nc$dim$time
nc$dim$longitude
nc$dim$latitude
nc$dim$level

#Me interesa ver mas en detalle el tiempo y sus unidades para ver si tenemos que decescriptarlo

nc$dim$time$units
nc$dim$time$vals

#Recordando las instrucciones del ejercicio
#Tenemos que el archivo contiene datos de temperatura mensual para 3 niveles de presión durante el periodo 2015-2021. 
#osea datos de 7 años
#Vemos que la variable times almacena 84 datos, lo cual signfica que contiene 12 meses x 7 años

print(ncatt_get(nc,"time","units")) #hours since 1900-01-01 00:00:00.0

#Son datos mensuales, que innician en 1900-01-01 y avanzan de mes en mes, la unidad es en horas, asique debemos dividir por 24 hs
#Para darle el formato deseado usamos as.date (tomamos los dias desde la variable origin)

tiempo<- as.Date(time/24,origin="1900-01-01")
print(tiempo)         #Vemos que nos quedo como debia, avanza de mes en mes, e inicia en 2015 y termina en 2021. son 84 datos

#Ya podemos manipular correctamente los datos.
#Ya tenemos toda la info que queriasmos extraer de los archivos
#Contiene 4 dimensiones de 1440x721x3x84 => llongitud*latitud*level*time


#Nos piden que hagamos un array de 3 dimensiones para todo el globo y todo el  periodo
#PERO fijando la presion en 1000hpa
#Al fijar esa dimension el array nos qudaria 1440x721x1x84 => longitud*latitud*level*time
#Osea, dim 3

#PERO me piden que la variable t, este en grados centigrados... que unidades tiene la variable t??

nc$var$t$units

#Que mal, esta en kelvin jaja. Hay que modificarla y K-273.15 = Grados celcius 

#Antes de pasar las unidades, necesitamos cargar 
#Toda la info de la variable "t" almacenada en el nc fijando el valor  de la dim correspiendiete a "level" en 1000 hpa
#y despues hacemos el pasaje de unidades

#Cargamos los datps de temp

TempK<-ncvar_get(nc,"t") 

#Vemos la posicion en donde se cumple que la presion es de 1000 

which(ncvar_get(nc,"level")==1000)

#Finalemnte ya tenemos los datos de temp con la presion fiajda.

Datos_tempK_1000<-TempK[,,which(ncvar_get(nc,"level")==1000),]

#Si hacemos Datos_TempK_1000 menos 275,15 tendremos los valores de temperatura para la presion 1000hpa pasados a grados kelvin

TempC_1000<-Datos_tempK_1000-273.15


#Vemos que es un array 

class(TempC_1000)

#1440 datos de longitud
#721 datos de latitud
#1 valor fijo de presion ("levels")
#84 valores de tiempo

#1440x721x84


#b) A partir del array del inciso a), seleccione la latitud cercana a Rosario (32.87°S) y
#calcule el promedio de todas las longitudes. Luego, a partir de la serie temporal
#obtenida calcule, para cada mes, la temperatura mínima, media y máxima,
#correspondiente al período disponible (2015-2021). Debe almacenar sus resultados en
#un data.frame en el que figuren los meses como nombre de cada fila y las columnas
#sean Tmin, Tmedia, Tmax.

#Seleccione la latitud cercana a Rosario (32.87°S) 

#Busco la lat mas cercana a la ubicación de Rosario

LA <- which.min(abs(nc$dim$latitude$vals - (-32.87))) #Esto me da la posicion en donde ese encintra la altitud mas cercana

#Fijamos la latitud en LA
#El resultado sera una matriz o array de 1440x84 (longitud x tiempo) con LA fijado en el mas cercano a rosario

TempC_1000_Rosario<-TempC_1000[,LA,]


#usar applpy para calcular promedio en todo el circulo de latitud (sobre las longitudes)
#Buscamos tener 84 valores ya que estamos promediando todas las longitudes

Promedio_longitudes<-apply(TempC_1000_Rosario, c(2),mean)
Promedio_longitudes

#Ahora nos piden Tmin,Tmedia,Tmax PARA CADA MES
#Tenemos los datos promediados de cada longitud (serie temporal)
#Pero tenemos que ordenarlo porque estan mal odenados. Podemos hacer que esos 84 valores, se acomoden en 12x7 (12 meses x 7 años)

Mensuales<- array(Promedio_longitudes, dim =c(12,7))

#Nos quedaria de esta forma el array "Mensuales"

#1 13
#2 14
#3 15
#4 15
#. .

#En donde 1 seria Enero, 2 seria Febrero (del primer año)
#13 seria Enero, 14 Febrero (del otro año)

#Vamos a calcular lo que nos pide el ejercicio

#EStariamos calulando las medias para cada mes (como pide el ejercicio)
#Esperamos tener 12 resultados. Usamos rownames, ya que R colocó los datos de la siguiente forma

Tmedia<-rowMeans(Mensuales)
Tmedia

#Tambien funciona un apply 

apply(Mensuales, 1, mean)

#EStariamos calulando las tmin para cada mes (como pide el ejercicio)


Tmin<-apply(Mensuales, 1, min)
Tmin

#EStariamos calulando las tmax para cada mes (como pide el ejercicio)

Tmax<-apply(Mensuales,1,max)
Tmax

#Almacenando todo en un data frame

Temp_MinMaxProm_Rosario<-data.frame((Tmin),(Tmax),(Tmedia))
colnames(Temp_MinMaxProm_Rosario)<-c("Tmin","Tmax","Promedio")
rownames(Temp_MinMaxProm_Rosario)<-c("ENE","FEB","MAR","ABR","MAY","JUN","JUL","AGO","SEP","OCT","NOV","DIC")

Temp_MinMaxProm_Rosario

#c) Generar una lista que contenga una componente con los nombres de los meses y otro
#con los valores de la temperatura media para cada mes calculada en el inciso b)

Meses<-list(c("ENE","FEB","MAR","ABR","MAY","JUN","JUL","AGO","SEP","OCT","NOV","DIC"))
Temepratura_media<-list(c(Tmedia))

Lista_con_todo<-list(Meses,Temepratura_media)

Lista_con_todo

#d) Escribir los datos que guardó en el data frame del inciso b) en un archivo ascii (con
#separación por comas y sin comillas). Incluir un encabezado que indique qué es cada
#variable. Los meses (Ene, Feb, ..., Dic) deben figurar como nombres de las filas.

#Establecemos una ruta de salida y su nombre de salida

archivo_salida <- here("salidas", "Temp_MinMaxProm_Rosario.txt")

#Con write.table armamos un txt que cumpla lo peddido en el inciso D

#Primero indicamos de que variable salen los datos "Temp_MinMaxProm_Rosario"
#Segundo la ruta en la que se almacenara : "archivo_salida" que ya vimos que contiene el directorio de salida y el nombre de salida
#Tercero, usamos quote=FALSE para sacarle las comillas
#Cuarto y quinto, usamos row.names y col.names TRUE para que nos muestre los nombres de filas y columnas que estaban en  el data frame
#Usamos una separacion por "," entonces sep=","

write.table(Temp_MinMaxProm_Rosario,archivo_salida,quote=FALSE,row.names=TRUE,
            col.names=TRUE,sep=",")

#Me gusta mas con sep " " pero bueno, no me piden eso jajaja


