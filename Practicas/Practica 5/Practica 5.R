#Ejercicio 1
#El sitio https://legacy.bas.ac.uk/met/gjma/sam.html almacena la serie mensual del
#Modo Anular del Sur (SAM en ingl ́es) definido a partir de informaci ́on de estaciones en
#el Hemisferio Sur.
#a) Descargar el archivo en formato ASCII y graficar la evoluci ́on temporal del  ́ındice
#b) Calcular el promedio estacional para las 4 estaciones del a ̃no y graficar todas las series
#juntas
#c) Testear si el  ́ındice presenta una tendencia significativa. Filtrar dicha tendencia y
#graficar ambas series en una misma figura.
#d) Utilizando la serie de El Ni ̃no 3.4, realizar un scatter plot del  ́ındice SAM vs El Ni ̃no
#3.4 para el trimestre Sep-Oct-Nov. Obtener la ecuaci ́on de la regresi ́on y testear si la
#relaci ́on es significativa. Superponer la ecuaci ́on de la regresi ́on al gr ́afico del scatter
#plot.

rm(list=ls())
graphics.off()
setwd("~/Escritorio")
setwd("D:/Users/Windows 10/Desktop/LABO/Labo-de-datos-R-main/Practicas/Practica 5")


# 1) Instalar/importar ggplot2

#install.packages("ggplot2")
library(ggplot2)
library(here)

# 2) Leer y preparar datos 

# Configuro el espacio de trabajo

setwd("~/Escritorio")
setwd("D:/Users/Windows 10/Desktop/LABO/Labo-de-datos-R-main/Practicas/Practica 5")

# Leo los datos del archivo txt
datos<-here("datos","newsam.1957.2007.txt")
read.table(datos)

tabla1<-read.table(datos, header=FALSE, sep=" ")
tabla1 
tabla1[1,1]
colnames(tabla1)<-

#AHora si empezamos a trabajar co nlso datos
#Nos piden graficar la evolucion temporal del  iındice

#Acomodamos los datos

#Eje x: tiempo
fechas <- seq(as.Date("1957-01-01"),as.Date("2007-12-01"),by="month")
fechas

# Genero un array de 7x12 vacío donde guardar los datos
Tabla_Completar <- array(NA, c(66,12))
Tabla_Completar

#Recorro las columnas de la tabla original,les guardo los datos que cargamos en la tabla

for(i in 1:12){
  Tabla_Completar[,i] <- tabla1[1:7,1]  #a tabla de 1 a 7 y de columnas i (1 a 12). Guardalas por columnas en Tabla_Completar
}
Tabla_Completar

#Eje y: Temp
temp <- as.vector(t(temp)) # t traspone la matriz
temp


