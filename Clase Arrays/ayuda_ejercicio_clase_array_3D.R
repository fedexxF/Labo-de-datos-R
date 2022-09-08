rm(list=ls())
#setea tu directorio:
setwd("/home/clinux01/Escritorio/LABO/Clase Arrays")

library(ncdf4) # package for netcdf manipulation
nubosidad_enero <- ncvar_get(nc_open("ISCCP-Basic.HGM.v01r00.GLOBAL.2015.01.99.9999.GPC.10KM.CS00.EA1.00.nc"), "cldamt") 
nubosidad_febrero <- ncvar_get(nc_open("ISCCP-Basic.HGM.v01r00.GLOBAL.2015.02.99.9999.GPC.10KM.CS00.EA1.00.nc"), "cldamt") 
nubosidad_marzo <- ncvar_get(nc_open("ISCCP-Basic.HGM.v01r00.GLOBAL.2015.03.99.9999.GPC.10KM.CS00.EA1.00.nc"), "cldamt") 

nubosidad_enero 
nubosidad_febrero
nubosidad_marzo
#Son arrays de 360x180, re resentn la nubosidad media entre feb marzo y enero de 2015

c(nubosidad_enero, nubosidad_febrero, nubosidad_marzo)

#no funciono
Pruebita<-array(data = c(1:64800), dim = c(nubosidad_enero, nubosidad_febrero, nubosidad_marzo))

Pruebita<-array(data = c(1:64800), dim = c(nubosidad_enero, nubosidad_febrero, nubosidad_marzo))

dim(Pruebita)
#No funciono
Pruebita<-array(data = c(360,180,3), dim = c(nubosidad_enero, nubosidad_febrero, nubosidad_marzo))

#Esto si, me ayudaron jeje
Array3<-array(c(nubosidad_enero, nubosidad_febrero, nubosidad_marzo),c(360,180,3) )
Array3
dim(Array3)



#Recortá la región determinada por todo el hemisferio sur
#1 a 90 hemsiferio sur

#ESto no funca
Datos_Hemisferio_Sur<-array(c(nubosidad_enero, nubosidad_febrero, nubosidad_marzo),c(360,90,3))
Datos_Hemisferio_Sur


#Otra forma, correcta y con ayudin
Datos_Hemisferio_Sur2<-array(c(nubosidad_enero, nubosidad_febrero, nubosidad_marzo),c(360,180,3) )
latitudes<-Datos_Hemisferio_Sur2[,1:90,]
latitudes

#Calculá el promedio de nubosidad de enero, febrero y diciembre para cada punto de grilla
Datos_Hemisferio_Sur2<-array(c(nubosidad_enero, nubosidad_febrero, nubosidad_marzo),c(360,180,3) )

# # apply(datos, c(1,2), mean, na.rm=TRUE)

#Necesiso las latitudes que yadefini de 1:90
#Necesito definir que sea para ENE-FEB-MARZO


Proemdio_nubosidad<-apply(latitudes,c(1,2),mean,na.rm=TRUE)
Proemdio_nubosidad

#f. Calculá el promedio espacial de la nubosidad en cada mes, ¿cual presenta mayor nubosidad en el hemisferio sur en 2015?

#Calculamos el promedio espacialde cada mes
Proemdio_espacial<-apply(latitudes,c(3),mean,na.rm=TRUE)
Proemdio_espacial

#EL mes con mayor nubosidad es marzo con 68.29475








