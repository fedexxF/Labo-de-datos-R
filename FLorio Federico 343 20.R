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
setwd("~/Descargas")

#Vamoos a necesitar la libreria HERE y ncdf4 para poder cargar y manipular el archivo, por lo cual las instalamos

library(here)
require(ncdf4)

# Primero voy a abrir el archivo que me piden, indicnado el nombre de la carpeta en donde esta guardado y el nombre del archivo
archivo <- here("datos", "air_temp_mon_2015_2021_levels.nc")

# ABrimos el archivo con nc_open 
nc<- nc_open(archivo)

#Vemos que contiene este archivo

nombre_var<-names(nc$var) #Vemos de que variable se trata
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

#Recordando las instrucciones del ejercicio, 
#tenemos que el archivo contiene datos de temperatura mensual para 3 niveles de presión durante el periodo 2015-2021. 
#osea datos de 7 años
#Vemos que la variable times almacena 84 datos, lo cual signfica que contiene 12 meses x 7 años

print(ncatt_get(nc,"time","units")) #hours since 1900-01-01 00:00:00.0

#Son datos mensuales, que innician en 1900-01-01 y avanzan de mes en mes, la unidad es en horas, asique debemos dividir por 24 hs
#Para darle el formato deseado usamos as.date (toma los dias desde la variable origin)

tiempo<- as.Date(time/24,origin="1900-01-01")
print(tiempo) #Vemos que nos quedo como debia, avanza de mes en mes, e inicia en 2015 y termina en 2021. son 84 datos

#Ya podemos manipular correctamente los datos.
#Ya tenemos toda la info que queriasmos extraer de los archivos
#Contiene 4 dimensiones de 1440x721x3x84 => llongitud*latitud*level*time

#Nos piden que hagamos un array de 3 dimensiones para todo el globo y todo el  periodo
#PERO fijando la presion en 1000hpa
#Al fijar esa dimension el arraay nos qudaria 1440x721x1x84 => llongitud*latitud*level*time
#Osea, dim 3

#PERO me piden que guarde todo pero que la variable t, este en grados centigrados... que unidades tiene la variable t??
nc$var$t$units
#Que mal, esta en kelvin jaja. Hay que modificarla y K-273.15 = Grados celcius #No se como hacer esto

#longitud*latitud*level*time
a <- ncvar_get(nc, "t") #cambiar para que abra solo el nivel de 1000
#Pruebas multiples que indican cierta desesperacion C:

Array_Base<-ncvar_get(nc,"longitude","latitude",1000,tiempo)
Array_Base<-ncvar_get(nc,"longitude","latitude")

Array_Base<-ncvar_get(nc,"longitude","latitude","level","time")

Data_FrameA<-array(lon,lats,level,tiempo)
Array_Base<-array(Data_FrameA,lon,lats,levels,tiempo)

a<-data.frame(lon,lats,level,tiempo)

Intento_Raro<- ncvar_get(nc,"t",start = c(lon[1], lats[1], 3,1),  #Start es "desde donde" toma los datos
                       count =c(length(lon), length(lats), 3,83))

Data_FrameA<-array(nc,lon,lats,level,tiempo) #Seria asi *Tengo que fijar el dato de lats

#b) A partir del array del inciso a), seleccione la latitud cercana a Rosario (32.87°S) y
#calcule el promedio de todas las longitudes. Luego, a partir de la serie temporal
#obtenida calcule, para cada mes, la temperatura mínima, media y máxima,
#correspondiente al período disponible (2015-2021). Debe almacenar sus resultados en
#un data.frame en el que figuren los meses como nombre de cada fila y las columnas
#sean Tmin, Tmedia, Tmax.

#Seleccione la latitud cercana a Rosario (32.87°S) 

#Busco la lat mas cercana a la ubicación de Rosario

LA <- which.min(abs(nc$dim$latitude$vals - (-32.87))) #Esto me da la posicion en donde ese encintra la altitud mas cercana

#DEberia ser la serie temporal que inicia en la longitud 1 y termina en la 1440 y que esta fija en  LA

temp_RO<- ncvar_get(nc,"t",start = c(lon[1], LA[1], 1),  #Start es "desde donde" toma los datos
                       count =c(length(lon), length(LA), -1))
temp_RO

#usar applpy para calcular promedio en todo el circulo de latitud (sobre las longitudes)
#Capaz con esto
temp_RO<- ncvar_get(Data_FrameA,"t",start = c(lon[1], LA[1], 1),  #Start es "desde donde" toma los datos
                    count =c(length(lon), length(LA), -1))
temp_RO

datos <- 1:84
datos_Array = array(datos, dim =c(12,7))
#Para hacer la serie temporal, para cada mes, tengo que buscar cada dato de cada mes
which(months(tiempo) == "enero") #A modo de eejmplo, esto me da las posiciones de todos los eneros del periodo

