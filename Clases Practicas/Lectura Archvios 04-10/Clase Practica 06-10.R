# Clase 13: Archivos .nc (netCDF)

rm(list=ls())

# Seteo el espacio de trabajo [MODIFICAR CON SU RUTA]
setwd("~/Escritorio/Labo-de-datos-R-main/Clases Practicas/Lectura de Archivo netcdf/netcdf")

####################################################################
#Librerias necesarias
library(here)
require(ncdf4)
#####################################################################
# archivo a abrir en carpeta datos
archivo <- here("datos", "netcdf_SLP_SA_1979_2014.nc")

# ABRE Y CARGA EL ARCHIVO
nc_SLP<- nc_open(archivo)

## atributos de las variables (ncdump)
print(nc_SLP)
# Con la funcion sink puedo guardar el output desde R a un archivo
# En este caso guardo los atributos del archivo nc en un archivo txt
# Primero determino nombre de archivo salida y carpeta donde se guardara
archivo_out = here("salidas","nc_SLP.txt") 
sink(archivo_out)
nc_SLP
sink()

# Obtener el numero de variables, de atributos y de dimensiones.

# Genero un arreglo de lista con las dimensiones de mi array de modo de no
# extraer todos los datos. Esta es la manera más eficiente de hacerlo porque 
# me permite seleccionar primero qué datos quiero antes de extraerlos

nombre_var<-names(nc_SLP$var)
nombres_dimensiones<-names(nc_SLP$dim)
datos_dimensiones<-0

for (i in 1:length(nombres_dimensiones)){
  datos_dimensiones[i]<-list(ncvar_get(nc_SLP,nombres_dimensiones[i]))
}
names(datos_dimensiones)<-nombres_dimensiones
datos_dimensiones

################################
# Si quisiera extraer todo:
# Extraigo las variables

lon<-ncvar_get(nc_SLP,"longitude")
lats<-ncvar_get(nc_SLP,"latitude")
time<-ncvar_get(nc_SLP,"time")
MSLP<-ncvar_get(nc_SLP,"msl") 

###############################
# Mirando los atributos, transformo las variables
#covierto los datos de tiempo en fechas entendibles
print(ncatt_get(nc_SLP,"time","units")) # "hours since 1900-01-01 00:00:0.0"
t<- as.Date(time/24,origin="1900-01-01") # si extraje time lo puedo llamar asi (si, lo hice)
t
#Sino pruebo esto
t<- as.Date(datos_dimensiones$time/24,origin="1900-01-01") # Notar que en time las units son hours
#as.Date: toma los dias desde la variable origin. Convierto a dias

# Prueben: 

months(t)
format(t,"%Y")

#De esta forma, podria quedarme con valores de un mes en particular. Por ejemplo:
slp_dic = MSLP[,,months(t)=="diciembre"]
dim(slp_dic)

#Entonces podria trabajar como si fuese un array sobre todos los diciembres!!
# [1] 69 55 36 (36 diciembres de 1979 a 2014)

# Otra forma es usando lubridate, con la funcion y ymd_hms. En este caso le
# sumo hours(tiempos) porque los datos originales estan en la unidad horas.
library(lubridate) 
time <- ymd_hms("1900-01-01 00:00:0.0") + hours(datos_dimensiones$time)
head(time) #veo los primeros valores
head(t) # comparo con los valores que extraje de la forma anterior

# Decido quedarme solo con las latitudes al norte de 30 S y longitudes al este de 60 O
lats_sesa <- which(datos_dimensiones$latitude >= -30)
lats_sesa
lons_sesa <- which(datos_dimensiones$longitude >= 300)
lons_sesa
MSLP_sesa <- ncvar_get(nc_SLP,"msl",start = c(lons_sesa[1], lats_sesa[1], 1),  #Start es "desde donde" toma los datos
                       count =c(length(lons_sesa), length(lats_sesa), -1))
MSLP_sesa

#variable [lons lats times]

# En la función ncvar_get intervienen diversos parámetros: primero el 
# identificador de mi archivo netcdf, luego la variable que quiero extraer, 
# luego la posición donde comienzo a seleccionar los datos asociados a cada
# dimensión y finalmente la cantidad de elementos de esa dimensión que quiero 
# seleccionar. En este último caso si quiero elegir todos los elementos de la
# dimensión pongo como valor -1

MSLP_sesa = MSLP_sesa/100  #MSLP estaba en Pa. Lo paso a hPa

contour(MSLP_sesa[,,1]) #Prueba rapida para ver el campo de SLP para tiempo 1

