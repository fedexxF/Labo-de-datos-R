# Corriente en chorro en capas bajas (LLJ)
#Para estimar la posición del LLJ en el norte argentino se puede utilizar el criterio de
#Bonner, donde la condición para que se cumpla el mismo es que el viento en el nivel
#elegido sea superior a 12 m/s y la cortante vertical del viento entre ese nivel y un nivel
#superior supere los 6 m/s. Se tienen los datos de análisis del GDAS, de un evento de
#LLJ, en formato binario
#a) Leer los datos del viento zonal y meridional para los niveles entre 1000 y 500 hPa.
#b) Calcular el criterio de Bonner en el nivel de 850 hPa para todos los tiempos (nivel superior 600 hPa).
#c) Definir una variable donde su valor es 1 si se cumple el criterio de bonner.
#d) Graficar en 4 paneles la evolución del criterio de Bonner junto con el viento en
#vectores.
#e) Guardar la variable del criterio de Bonner en un archivo binario de doble precisión y
#Little Endian. (Para los puntos donde no se cumple el criterio definir un valor de undef). Crear un archivo de control (header).

setwd("~/Escritorio/LABO/Labo-de-datos-R-main/Trabajo Final")
datos <- "~/Escritorio/LABO/Labo-de-datos-R-main/Trabajo Final/datos/"
salidas <- "~/Escritorio/LABO/Labo-de-datos-R-main/Trabajo Final/salidas/"


# Leemos el archivo "hbonner.ctl" y extraemos las variables

#dset ^bonner200703%d2%h2.gra
#undef 9.999E+20
#title Bajas segregadas
#options little_endian
#options template
#ydef 71 linear -70.000000 1
#xdef 141 linear 200.000000 1.000000
#tdef 8 linear 18Z26mar2007 6hr
#zdef 21 levels 1000 975 950 925 900 850 800 750 700 650 600 550 500 450 400 350 300 250 200 150 100
#vars 4
#tt  21 99 temperatura [K]
#u   21 99 viento zonal [m/s]
#v   21 99 viento meridional [m/s]
#hgt 21 99 Geopotencial [mgp]
#endvars



#Datos en total:
nlons<-71
nlats<-141
ntimes<-8
nlevs<-21
nvars<-4
nrecords<-ntimes*nlevs*nvars*nlats*nlons

for (i in 1:8) {
  data[i]<- readBin(paste0(datos,"bonner2007032612.gra"),
                    "numeric", 
                    size=4, 
                    n=nrecords, 
                    endian="little")
  
}

data <- readBin(paste0(datos,"bonner2007032612.gra"),
                "numeric", 
                size=4, 
                n=nrecords, 
                endian="little")

data1 <- readBin(paste0(datos,"bonner2007032618.gra"),
                "numeric", 
                size=4, 
                n=nrecords, 
                endian="little")


