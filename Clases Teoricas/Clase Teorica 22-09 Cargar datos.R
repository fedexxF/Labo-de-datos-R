##################
##################################################################
# # Laboratorio de Procesamiento de Informaci�n Meteorol�gica
# 
# 2� cuatrimestre 2022
##################################################################

# Clase_Informaci�n R y binario Alumnos
###################################################

#####################

x <- stats::runif(20)  #20 numero aleatorios
x


y <- list(a = 1, b = TRUE, c = "oops") #Una lista con 3 elementos. 1,TRUE  y "oops"
y

save(x, y, file = "xy.RData") #Me guarda un archivo con estas variables #Se guarda en donde estamos trabajando

save.image()        #Guarda todo lo que este en el Environment (osea las variable sque cargamos)
unlink("xy.RData")	#Borra el archivo creado
unlink(".RData") 		#Borra el archivo en donde nos guardo el Enviroment


##############################3
load("xy.RData")   #Magia, me carga el Enviroment 
load(".RData")     #Lo probe con este tambien

##################
rm(x,y)             #BOrre el Environment
attach("xy.RData") #Lo atache ahr, lo guarde en GLOBAL ENVIRONMENT
x
y

detach("file:xy.RData") #Lo des-atache ahr, lo borre del GLOBAL ENVIRONMEN
x  #Obviamente ya no sabe que es x o y
y


##########################

data()               #Te muestra los paquetes guardados por default en R

#########################
try(data(package="rpart"))     #Me muestra solo los datos de esta libreria

data(USArrests)
data(USArrests, "VADeaths")    #Me mostro los paquetes de UsaArrest Y VADeaths

ds <- c("USArrests", "VADeaths")  #Crea un vector con los nombres de los conjuntos de datos
ds 
data(list = ds)    #Los pone en una lista              

USAccDeaths #Mostramelos
USArrests

#################################
#ejercicio que hacen SOLOS

# genero una matriz de 20 valores aleatorios que tenga 5 columnas

matrizA<-matrix(runif(20,10,40),,5)
matrizA

# Crear una segunda matriz de 20 n�meros ordenados por fila en 5 columnas

matrizB<-matrix(c(1:20),5,byrow=TRUE)
matrizB

# Guardar los datos usando la funci�n save en el archivo matriz20.Rdata

save(matrizA, matrizB, file = "MatrizA Y B.RData")


# Borrar el ambiente de trabajo y volver a cargar la informaci�n guardada en 

rm (list = ls())

# matriz20.RData utilizando dos m�todos diferentes

load("MatrizA Y B.RData")


########################################

#################################################
# ejemplo10.R
# Laboratorio de Procesamiento de Informaci?n Meteorol?gica
# 2? cuatrimestre 2020
################################################# 

# Leer la serie del tiempo de El Ni?o3: ninio3_19701999.Rdata 
# 
# Corroborar la lectura del archivo ploteando la serie
# plot(variable)
#
# Calcular la serie de las medias mensuales (generar una serie de 12 tiempos) 
# Verificar su forma ploteandola 
#
# Grabar la nueva serie en formato R, bajo el nombre: ninio312_19701999.Rdata 
#
# Liberar la memoria y corroborar el correcto guardado de la serie re-leyendola y ploteandola nuevamente
###############################################################

#dos formas iguales de cargar los datos. En la primera en DATA guardo el "camino"

setwd()

DATA <- setwd("~/Escritorio/Labo/Ejemplos y Archivos/")
datos=paste(DATA,"ninio3_19701999.RData",sep="")

# en esta forma escribo el "camino" en la misma sentencia

datos='~/Escritorio/Labo/Ejemplos y Archivos")/ninio3_19701999.RData'#compu oficina
load(datos);

ls.str()

plot(datos_ninio)     #grafica puntos, diagrama de dispersion
plot(datos_ninio,type="l")   #grafica una linea uniendo los puntos
plot(datos_ninio,type="l",col="green")   #grafica una linea verde
plot(datos_ninio,type="b",col="green")   #grafica una linea y puntos verde

#Reescribo el vector en una matriz donde cada columna es un mes y las filas los a?os

###COMO LO HAGO?????
# El vector esta ordenado un mes abajo del otro hasta terminar un a?o y luego comienza el siguiente

ninio_3=matrix(datos_ninio,ncol=30)
ninio_3=aperm(ninio_3)

ninio_3_mean=colMeans(ninio_3,na.rm=TRUE)
barplot(ninio_3_mean,col="red")

ninio_3_mean<array(datos_ninio,ncol(30))



save(ninio_3_mean,file="home/clinux01/Escritorio/Labo/Ejemplos Y Archivos/ninio3mensual_19701999.Rdata")
rm(list=ls())
load("C:/Users/PC/Documents/MATERIAS/DOCENCIA/Computacion_2018/ninio3mensual_19701999.Rdata")
ls.str()
barplot(ninio_3_mean,col="green")



### BINARIO

#####################

zz <- file("testbin") #creo un archivo donde guardar los datos   	
zz                    #pido información sobre el archivo         	

