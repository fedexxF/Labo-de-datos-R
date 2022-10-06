#################
##################################################################
# # Laboratorio de Procesamiento de Informaci�n Meteorol�gica/Oceanografica

# 2� cuatrimestre 2022
##################################################################

##################################################
#######################################
# clase NCDF 2
####################

.
#Resumiendo el Ejemplo
#Defino las dimensions
#Months<-seq(as.Date("1979/1/1"), by= "month", length.out= 432)
#dimX<- ncdim_def( "long", "degrees", lon)
#dimY<- ncdim_def( "lat", "degrees", lats )
#dimT<- ncdim_def( "Time", “days", Months, unlim=TRUE )
#Defino las variables
#var1d <- ncvar_def("mslp", units= "hPa", longname= "mean sea level pressure",
#dim= list(dimX,dimY,dimT), missval= -999, prec="double" )
#Creo el Archivo de Escritura
#nc<- nc_create(paste(OUTPUTS,"mslp_hPa.nc",sep=""), list(var1d) )
#Cargo las variables en el archivo
#ncvar_put( nc, var1d, MSLP/100 )
#Cierro el archivo
#nc_close(nc)

##################################################################

rm (list=ls())

setwd("~/Escritorio/Labo-de-datos-R-main/Clases Teoricas/Clase Lectura archivos NCDF")

require(ncdf4)
require(lubridate)

OUTPUTS<- ('~/Escritorio/Labo-de-datos-R-main/Clases Teoricas/Clase Lectura archivos NCDF/')

lon <- seq(270,320,5) # 11 puntos de longitud
lats<-seq(-10,-50,-5) # 9 puntos de latitud

length(lon)
length(lats)

Months<-as.numeric(seq(as.Date("1979/1/1"), by= "month", length.out= 432))

Months

dimX<- ncdim_def( "long", "degrees", lon) #ASignamos nombre, unidades,longitud y a que dimencion pertenece(tipo dim X,Y,Z)
dimX
dimY<- ncdim_def ( "lat", "degrees", lats )
dimY
dimT<- ncdim_def( "Time", "days", Months, unlim=TRUE )
dimT

#Definición de la(s) variable(s)
#Para esto utilizamos la función ncvar_def(). Inicialmente esta variable existe solo
#en la memoria. Se escribe en el disco usando la función nc_create().

#ncvar_def(name, units, dim, missval, longname=name, prec="float",
#shuffle=FALSE, compression=NA, chunksizes=NA, verbose=FALSE )

#Cada argumento quiere decir:

#name: nombre de la variable a ser creada (cadena de caracteres)
#units: las unidades de la variables (cadena de caracteres)
#dim: la(s) dimension(es) de la variable (uno o una lista de objetos de clase
#"ncdim4“, como los creados por ncdim_def )
#missval: el valor usado para identificar dato faltante de la variable
#longname: opcional, nombre mas largo de la variable, que es asignado al atributo
#"long\_name" de la variable. Ejemplo: La variable TS puede tener como nombre
#largo "Surface Temperature"
#prec: precisión de la variable creada. Opciones validas: 'short' 'integer' 'single'
#'double' 'char'.
#shuffle: enciende(TRUE) o apaga (FALSE, default) el filtro shuffle. Este filtro puede
#mejorar la compresión de variables enteras. El archivo se generará en formato
#netcdf versión 4, no compatible con versiones previas de softwares que solo leen la
#versión 3.
#compression: puede ser un entero entre 1 (menor compresion) y 9 (maxima compresion), 
#habilita la compresión de la variable a medida que se escribe en el
#archivo. El archivo se generará en formato netcdf versión 4, no compatible con
#versiones previas de softwares que solo leen la versión 3.


var1d <- ncvar_def("mslp", units= "hPa", longname= "mean sea level pressure",dim= list(dimX,dimY,dimT), missval= -999, prec="double",verbose=TRUE )
var1d

#3. Creación del nuevo archivo nc con la lista de variable(s)

#Para esto utilizamos las funciones nc_create() y ncvar_put

#nc_create() crea un nuevo archivo netCDF dadas las variables que este nuevo archivo
#debe contener. Tener en cuenta que el nuevo archivo puede no ser escrito en el disco
#hasta que se ejecuta la funcion nc_close.


#nc_create( filename, vars, force_v4=FALSE,verbose=FALSE )

#Cada argumento quiere decir:

#filename: nombre del archivo netCDF a ser creado
#vars: Ya sea un objeto de clase ncvar4 describiendo la variable a ser creada, o un
#vector o lista con los objetos a ser creados.
#force_v4: Si TRUE siempre el formato será en netcdf4. Si FALSE, el archivo es creado
#netcdf version 3 EXCEPTO que el usuario haya requerido opciones de la version 4.
#Deafult is FALSE.
#verbose: Si TRUE, se imprime información mientras se crea el archivo


nc<- nc_create(paste(OUTPUTS,"mslp_hPa.nc",sep=""), list(var1d) )
nc

MSLP<-runif(42768) #Runif nos da valores al azar
MSLP

#3. Creación del nuevo archivo nc con la lista de variable(s) (ahora ncvar_put() )
#ncvar_put() Escribe datos aun archivo netCDF existente. La variable ha ser escrita
#debe existir previamente en el disco.

#ncvar_put( nc, varid, vals, start=NA, count=NA, verbose=FALSE )

#nc: un objeto de clase ncdf4 indicando a que archivo escribir.

#Cada argumento quiere decir:

