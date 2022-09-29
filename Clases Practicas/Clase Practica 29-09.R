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

setwd("~/Escritorio/LABO")

archivo<-"nmme_ci_jan_2016.dat"

nlat<-181
nlong<-360
ntimes<-5     
nvars<-3

faltantes<--999
N<-nlat*nlong*ntimes*nvars

variable<-readBin(archivo,"numeric",n=N,endian = "little",size=4)  #size, es el espacdio que necesita cada byte 

#remuevo faltantes
variable[which(variable==faltantes)]<-NA

#le doy forma a la variable

variable<-array(variable,c(nlong,nlat,nvars,ntimes))  #array de 4 dimensiones [LONG LAT VAR TIMES]
dim(variable)
#selecciono el punto de reticula que quiero, genero para eso un vector con las latitudes y longitudes

longitudes<-seq(0,359,1)  #length 360
latitudes<- seq(-90,90,1)  #escribo asi porque vienen al reves

#busco el punto cerca de bs as

pp_bs_as<-variable[which(longitudes==(360-58)),which(latitudes==-34),,]  #matriz de 5fil x 3 col

dim(pp_bs_as) #Tiene dos dimensiones 
                                                                         
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
#ME PIDEN CALCULAR EL PROMEDIO ZONAL: PROMEDIO SOBRE LAS LONGITUDES

#variable longs lats niveles times. Entonces tengo que hacer el promedio sobre la primera dimension

promedio_zonal<-apply(variable,c(2,3,4),mean)  #dim nlats nlevels ntimes
dim(promedio_zonal)

#PROMEDIO LATITUDINAL: PROMEDIO SOBRE LATITUDES

promedio_latitudinal<-apply(variable,c(1,3,4),mean) #nlons nlevels ntimes
dim(promedio_latitudinal)

#PROMEDIO TEMPORAL: PROMEDIO SOBRE LOS TIEMPOS

promedio_temporal<-apply(variable,c(1,2,3),mean)  #nlons nlats nlevels
dim(promedio_temporal)



