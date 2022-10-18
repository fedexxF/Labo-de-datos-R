
# Clase 13: Archivos .nc (netCDF)

rm(list=ls())

# Seteo el espacio de trabajo [MODIFICAR CON SU RUTA]
setwd("~/Escritorio/LABO/Labo-de-datos-R-main/Practicas/Parcialito")

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


















############## clase NCDF 1 TEORICA####


require(ncdf4)

nc<-nc_open("~/Escritorio/LABO/Labo-de-datos-R-main/Practicas/Parcialito/datos/hgt850.nc")

class(nc)
nc  #Leemos los datos importantes. Como el nombre completo de la variable 
#Rangos de numeros QUE ESTAN CODIFICADAS por eso son tan raras jaja
#unidades
#La escala
#Nombre de la variable HGT
#Dimensiones. nos dice cuantos y que datos tenemos 
#Longitud, en grados este de 0 a 360 (Auqnue estos datos en particular van de 260 a 340)
#Latitud. en grados norte, de 90 a -90  (Aunque en este caso va de 0 a -65)
#level = 1 (porque ya esta manipulado el archivo yesta acomodado asi). Osea tiene 1 nivel de presion (850hPa)
#time = 12783 MEDIDO EN HORAS
#01/01/1800 datos tomados desde esa fecha (mirar primera linea de TIME) (desde las 00:00:00)
#Nos da el rango de valores, codificado
#Delta t esta medido en cada 1 dia

#Despues nos da info de donde se saco toda la info, referencia, intituciones,etc etc etc


hgt<-ncvar_get(nc,varid="hgt") #Trae la variable HGT. hay que llamarlo con "" y el nombre CORRECTO que esta asignado en el archivo 
hgt
Longitud<-ncvar_get(nc,varid="lon") #Trae la longitud
Longitud
Latitud<-ncvar_get(nc,varid="lat") #Trae la Latitud
Latitud
Time<-ncvar_get(nc,varid="time") #Trae el tiempo
Time

class(hgt)
class(Longitud)
class(Latitud)
class(Time)

head(Time) #Nos da los primeros 6 tiempos (head)

#Solucion NO CORRECTA pero facil
# UNA forma de poder leer la información de la fecha,
#tengo que saber cuando comienza, el delta t y la cantidad de información

z<-seq(as.Date("1981/1/1"), by= "day", length.out= 12783) 
z
head(z)

# OTRA forma de leer las fechas es por medio de una libreria que hay que instalar
# libreria para transformar las fechas del ncdf a variable

library(lubridate)

require(lubridate)
#transformo los datos del tiempo
# NOTAR que el "comienzo es 1800-1-1)

#Esto es time con minuscula
#USamos el Time con mayucula ya alamcenado
time <- ymd_hms ("1800-1-1 00:00:00") + hours(Time) #Desde 1800-1-1 00:00:00 sumale las horas almacenadas en Time (con mayuscula)

#leer como vienen los datos, hay veces q se cambia el "hours" por "day"
head(time)

dimnames(hgt) <- list(lon = Longitud, lat = Latitud, date = as.character(time)) #Toma una lista con las dimensiones de la variable hgt
str(hgt) #Me muestra por pantalla 



contour(hgt[,,1]) #Grafica isolineas. Grafica todas las longitudes y latitudes para el primer tiempo
hgt[,,1] #Grafica esto, mira.
#Pero el grafico esta mal, miremos las latitudes
Latitud                # van de 0 a -65... estan al revez. Bueno, hay que cambiar eso

contour(hgt[,9:17,1])
contour(hgt[,27:1,1]) #Las altitudes, tomalas al revez, desde el 27 hasta el 1

lat20<-which(Latitud==-20) # se queda con la posicion que cumple eso
lat20
lat40<-which(Latitud==-40)
lat40
contour(hgt[,9:17,1])     #Graficamos de 9 a 17 (que son los valores de lat === 20 e == 40)
contour(hgt[,lat20:lat40,1])
contour(hgt[,lat40:lat20,1])