#varid: la variable en la cual se escribirán los datos. Puede ser una cadena de caracteres con
#el nombre de la variable, un objeto de clase ncdf4.
#vals: Los valores ha ser escritos.
#start: Un vector de índices indicando donde empezar a escribir los valores (comienza en 1).
#La longitud de este vector debe ser igual al numero de dimensiones que tiene la variable. El
#orden es X-Y-Z-T (i.e., la dimensión tiempo es la ultima). Si no se especifica se comienza a
#escribir del inicio del archivo (1,1,1,...).
#count: un vector de integers indicando la cantidad de valores a escribir a lo largo de cada
#dimensión (orden es X-Y-Z-T). La longitud de este vector debe ser igual al numero de
#dimensiones que tiene la variable. Si no se especifica y la variable NO tiene una dimensión
#ilimitada, se escribe la variable completa. SI la variable tiene una dimensión ilimitada se
#debe especificar. Como caso especial el valor "-1" indica que todas las entradas a lo largo de
#esa dimensión deben ser escritas.
#verbose: Si TRUE imprime información mientras se ejecuta la función. 

#.ncvar_put( nc, var1d, MSLP/100 )
#nc_close(nc)

#Los valores "NA" puede incluirse en los archivos netCDF; son convertidos al
#valor de dato faltante dado por la variable de netCDF (missval, en ncvar_def)
#antes de ser escrito. Mas información en ncvar_change_missval

ncvar_put( nc, var1d, MSLP )

nc_close(nc)

###########################

#### ABRIR lo que guardamos

nc<-nc_open("~/Escritorio/Labo-de-datos-R-main/Clases Teoricas/Clase Lectura archivos NCDF/mslp_hPa.nc")
nc        #NOsotros definimos las variables, el tiempo, el nombre largo, los datos faltantes,las unidades
class(nc)


presion<-ncvar_get(nc,varid="mslp") #Me trae los valorees de presion
presion

Longitud<-ncvar_get(nc,varid="long") #Me trae los valores de longitud, los busca con el nombre corto "long" que le asingnamos
Longitud

Latitud<-ncvar_get(nc,varid="lat")
Latitud

Time<-ncvar_get(nc,varid="Time")
Time

class(presion)
class(Longitud)
class(Latitud)
class(Time)

head(Time) #Miremos como varia, 31,28,31,30.. son los DIAS de los MESES
           #La codificacion esta almacenando esos DIAS

fecha<-ymd_hms ("1970-1-1 00:00:00") + days(Time) #Inicializamos la fecha, segun nuestro archivo(en este caso no dice jaja), y como estaba en dias, sumamos dias.
fecha                                             #ES mas, nos da datos de años que todavia no ocurrieron jaja

fecha<-ymd_hms ("1977-1-1 00:00:00") + days(Time) #Ponemos algun valor cualqueira, ya que no esta especificado en el archivo .-.
fecha   


head(fecha) #Me muestra 6 filas de fecha
tail(fecha) #Me muestra las ultimas 6 fechas


presion[2,2,3] #Podemos toamr un array o un dato que querramos


###Practicar SOLOS####

#De la clase pasada, vuelvan a correr el último archivo “XS.....” y
#guarden en un nuevo archivo sst_corta.nc el período enero_1990 a
#diciembre_1999
rm (list=ls())

setwd("~/Escritorio/Labo-de-datos-R-main/Clases Teoricas/Clase Lectura archivos NCDF")

nc<-nc_open("~/Escritorio/Labo-de-datos-R-main/Clases Teoricas/Clase Lectura archivos NCDF/X157.92.28.55.252.12.27.10.nc")

#Months<-seq(as.Date("1990/1/1"), by= "month", length.out= 432)
#dimX<- ncdim_def( "long", "degrees", lon)
#dimY<- ncdim_def( "lat", "degrees", lats )
#dimT<- ncdim_def( "Time", “days", Months, unlim=TRUE )
#Defino las variables
#var1d <- ncvar_def("mslp", units= "hPa", longname= "mean sea level pressure",
#dim= list(dimX,dimY,dimT), missval= -999, prec="double" )
#Creo el Archivo de Escritura
#nc<- nc_create(paste(OUTPUTS,"mslp_hPa.nc",sep=""), list(var1d) )
#Cargo las variables en el archivo
#ncvar_put( nc, var1d, MSLP/100 )
#Cierro el archivo
#nc_close(nc)

#Abrimos el archivo:
nc<-nc_open("~/Escritorio/Labo-de-datos-R-main/Clases Teoricas/Clase Lectura archivos NCDF/X157.92.28.55.252.12.27.10.nc")

#Tenemos que ver que tiene, dimensiones y todo eso

sst<-ncvar_get(nc,varid ="sst")
Longitud<-ncvar_get(nc,varid="lon")
Latitud<-ncvar_get(nc,varid="lat")
Time<-ncvar_get(nc,varid="time")

#DEfinimos los tiempos que nos piden y recortamos latitud/Longitud/ Y EL TIEMPO (lo que realmente me piden es el tiempo pero bueno, hacemos todo)

#Months<-seq(as.Date("1990/1/1"), by= "month", length.out= 432)
#dimX<- ncdim_def( "long", "degrees", lon)
#dimY<- ncdim_def( "lat", "degrees", lats )
#dimT<- ncdim_def( "Time", “days", Months, unlim=TRUE )

#Se me ocurre hacer algun which para poder extraer la info que necesito... el tema es como jajaja
#


#GUardamos una variable que contenga lo que queremos poner en el archivo NC
var1d <- ncvar_def("sst_corta", units= "degC", longname= "Montly Means of Sea Surface" ,dim= list(dimX,dimY,dimT), missval= -9.96921e+36, prec="double",verbose=TRUE )
var1d

#Guardamos ese archivo NC
nc<- nc_create(paste(OUTPUTS,"sst_corta.nc",sep=""), list(var1d) )
