 #Ejemplo graficado

#Datos del Ejercicio 5 Pr4

#El archivo model output.grd es un archivo binario, little endian de acceso directo con precision
#simple (su correspondiente ctl es modelo.ctl). En el mismo se encuentran las siguientes
#variables: U, V, T, q y Z en 925, 850, 700, 500, 300 y 100 hPa.


rm(list=ls())
setwd("~/Escritorio/LABO/Clase 17 - Graficado campos-20221027")
DATA<-"~/Escritorio/LABO/Clase 17 - Graficado campos-20221027/datos/"  #CAMBIAR RUTA
salidas<-"~/Escritorio/LABO/Clase 17 - Graficado campos-20221027/salidas/"

archivo<-"model_output.grd"
#de acuerdo al ctl
nlons<-96
nlats<-48
ntimes<-1
nlevs<-7
nvars<-5
nrecords<-ntimes*nlevs*nvars*nlats*nlons
#como es de precision simple tiene solo 4 bytes por registro
var<- readBin(paste(DATA,archivo,sep=""),single(),size=4, n=nrecords, endian = "little")

#doy forma a var
var<-array(var,c(nlons,nlats,nlevs,nvars))

#no tengo la presion, entonces la genero a partir del ctl.
Plev<-c(925, 850, 700, 500, 300, 200, 100)



############################################################################################
#                    GRAFICADO DE CONTORNOS  contour()                                     #
############################################################################################
# 1) Graficar el campo de geopotencial en el nivel de 850 hPa en funcion de la latitud y la
# longitud, en contornos (utilizar contornos espaciados cada 40 metros geopotenciales y
# colocar labels a los contornos cada 80 metros geopotenciales). Los contornos deben ser
# de color negro.

#DEfinimos las altitudes y longitudes que necesitamos analizar

lats<-seq(-87.159,-87.159+3.7*47,3.7) #vector con latitudes
lons<-seq(0,3.75*95,3.75)  #vector con longitudes
H<-var[,,which(Plev == 850),5] #me quedo solo con 850 para el ejercicio que sigue y la variable Z

# require libraries#
require(mapdata) #Tiene cargado prod efecto mapas C;
# VER DOCUMENTACION PARA DETALLES: https://www.rdocumentation.org/packages/maps/versions/3.4.0/topics/map
###################

jpeg(paste(salidas,"Hgeop850_contorno.jpg",sep=""),width = 720, height = 480, units = "px")

#los levels son cada tanto traza el valor de las isobaras
contour(lons,lats,H, col="black",levels=seq(1200,1700,40),
        main="Altura Geopotencial en 850 Hpa 00Z01JAN1982 6HR",
        labels=as.character(seq(1200,1700,80)),xlab="Longitud",
        ylab="Latitud",axes=TRUE,xlim=range(lons)) #,finite=TRUE

map(database="world", myborder=1.5,add=TRUE, col="blue", interior=TRUE,
    ylim=range(lats),xlim = range(lons))

dev.off()


############################################################################################
#                    GRAFICADO DE SOMBREADO  image.plot()                                     #
############################################################################################

#2) Repetir 1) pero usando la funcion image.plot.

# require libraries#
require(fields)

#require(mapdata) #Esta libreria ya esta cargada
###################


jpeg(paste(salidas,"Hgeop850_imageplot.jpg",sep=""),width = 720, height = 480, units = "px")

#rev invierte la paleta cargada

image.plot(lons,lats,H,col=rev(topo.colors(12)), breaks=seq(1200,1700,40),
           lab.breaks=seq(1200,1700,40),main="Altura Geopotencial en 850hPA",
           xlab="LONGITUD", ylab="LATITUD")


map(database="world", myborder=1.5,add=TRUE, col="black", 
    interior=TRUE,ylim=range(lats), xlim = range(lons),
    projection = "cylequalarea", parameters=90)
dev.off()


############################################################################################
#                    GRAFICADO DE SOMBREADO  filled.contour()                                     #
############################################################################################

# 3) Repetir 2) pero usando la funcion filled.contour

# require libraries#

#require(mapdata)
###################

jpeg(paste(salidas,"Hgeop850_filledcontour.jpg",sep=""),width = 720, height = 480, units = "px")


filled.contour(lons,lats,H, levels=seq(1200,1700,40), col=rev(topo.colors(12)), 
               plot.axes={axis(1); axis(2); map(database="world",add=TRUE, interior=TRUE,ylim=range(lats),xlim = range(lons))},
               plot.title= title(main="Altura Geopotencial en 850hPA"))

dev.off()

############################################################################################
#                    GRAFICADO DE FLECHAS  arrow.plot()                                     #
############################################################################################

#require libraries
require(fields)
require(mapdata)
require(mapproj)
###################

#4) Generar para la zona de Sudamerica (90S-0S, 90W-30W) un campo superpuesto
#de contornos sombreados de altura geopotencial y viento (en vectores) en el nivel de
#850 hPa. Las flechas del viento deben ser de color negras. Incluir, como en los graficos
#anteriores, los labels de los contornos de geopotencial. Agregar el contorno de las costas
#al grafico generado. Generar la barra de colores para el grafico realizado.

#Selecciono las variables U y V, en el nivel de 850 
U<-var[,,which(Plev == 850),1]
V<-var[,,which(Plev == 850),2]

#Selecciono la region de Sudamerica
lats_sa<-lats[which((lats<15)&(lats>-60))]
lons_sa<-lons[which((lons>270)&(lons<330))]
H_sa<-H[which((lons>270)&(lons<330)),which((lats<15)&(lats>-60))]
U_sa<-U[which((lons>270)&(lons<330)),which((lats<15)&(lats>-60))]
V_sa<-V[which((lons>270)&(lons<330)),which((lats<15)&(lats>-60))]

#Acomodo las variables u y v, y las lat y lon para el arrow.plot
u_sa<-c(U_sa)
v_sa<-c(V_sa)
uv_sa<-cbind(u_sa,v_sa)
X_sa<-rep(lons_sa,length(lats_sa))
Y_sa<-rep(lats_sa,each=length(lons_sa))
XY_sa<-cbind(X_sa,Y_sa)

jpeg(paste(salidas,"Hgeop850_SA_viento.jpg",sep=""),width = 480, height = 480*20/15, units = "px")


image.plot(lons_sa,lats_sa,H_sa,col=rev(topo.colors(12)), breaks=seq(1200,1700,40),
           lab.breaks=seq(1200,1700,40),main="Altura Geopotencial y Viento en 850 hPA ",
           xlab="LONGITUD", ylab="LATITUD")

contour(lons_sa,lats_sa,H_sa, col="black",levels=seq(1200,1700,40),
        labels=as.character(seq(1200,1700,80)),xlab="",ylab="",
        axes=TRUE,xlim=range(lons_sa,finite=TRUE),add=TRUE)

arrow.plot(XY_sa,uv_sa,arrow.ex = 0.2,xpd=FALSE,length=0.1,angle=10)
#arrow.ex: longitud de las flechas

map(database="world2Hires", myborder=1.5,add=TRUE, col="black", interior=TRUE,
    ylim=range(lats_sa),xlim = range(lons_sa),
    projection = "cylequalarea",parameters=90)  

dev.off()