#Queremos plotear  solo los datos de la fecha 1992-12-31
fecha<-which(z=="1996-12-31") #La buscamoscon which. PERO OJO aca estamos usando "z" es una forma incorrecta de hacerlo. media rara
fecha
#Forma correcta
fecha2<-which(format(time, "%Y-%m-%d") =="1996-12-31") #Hay que asignarle el formato
fecha2

contour(hgt[,,fecha]) #Fijamos la fecha y gg
contour(hgt[,27:1,fecha2]) #Acomodo las latitudes y listo


#Practicar SOLOS
#Tenemos que abrir 2 archivos más:
#  • El primero es olr.mon.mean.nc
#– ¿Qué variable es? (fácil, el nombre lo dice)
#– Abrir el archivo
#– Extraer la información
#– Los tiempos???
# – Hacer un gráfico de algún tiempo
#• El segundo X157.92.28.55.252.12.27.10.nc
#– ¿Qué variable es? ¿Dónde lo leemos?
#  – ¿En que período de tiempo?
#  – Extraer la información.
#– Graficar la serie temporal para algún punto de retícula.


require(ncdf4)

olr<-nc_open("~/Escritorio/LABO/Labo-de-datos-R-main/Practicas/Parcialito/datos/olr.mon.mean.nc") 

class(olr)
olr

#ORL proemdio de meses es el nombre largo de la variable
#NOs da las unidades
#NOs da longitudes,latitudes, TIEMPO
#units: HOURS since 1-1-1 00:00:0.0
#Empieza en 1-1-1 00:00:00
#            delta_t: 0000-01-00 00:00:00
#VA por meses

library(lubridate)

require(lubridate)
#transformo los datos del tiempo
# NOTAR que el "comienzo es 1-1-1)

Time<-ncvar_get(olr,varid="time") #Trae el tiempo
Time
Longitud<-ncvar_get(olr,varid="lon") #Trae la longitud
Longitud
Latitud<-ncvar_get(olr,varid="lat") #Trae la Latitud
Latitud



#Esto es time con minuscula
#USamos el Time con mayucula ya alamcenado
time <- ymd_hms ("1-1-1 00:00:00") + hours(Time)

#Tenemos que poner bien la fecha, los años 0001
time <- ymd_hms ("0001-1-1 00:00:00") + hours(Time)
time #EMpieza desde el dia 3 pero no improta porque miramos los meses

OLR<-ncvar_get(olr,varid="olr") #Trae la variable SST. hay que llamarlo con "" y el nombre CORRECTO que esta asignado en el archivo 
OLR
dimnames(OLR) <- list(lon = Longitud, lat = Latitud, date = as.character(time))
str(OLR) #Me muestra por pantalla 


contour(OLR[,,1])


nc<-nc_open("~/Escritorio/LABO/Labo-de-datos-R-main/Practicas/Parcialito/datos/X157.92.28.55.252.12.27.10.nc")


class(nc)
nc

#OMonthly Means of Sea Surface Temperature es el nombre largo de la variable
#var_desc: Sea Surface Temperature
#NOs da las unidades (degC)
#NOs da longitudes,latitudes, TIEMPO
#Empieza units: DAYS since 1800-1-1 00:00:00
# delta_t: 0000-01-00 00:00:00
#VA por meses

library(lubridate)

require(lubridate)
#transformo los datos del tiempo
# NOTAR que el "comienzo es 1800-1-1)

#Esto es time con minuscula
#USamos el Time con mayucula ya alamcenado

Time<-ncvar_get(nc,varid="time") #Trae el tiempo
Time
Longitud<-ncvar_get(nc,varid="lon") #Trae la longitud
Longitud
Latitud<-ncvar_get(nc,varid="lat") #Trae la Latitud
Latitud

class(Time)

#COmo el archivo esta en dias, modifico eso. NO va mas
time <- ymd_hms ("1800-1-1 00:00:00") + days(Time)
time

SST<-ncvar_get(nc,varid="sst") #Trae la variable SST. hay que llamarlo con "" y el nombre CORRECTO que esta asignado en el archivo 
SST
dimnames(SST) <- list(lon = Longitud, lat = Latitud, date = as.character(time))
str(SST) #Me muestra por pantalla 

contour(SST[,,1]) #Grafica isolineas. Grafica todas las longitudes y latitudes para el primer tiempo




