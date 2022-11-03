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

rm(list=ls())
graphics.off()


setwd("~/Escritorio/LABO/Labo-de-datos-R-main/TP FINAL")
datos <- "~/Escritorio/LABO/Labo-de-datos-R-main/TP FINAL/datos/"
salidas <- "~/Escritorio/LABO/Labo-de-datos-R-main/TP FINAL/salidas/"


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
nlats<-71
nlons<-141
ntimes<-8
nlevs<-21
nvars<-4
nrecords<-ntimes*nlevs*nvars*nlats*nlons


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

array<-array(data1,dim=840924)



#Estabelcemos el directorio de trabajo y la carpeta en donde se ecnuentran los datos a utilizar 
setwd("D:/Users/Windows 10/Desktop/LABO/Labo-de-datos-R-main/TP FINAL")
datos <- "D:/Users/Windows 10/Desktop/LABO/Labo-de-datos-R-main/TP FINAL/datos/"
#Con list.files le pedimos que lea los archivos que se encuentran en la carpeta /datos.
#Con pattern le pedimos que carge solo los archivos .gra
archivos<-list.files(".//datos", pattern = "\\.gra")

archivo1<-readBin(paste0(datos,archivos[1]),
        "numeric", 
        size=4, 
        n=nrecords, 
        endian="little")

archivo2<-readBin(paste0(datos,archivos[2]),
                  "numeric", 
                  size=4, 
                  n=nrecords, 
                  endian="little")



archivo3<-readBin(paste0(datos,archivos[3]),
                  "numeric", 
                  size=4, 
                  n=nrecords, 
                  endian="little")



archivo4<-readBin(paste0(datos,archivos[4]),
                  "numeric", 
                  size=4, 
                  n=nrecords, 
                  endian="little")



archivo5<-readBin(paste0(datos,archivos[5]),
                  "numeric", 
                  size=4, 
                  n=nrecords, 
                  endian="little")

archivo6<-readBin(paste0(datos,archivos[6]),
                  "numeric", 
                  size=4, 
                  n=nrecords, 
                  endian="little")
archivo7<-readBin(paste0(datos,archivos[7]),
                  "numeric", 
                  size=4, 
                  n=nrecords, 
                  endian="little")

archivo8<-readBin(paste0(datos,archivos[8]),
                  "numeric", 
                  size=4, 
                  n=nrecords, 
                  endian="little")


suma<-0
a<-c(seq(1,10,1))
f<-c()
for (i in 1:length(archivos)) {
  suma[i]<- a[i]
  l<-rbind(f,suma)
}

#Con ciclo for


datos_TP<-array(NA)
for (i in 1:3) {
  aux<-readBin(paste0(datos,archivos[i]),
               "numeric", 
               size=4, 
               n=nrecords, 
               endian="little")
  datos_Binarios<-rbind(datos_TP,aux)
  
}

#Leer los datos del viento zonal y meridional para los niveles entre 1000 y 500 hPa.
levels <- c(1000,975 ,950 ,925, 900, 850, 800, 750, 700, 650, 600, 550, 500)
#La variable a usar es la de viento zonal y meridional, que corresponden a al variable 2 y 3 segun el archivo CTL
Datos_TP <- array(datos_Binarios,c(nlats,nlons,nlevs,ntimes,nvars)) #Armo un array segun el orden del CTL

Datos_TP<-Datos_TP[,,which(levels==seq(1000,500,-25)),,2:3]

#b) Calcular el criterio de Bonner en el nivel de 850 hPa para todos los tiempos (nivel superior 600 hPa).

