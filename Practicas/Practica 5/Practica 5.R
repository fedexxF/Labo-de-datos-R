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


# 1) Instalar/importar ggplot2

#install.packages("ggplot2")
library(ggplot2)

# 2) Leer y preparar datos 

# Configuro el espacio de trabajo
setwd("~/Escritorio")

# Leo los datos del archivo txt
datos<-"newsam.1957.2007.txt"
read.table(datos)

tabla1<-read.table(datos, header=TRUE, sep=",")
tabla1 

#AHora si empezamos a trabajar co nlso datos
#Nos piden graficar la evolucion temporal del  iındice