############# clase NCDF 2 TEORICA #####################

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

setwd("~/Escritorio/LABO/Labo-de-datos-R-main/Practicas/Parcialito")

require(ncdf4)
require(lubridate)

OUTPUTS<- ('~/Escritorio/LABO/Labo-de-datos-R-main/Practicas/Parcialito/datos/')

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

nc<-nc_open("~/Escritorio/LABO/Labo-de-datos-R-main/Practicas/Parcialito/datos/mslp_hPa.nc")
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

setwd("~/Escritorio/LABO/Labo-de-datos-R-main/Practicas/Parcialito")

nc<-nc_open("~/Escritorio/LABO/Labo-de-datos-R-main/Practicas/Parcialito/datos/X157.92.28.55.252.12.27.10.nc")

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
nc<-nc_open("~/Escritorio/LABO/Labo-de-datos-R-main/Practicas/Parcialito/datos/X157.92.28.55.252.12.27.10.nc")

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



##### IMPORTANTE ejemplo final de guardar NCDF############




require(ncdf4)
require(lubridate)


#### ABRIR el archivo que quiero recortar


VAR<-nc_open("~/Escritorio/LABO/Labo-de-datos-R-main/Practicas/Parcialito/datos/X157.92.28.55.252.12.27.10.nc")


#extraigo las variables y dimensiones
ssts<-ncvar_get(VAR,varid="sst") 
Longitud<-ncvar_get(VAR,varid="lon")
Latitud<-ncvar_get(VAR,varid="lat")
Time<-ncvar_get(VAR,varid="time")

#decodifico los tiempos
time <- ymd_hms ("1800-1-1 00:00:00") + days(Time) 

dimnames(ssts) <- list(lon = Longitud, lat = Latitud, date = as.character(time))

head(time)

# quiero guardar SOLO un "poco" de informaci�n

# latitudes de -30 a -60
# longitudes de 250 a 320
# tiempos desde 1990/01/01 a 1999/12/01

lat30<-which(Latitud==-30)
lat60<-which(Latitud==-60)

lon250<-which(Longitud==250)
lon320<-which(Longitud==320)

fecha1<-which(format(time, "%Y-%m-%d") =="1990-01-01")
fecha2<-which(format(time, "%Y-%m-%d") =="1999-12-01")


# corto a la variable sst
sst_cortada<-ssts[lon250:lon320,lat30:lat60,fecha1:fecha2]
dim(sst_cortada)

#comienzo a definir el archivo para guardar
OUTPUTS<- ('~/Escritorio/LABO/Labo-de-datos-R-main/Practicas/Parcialito/datos/X157.92.28.55.252.12.27.10.nc')

lon <- seq(250,320,2)
length(lon)
lats<-seq(-30,-60,-2)
length(lats)

#defino dimensiones
dimX<- ncdim_def( "long", "degrees", lon)
dimY<- ncdim_def ( "lat", "degrees", lats )



dimTmio<-ncdim_def("tiempo","months since 1990-01-01",0:119,unlim=TRUE)

# cuidado con la secuencia de valores que se ponen, al poner 1:120 ya me suma un mes al tiempo


#defino la variable
var2d <- ncvar_def("sst", units= "grados", longname= "temperatura en la superficie del mar",
                   dim= list(dimX,dimY,dimTmio), missval= -999, prec="double",verbose=TRUE )

# creo el archivo
nc<- nc_create(paste(OUTPUTS,"sst_corta.nc",sep=""), list(var2d) )

# "lleno" el archivo con la informacion
ncvar_put( nc,var2d,sst_cortada)

nc_close(nc)



#abro el archivo creado

nc<-nc_open("~/Escritorio/LABO/Labo-de-datos-R-main/Practicas/Parcialito/datos/X157.92.28.55.252.12.27.10.nc")
nc
class(nc)

variable<-ncvar_get(nc,varid="sst") 

Longitud<-ncvar_get(nc,varid="lon")
Latitud<-ncvar_get(nc,varid="lat")
Time<-ncvar_get(nc,varid="time")


head(Time)

time <- ymd_hms ("1990-01-01 00:00:00") + months(Time) # aca es donde hago trampa
head(time)



