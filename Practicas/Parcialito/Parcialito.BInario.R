#############BINARIO###################
#1°Leer las varibales que contiene el archivo (manualemnte)
#2°Asignarle una variable al archivo 
#   archivo<-"nombre_archivo"
#3° Idetnificarlas y guardarlas en una variable para usar en R
#4°Establecer el total de datos y guardarlo en una variable para usar en R
#   No olvidar poner los faltantes: faltantes<--999
#N<-nlat*nlong*ntimes*nvars
#variable<-readBin(archivo,"numeric",n=N,endian = "little",size=4)  

#remuevo faltantes
#variable[which(variable==faltantes)]<-NA


#Abrimos el archivo binario que contiene los pronostico de la probabilidad pp 
#para los trimestres siguientes. Hacemos un grafico de barra con la probabilidad 
#para los trimestres solapados desde febrero en adelante para el punto de reticula
#34S 58W (cerca de Bs As)

# dset ^nmme_ci_jan_2016.dat
# undef -999.
# title flxf_1x1.grb
# *  produced by grib2ctl v0.9.12.5p33j beta6
# options yrev 
# ydef 181 linear 90.000000 -1
# xdef 360 linear 0.000000 1.000000
# tdef 5 linear Feb2016 1mo
# zdef 1 linear 1 1
# vars 3
# above 0 81,1,0  ** surface Land cover (land=1;sea=0) [fraction]
# norm  0 81,1,0  ** surface Land cover (land=1;sea=0) [fraction]
# below 0 81,1,0  ** surface Land cover (land=1;sea=0) [fraction]
# ENDVARS 

rm(list=ls())

#el archivo es de precision simple (4bytes)
#intel usa little endian 

setwd("~/Escritorio/LABO/Labo-de-datos-R-main/Practicas/Parcialito")

archivo<-"nmme_ci_jan_2016.dat"

nlat<-181
nlong<-360
ntimes<-5
nvars<-3

faltantes<--999
N<-nlat*nlong*ntimes*nvars

variable<-readBin(archivo,"numeric",n=N,endian = "little",size=4)  

#remuevo faltantes
variable[which(variable==faltantes)]<-NA

#le doy forma a la variable

variable<-array(variable,c(nlong,nlat,nvars,ntimes))  #array de 4 dimensiones [LONG LAT VAR TIMES]

#selecciono el punto de reticula que quiero, genero para eso un vector con las latitudes y longitudes

longitudes<-seq(0,359,1)  #length 360
latitudes<- seq(-90,90,1)  #escribo asi porque vienen al reves

#busco el punto cerca de bs as

pp_bs_as<-variable[which(longitudes==(360-58)),which(latitudes==-34),,]  #matriz de 5fil x 3 col

#hago el grafico de barras
colnames(pp_bs_as)<-c("FMA","MAM","AMJ","MJJ","JJA")

jpeg(filename="prob_bs_as_ic_jan.jpg",width = 480,height = 480,units = "px")  #creo fig y resol

barplot(pp_bs_as*100, beside=TRUE,  #datos que uso y opcion para que coloque una al lado de otra
        main="Probabilidad PP Trimestral en 33S 58W",  #titulo
        xlab="Trimestre",   #label x
        ylab="Probabilidad",  #label y
        col=c("blue","green","red"),  #colores para cada categoria
        ylim = c(0,80)) #limites del eje x
box() #recuadro alrededor de la figura

# Pongo la referencia donde quiero
par(xpd=TRUE)  # dice que el parametro para mantener todo atado a la figura y no al ploteo en si

legend(14,80,c("above","normal","below"),fill = c("blue","green","red")) #pongo la referencia

dev.off()  #cierro la figura

#MANEJO DE MULTIPLES DIMENSIONES
#############ME PIDEN CALCULAR EL PROMEDIO ZONAL: PROMEDIO SOBRE LAS LONGITUDES##################

##variable longs lats niveles times. Entonces tengo que hacer el promedio sobre la primera dimension

promedio_zonal<-apply(variable,c(2,3,4),mean)  #dim nlats nlevels ntimes

#################PROMEDIO LATITUDINAL: PROMEDIO SOBRE LATITUDES##################

promedio_latitudinal<-apply(variable,c(1,3,4),mean)  #nlons nlevels ntimes

###################PROMEDIO TEMPORAL: PROMEDIO SOBRE LOS TIEMPOS###########################

promedio_temporal<-apply(variable,c(1,2,3),mean)  #nlons nlats nlevels



################## Cargar y guardar .Rdata###################

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


### BINARIO#############

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

datos='~/Escritorio/LABO/Labo-de-datos-R-main/Practicas/Parcialito/datos/SST_19821999.T42.grd'  
load("~/Escritorio/LABO/Labo-de-datos-R-main/Practicas/Parcialito/datos/SST_19821999.T42.grd")
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