temp_ene <- temp_RO[which(months(tiempo) == "enero")]
temp_feb <- temp_RO[which(months(tiempo) == "febrero")]
temp_mar <- temp_RO[which(months(tiempo) == "marzo")]
temp_abr <- temp_RO[which(months(tiempo) == "abril")]
temp_jun <- temp_RO[which(months(tiempo) == "junio")]
temp_jul <- temp_RO[which(months(tiempo) == "julio")]
temp_ago <- temp_RO[which(months(tiempo) == "agosto")]
temp_sep <- temp_RO[which(months(tiempo) == "septiembre")]
temp_oct <- temp_RO[which(months(tiempo) == "octubre")]
temp_nov <- temp_RO[which(months(tiempo) == "novimebre")]
temp_dic <- temp_RO[which(months(tiempo) == "diciembre")]

#EStariamos calulando las medias para cada mes (como pide el ejercicio)
temp_ene_avg <- mean(temp_ene)
temp_feb_avg <- mean(temp_feb)
temp_mar_avg <- mean(temp_mar)
temp_abr_avg <- mean(temp_abr)
temp_jun_avg <- mean(temp_jun)
temp_jul_avg <- mean(temp_jul)
temp_ago_avg <- mean(temp_ago)
temp_sep_avg <- mean(temp_sep)
temp_oct_avg <- mean(temp_oct)
temp_nov_avg <- mean(temp_nov)
temp_dic_avg <- mean(temp_dic)

################################Mejorar con in ciclo for###############################

#EStariamos calulando las tmin para cada mes (como pide el ejercicio)

temp_ene_min <- min(temp_ene)
temp_feb_min <- min(temp_feb)
temp_mar_min <- min(temp_mar)
temp_abr_min <- min(temp_abr)
temp_jun_min <- min(temp_jun)
temp_jul_min <- min(temp_jul)
temp_ago_min <- min(temp_ago)
temp_sep_min <- min(temp_sep)
temp_oct_min <- min(temp_oct)
temp_nov_min <- min(temp_nov)
temp_dic_min <- min(temp_dic)


#EStariamos calulando las tmax para cada mes (como pide el ejercicio)
temp_ene_max <- max(temp_ene)
temp_feb_max <- max(temp_feb)
temp_mar_max <- max(temp_mar)
temp_abr_max <- max(temp_abr)
temp_jun_max <- max(temp_jun)
temp_jul_max <- max(temp_jul)
temp_ago_max <- max(temp_ago)
temp_sep_max <- max(temp_sep)
temp_oct_max <- max(temp_oct)
temp_nov_max <- max(temp_nov)
temp_dic_max <- max(temp_dic)

#Almacenando todo en un data frame

#Los vectores deberian ser los datos de arriba

Data_FrameB<-data.frame(c(1,2,3,4,5,6,7,8,9,10,11,12),c(1,2,3,4,5,6,7,8,9,10,11,12),c(1,2,3,4,5,6,7,8,9,10,11,12))
colnames(Data_FrameB)<-c("Tmin","Tmax","Promedio")
rownames(Data_FrameB)<-c("ENE","FEB","MAR","ABR","MAY","JUN","JUL","AGO","SEP","OCT","NOV","DIC")

#c) Generar una lista que contenga una componente con los nombres de los meses y otro
#con los valores de la temperatura media para cada mes calculada en el inciso b)

Meses<-list(c("ENE","FEB","MAR","ABR","MAY","JUN","JUL","AGO","SEP","OCT","NOV","DIC"))
TempB<-list(c(Temperatura_media))

#d) Escribir los datos que guardó en el data frame del inciso b) en un archivo ascii (con
#separación por comas y sin comillas). Incluir un encabezado que indique qué es cada
#variable. Los meses (Ene, Feb, ..., Dic) deben figurar como nombres de las filas.

#La idea seria masomenos generarme las variables

#GUardamos una variable que contenga lo que queremos poner en el archivo NC

#Primero tengo que definir como son las dimensiones y las unidades de las mismas

#Necesito recordar que undiades tenian para eso
nc$dim$longitude$units
nc$dim$latitude$units
nc$dim$time$units

dimX<- ncdim_def( "longitude", "degrees_east", lon)
dimY<- ncdim_def ( "latatitude", "degrees_north", lats )
dimT<-ncdim_def("tiempo","hours since 1900-01-01 00:00:00.0",0:84,unlim=TRUE)

var <- ncvar_def("t", units= "k", longname= "temeprature" ,dim= list(dimX,dimY,dimT),prec="double",verbose=TRUE )
var

#Guardamos ese archivo NC
#Siendo DATA_FrameB el data frame que me piden en B teniendo ya cargado sus datos y los nombres de fila y columnas.
nc<- nc_create(paste(Data_FrameB,"air_temp_mon_2015_2021_levels.3xLsxyki.nc.part",header=TRUE,sep=",",quote=FALSE), list(var) )



