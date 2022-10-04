##################
##################################################################
# # Laboratorio de Procesamiento de Informaci�n Meteorol�gica/oceanografica

# 2� cuatrimestre 2022
##################################################################

##################################################
#######################################
# clase NCDF 1 alumnos
####################

require(ncdf4)

nc<-nc_open("~/Escritorio/Labo/Labo-de-datos-R-main/Clase Teorica 04-10/hgt850.nc") 

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

olr<-nc_open("~/Escritorio/Labo/Labo-de-datos-R-main/Clase Teorica 04-10/olr.mon.mean.nc") 

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


nc<-nc_open("~/Escritorio/Labo/Labo-de-datos-R-main/Clase Teorica 04-10/X157.92.28.55.252.12.27.10.nc")


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