##########################

zz <- file("testbin", "wb")	#wb es el permiso para poder escribir, lo escribe en formato binario
zz

#####################

writeBin(1:10, zz)       	
zz

close(zz)            #Cierra el archivo zz

zz1 <- file("testbin", "rb")  #lee testbien y rb le da permiso para que me lea el formato binario
zz1

readBin(zz1, integer(), 4)     #Leeme los primeros 4 valores

readBin(zz1, integer(), 6)    #wtf, me lee los siguientes 6 (empezando del 4!!)

readBin(zz1, integer(), 10)   #No hay mas numeros, claramente. Ya recorrio 4+6. Hay que volver a cargar el archivo
close(zz1)

######################################
zz1 <- file("testbin", "wb")		        
writeBin(pi, zz1, endian = "little") 
zz1
close(zz1)                         		 

zz1 <- file("testbin", "rb")
zz1
readBin(zz1, numeric(), 1, endian = "little")
zz1

########################################

zz2 <- file("testbin", "wb")
writeBin(pi^2, zz2, size = 4, endian = "swap")
close(zz2)                         		    

zz2 <- file("testbin", "rb")            
readBin(zz2, numeric(), size = 4, endian = "swap")




#################################################
# ejemplo11.R
# Laboratorio de Procesamiento de Informaci?n Meteorol?gica
# 2? cuatrimestre 2019
################################################# 

#ejemplo de uso de readBin writeBin

#1 Escribo y leo los contenidos de un archivo:

#creo una matriz en el workspace!
a=rnorm(5)

#Creo el archivo
fid = file('rnorm5.bin', 'wb') #Permisos para escribir
fid    
writeBin(a, fid) #guardo a en el archivo fid
close(fid)       #Lo cierro. ya esta
fid              #NO hay nada, esta cerrado



#leo el archivo
fid = file('rnorm5.bin',"rb") #Lee el archivo
m5 = readBin(fid, numeric(),10) # genero una variable m5 y que me guarde fid y numeric() hasta 10
close(fid)
m5                             #Veamos lo que guardo

##############################
ff = file('r5normal.bin','wt') #Le di permisos pero... de texto (wt)
ff
writeBin(a,ff) #No funciona, le di permisos con wt, osea de texto. y si o si necesito trabajar en binario con wb

################################################
# ejemplo12.R
# Laboratorio de Procesamiento de Informaci?n Meteorol?gica
# 2? cuatrimestre 2019
################################################# 

#Cargar datos en formato binario!
#1) Leer el archivo de temperaturas de superficie del mar
#                  SST_19821999.T42.grd
#escrito en formato binario de acceso directo, proveniente de 
#una architectura big endian.!
#El header!
#             SST_19821999.T42.ctl
#en el directorio DATA, nos da ulterior informanci?n: 
#el archivo contine datos medios mensuales del Hadley Centre 
#(periodo 1982-1999), en una grilla Gausseana T42, con 
# valores indefinidos expresados por el entero negativo -32768.0

# 2) Corroborar su lectura del archivo ploteando la matriz de datos


########################

# Limpio el espacio de trabajo
rm(list=ls())

datos='/home/clinux01/Escritorio/Labo/Ejemplos y Archivos/SST_19821999.T42.grd'  
load("/home/clinux01/Escritorio/Labo/Ejemplos y Archivos/SST_19821999.T42.grd")
# Hago el open del file a leer
fid=file(datos,'rb')
fid

# Defino variables
nx=128; #long , numero de pixeles para una grilla de tipo T42
ny=64; #lat
itt=216; #12 meses * 18 anios (1982 a 1999)
undef=-32768.0;


# inicializo la matriz donde voy a poner los datos
sst=matrix(0,nrow=nx*ny,nco=itt)
for (it in 1:itt){         #va a recorrer todos los tiempos
  it
  sst[,it]=readBin(fid,numeric(),size=4,nx*ny,endian="swap") #acomoda la info en fid, numeros, 4 tamaños, nx*ny 
}

close(fid)

class(sst)  #ahora trabajo con sst que es la matriz que ya generamos y sabemos manipular
dim(sst)    #Tremenda esas dimensiones

# lo pienso como serie temporal (evoluci?n de un punto en el tiempo)
sst_punto= sst[5580,] #Me agarra este punto en particular 
sst_punto            
plot(1:216,sst_punto,'l',col='red')

# lo pienso como campos espaciales (comportamiento en todos los puntos en un tiempo)

# Enmascaro los valores indefinidos (continentes)
sst[sst==undef]=NA;

# Expreso como arreglo tridimensional
sst2=array(sst,dim=c(nx,ny,itt)) #lso acomodo en un array. a stt, que tenga dim c(nx,ny,itt) osea 128,64,216, entonces ahi si estan todos los datos uno encima del otro
ls.str()

# Verifico la lectura ploteando la matriz en el tiempo 1
contour(sst2[,,1])
# y en otros tiempos ... 216 y 50 
contour(sst2[,,216])
contour(sst2[,,50])




