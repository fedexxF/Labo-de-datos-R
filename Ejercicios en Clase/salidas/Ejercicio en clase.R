#######################################
### EJERCICIO NetCDF
# A partir del archivo air.mon.mean.nc, 
# a) Obtener la serie temporal en un punto cercano a Bs As (34.61 S-58.37W)
#  y determinar la fecha (anio, mes) que se dio el maximo y minimo de temp, respect.

# b) Para BsAs, elegir los datos de enero y calcular la media de ese mes 
# (expresar el resultado con solo dos decimales)

# c) Calcular la anomalia para enero del anio 2010 
# (expresar el resultado con solo dos decimales)

# d) Guarde en un archivo txt los resultados de los incisos anteriores:
# La temperatura minima en Bs. As. ocurriÃ³ en aaaa-mm
# La temperatura maxima en Bs. As. ocurriÃ³ en aaaa-mm
# La temp media de enero para el periodo aaaa - aaaa es: XXÂ°C"
# La anomalia de temperatura para Bs.As para enero de 2010 es: XXÂ°C" 

# Ayuda: recuerde la funcion sink()

##################################

rm(list=ls())

# Seteo el espacio de trabajo [MODIFICAR CON SU RUTA]
setwd("D:/Users/Windows 10/Desktop/LABO4/Labo-de-datos-R-main/Clases Practicas/Lectura Archvios 04-10")

## librerias necesarias
library(ncdf4)
library(here)


archivo <- here("datos", "air.mon.mean.nc")
nc <- nc_open(archivo)


###
# Genero lista con datos_dimensiones
#Veo que contiene el archivo, voy extrayendo la info de las dimensiones y el nombre de la variable
nombre_var<-names(nc$var)
nombre_var
nombres_dimensiones<-names(nc$dim)
nombres_dimensiones
datos_dimensiones<-0

#Me armo un ciclo for que recorra la cantidad de variables

for (i in 1:length(nombres_dimensiones)){
  datos_dimensiones[i]<-list(ncvar_get(nc,nombres_dimensiones[i]))
}
names(datos_dimensiones)<-nombres_dimensiones

##########


# a)
#Busco la lat y lon mas cercana a la ubicaciÃ³n de BA

LO <- which.min(abs(datos_dimensiones$lon - (360-58.37)))
LA <- which.min(abs(datos_dimensiones$lat - (-34.61)))
# Obtener la serie temporal en un punto cercano a Bs As (34.61 S-58.37W)
# air <- ncvar_get(nc,"air")
# temp_BA <- air[LO,LA,]
#La sintaxis para traer un archivo es
# ncvar_get(nc, varid=NA, start=NA, count=NA
# start Un vector de índices que indica dónde comenzar a leer los valores pasados.La longitud de este vector debe ser igual al número de dimensiones que tiene la variable
# count Un vector de enteros que indica el recuento de valores para leer a lo largo de cada dimensión (el orden es X-Y-Z-T).
#
#

temp_BA <- ncvar_get(nc,"air",start = c(LO[1], LA[1], 1),
                     count =c(length(LO), length(LA), -1))

#Miremos un poco las unidades de tiempo y todo eso
nc$dim$time
nc$dim$time$units #Vemos que el origen es de 1800-01- y que time units "hours"!!!
#Entonces, tenemos que dividir los datos de tiempo sobre 24 hs


t<- as.Date(datos_dimensiones$time/24,origin="1800-01-01") # time units "hours"
# Pero ojo que son datos mensuales

#Finalmente printiamos el msj, pediremos que sutraiga la fecha en donde la temp es max y min
#Esto nos da la posicion
which.max(temp_BA)
which.min(temp_BA)

#Esto nos dara el valor de esa posicion(Estamos seleccionando el elemnto de la posicion)
t[which.max(temp_BA)]

print(paste("La temperatura maxima en Bs.As. ocurrió en", substr(t[which.max(temp_BA)],1,7)), quote=FALSE)  # La fecha de Tmax en BA
print(paste("La temperatura minima en Bs.As. ocurrió en", substr(t[which.min(temp_BA)],1,7)), quote=FALSE)  # La fecha de Tmin en BA


# b)
# Elegir los datos de enero y calcular la media de ese mes

# temp_ene <- temp_BA[,,seq(1,length(t),12)]
#Seleccionamos la posicion de los meses que cumplan == enero (porque nos piden datos mensuales de enero)
which(months(t) == "enero")

temp_ene <- temp_BA[which(months(t) == "enero")]

#calculamos la media de enero 
temp_ene_avg <- mean(temp_ene)
print(paste("La temp media de enero para el periodo",substr(t[1],1,4),"-",substr(t[length(t)],1,4),"es:", round(temp_ene_avg,digits=2),"°C"),quote=FALSE)


# c)
# Calcular la anomalia del anio 2020 

fechas_enero <- t[months(t) == "enero"] #Me quedo con los enerosd e todos los años
format(fechas_enero, "%Y") #le doy formato a las fechas que extraje arriba
enero10 <- which(format(fechas_enero, "%Y") == "2010") #Finalmente, que me de la posicion que cumpla 2010

enero10_2 <- which(format(t,"%Y-%m") == "2010-01") #Otra opcion
anom2010_2 <- temp_BA[enero10_2] - temp_ene_avg

anom2010 <- temp_ene[enero10] - temp_ene_avg
print(paste("La anomalia de temperatura para Bs.As para el anio 2010 es:",round(anom2010,digits=2),"°C"),quote=FALSE)

# d)
# Genero un txt con todos los resultados de a) a c)
sink(here("salidas","resultados.txt"))
print(paste("La temperatura maxima en Bs.As. ocurrió en", substr(t[which.max(temp_BA)],1,7)), quote=FALSE)  # La fecha de Tmax en BA
print(paste("La temperatura minima en Bs.As. ocurrió en", substr(t[which.min(temp_BA)],1,7)), quote=FALSE)  # La fecha de Tmin en BA
print(paste("La temp media de enero para el periodo",substr(t[1],1,4),"-",substr(t[length(t)],1,4),"es:", round(temp_ene_avg,digits=2),"°C"),quote=FALSE)
print(paste("La anomalia de temperatura para Bs.As para el anio 2010 es:",round(anom2010,digits=2),"°C"),quote=FALSE)
sink()
                
                
