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
# La temperatura minima en Bs. As. ocurrió en aaaa-mm
# La temperatura maxima en Bs. As. ocurrió en aaaa-mm
# La temp media de enero para el periodo aaaa - aaaa es: XX°C"
# La anomalia de temperatura para Bs.As para enero de 2010 es: XX°C" 

# Ayuda: recuerde la funcion sink()

##################################

rm(list=ls())

# Seteo el espacio de trabajo [MODIFICAR CON SU RUTA]
setwd("~/Escritorio/Labo-de-datos-R-main/Clases Practicas/Lectura de Archivo netcdf/netcdf")

## librerias necesarias
library(ncdf4)
library(here)

###
# Abro archivo de carpeta datos
archivo <- here("datos", "air.mon.mean.nc")
nc <- nc_open(archivo)

#########
# Genero lista con datos_dimensiones [COMPLETAR]



##########
# a)
#Busco la lat y lon mas cercana a la ubicación de BA
LO <-   # COMPLETAR!
  LA <-   # COMPLETAR!
  
  # Obtener la serie temporal en un punto cercano a Bs As (34.61 S-58.37W)
  temp_BA <- ncvar_get(nc,  ) # COMPLETAR!

# b)
# Elegir los datos de enero y calcular la media de ese mes


#calculamos la media de enero



# c)
# Calcular la anomalia del anio 2020 


# d)
# Genero un txt con todos los resultados de a) a c)
