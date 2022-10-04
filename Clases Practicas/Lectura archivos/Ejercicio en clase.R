#Ejercicio en clases

#Archivos ascii - Ejercicio

#En el archivo datos_estaciones.txt se encuentran los datos del 6 de
#mayo de 2022 de cuatro estaciones meteorológicas de Argentina. El
#código de datos faltantes es -999. Abrir el archivo ascii y calcular:

#   Cantidad de datos faltantes
# Valor máximo de temperatura, humedad y presión. ¿En que estación
#se registra cada valor máximo? ¿A qué hora?
#   Promedio y desvio estandar de la temperatura para cada estación.

#Guardar en un archivo .txt el valor del promedio y desvio de la
#temperatura para cada estacion.
#En el archivo de salida: cada fila debe ser una estación, los caracteres
#no deben tener comillas, el archivo tiene que tener un encabezado, el
#promedio y el desvio estandar debe tener solo dos decimales.



rm(list=ls())

# Seteo el espacio de trabajo [MODIFICAR CON SU RUTA]
setwd("~/Escritorio/Labo/Labo-de-datos-R-main/Clases Practicas/Clase 04-10")

# Una vez seteado el setwd 
library(here)

# Tomo como abro el archivo
estaciones <- here("datos_estaciones.txt")

#Lectura del archivo
# Abrimos el archivo sin especificar otro argumento
tabla1<- read.table("datos_estaciones.txt",header=TRUE)
class(estaciones)
dim(estaciones)
print(estaciones)
head(estaciones)

tabla1[tabla1==-999]<-NA #Esos -999, se convierten en NA

#   Cantidad de datos faltantes

Cantidad_Faltantes<-which(is.na(tabla1)) #Nos da las posiciones de esos NA
Cantidad_Faltantes 
length(Cantidad_Faltantes) #Tenemos la longitud de la cantidad de datos faltantes, osea la cantidad 22

# Valor máximo de temperatura, humedad y presión. ¿En que estación
#se registra cada valor máximo? ¿A qué hora?

Posicion_Maximo_Temperatura<-which.max(tabla1$TEMP) #Trae la posicion del valor maximo de temperatura
Posicion_Maximo_Temperatura
Posicion__Maximo_Humedad<-which.max(tabla1$HUM) #Trae la posicion del valor maximo de Humedad
Posicion__Maximo_Humedad
Posicion__Maximo_Presion<-which.max(tabla1$PNM) #Trae la posicion del valor maximo de Presion
Posicion__Maximo_Presion

#Los valores maximos seran

Valor_Maximo_Temperatura<-tabla1[which.max(tabla1$TEMP),3]
Valor_Maximo_Humedad<-tabla1[which.max(tabla1$HUM),4]
Valor_Maximo_Presion<-tabla1[which.max(tabla1$PNM),5]

#EStacion y horario

MaxTemp<-tabla1[which.max(tabla1$TEMP),]
MaxHum<-tabla1[which.max(tabla1$HUM),]
MaxPNM<-tabla1[which.max(tabla1$PNM),]

MaxTemp[[8]]

#Agarramos solo lo que encesitamos, osea la estacion y el nombre

EstacionTemp_Max<-MaxTemp[[8]]
EstacionTemp_Max
EstacionTemp_MaxHS<-MaxTemp[[2]]
EstacionTemp_MaxHS

EstacionHum_Max<-MaxHum[[8]]
EstacionHum_Max
EstacionHum_MaxHS<-MaxHum[[2]]
EstacionHum_MaxHS

EstacionPNM_Max<-MaxPNM[[8]]
EstacionPNM_Max
EstacionPNM_MaxHS<-MaxPNM[[2]]
EstacionPNM_MaxHS

#Finalmente la rta es

#Valor,estacion y lugar de mayor temp/hum/presion

print(paste("La mayor temepratura es de",tabla1[which.max(tabla1$TEMP),3],"en",MaxTemp[[8]],"a las",EstacionTemp_MaxHS,"horas"))
print(paste("El mayor porcentaje de humedad es de",tabla1[which.max(tabla1$HUM),4],"% en",MaxHum[[8]],"a las",EstacionHum_MaxHS,"horas"))
print(paste("La mayor temepratura es de",tabla1[which.max(tabla1$PNM),5],"en",MaxPNM[[8]],"a las",EstacionPNM_MaxHS,"horas"))

#   Promedio y desvio estandar de la temperatura para cada estación.

#Me armo un data frame con Temperaturas y estacion

data_frame<-data.frame(tabla1["TEMP"],tabla1["NOMBRE"])
data_frame



