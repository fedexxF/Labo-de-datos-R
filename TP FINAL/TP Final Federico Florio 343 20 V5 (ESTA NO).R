##################################################################################################################
#Instalamos las librerias a usar

install.packages("metR")
install.packages("ggplot2")
install.packages("maps")

# Cargamos librerias
library(ggplot2)
library(metR)
library(maps)

#################################################################################################################
#########################################ENUNCIADO###############################################################

# Corriente en chorro en capas bajas (LLJ)
#Para estimar la posición del LLJ en el norte argentino se puede utilizar el criterio de
#Bonner, donde la condición para que se cumpla el mismo es que el viento en el nivel
#elegido sea superior a 12 m/s y la cortante vertical del viento entre ese nivel y un nivel
#superior supere los 6 m/s. Se tienen los datos de análisis del GDAS, de un evento de
#LLJ, en formato binario
#a) Leer los datos del viento zonal y meridional para los niveles entre 1000 y 500 hPa.
#b) Calcular el criterio de Bonner en el nivel de 850 hPa para todos los tiempos (nivel superior 600 hPa).
#c) Definir una variable donde su valor es 1 si se cumple el criterio de bonner.
#d) Graficar en 4 paneles la evolución del criterio de Bonner junto con el viento en
#vectores.
#e) Guardar la variable del criterio de Bonner en un archivo binario de doble precisión y
#Little Endian. (Para los puntos donde no se cumple el criterio definir un valor de undef). Crear un archivo de control (header).


#################################################################################################################
#################################################################################################################

#Borramos cualqueir variable cargada en R y los graficos/plots

rm(list=ls())
graphics.off()

#Seteamos directorios de trabajo (facultad)

setwd("~/Escritorio/LABO/Labo-de-datos-R-main/TP FINAL")
datos <- "~/Escritorio/LABO/Labo-de-datos-R-main/TP FINAL/datos/"
salidas <- "~/Escritorio/LABO/Labo-de-datos-R-main/TP FINAL/salidas/"

#Seteamos directorios de trabajo (Casa)

setwd("D:/Users/Windows 10/Desktop/LABO/Labo-de-datos-R-main/TP FINAL")
datos <- "D:/Users/Windows 10/Desktop/LABO/Labo-de-datos-R-main/TP FINAL/datos/"
salidas <- "D:/Users/Windows 10/Desktop/LABO/Labo-de-datos-R-main/TP FINAL/salidas/"

# Leemos el archivo "hbonner.ctl" y extraemos las variables

#dset ^bonner200703%d2%h2.gra
#undef 9.999E+20
#title Bajas segregadas
#options little_endian
#options template
#ydef 71 linear -70.000000 1
#xdef 141 linear 200.000000 1.000000
#tdef 8 linear 18Z26mar2007 6hr
#zdef 21 levels 1000 975 950 925 900 850 800 750 700 650 600 550 500 450 400 350 300 250 200 150 100
#vars 4
#tt  21 99 temperatura [K]
#u   21 99 viento zonal [m/s]
#v   21 99 viento meridional [m/s]
#hgt 21 99 Geopotencial [mgp]
#endvars


#Extraemos los datos:
nlats<-71
nlons<-141
nlevs<-21
nvars<-4
ntime<-8

#Varriables totales

nrecords<-nlevs*nvars*nlats*nlons


#Con list.files le pedimos que lea los archivos que se encuentran en la carpeta /datos
#Con pattern le pedimos que carge solo los archivos con extension .gra
#Guardamos en una varible los archivos a leer

archivos<-list.files(".//datos", pattern = "\\.gra")


#Con ciclo for abrimos todos los archivos 

for (i in 1:length(archivos)) {
  datos_array<-array(
    readBin(paste0(datos,archivos[i]),"numeric", size=4, n=nrecords, endian="little"),
    dim=c(nlons,nlats,nlevs,nvars,ntime)
  )
}

#Sera mejor hacer esto?:
#Leer_Binarios<-function(archivo){
#readBin(paste0(datos,archivo),"numeric", size=4, n=nrecords, endian="little"),
#dim=c(nlons,nlats,nlevs,nvars)
#)
#}

#Pero es bastante ineficiente cargar todos los datos, si solo vamos a necesitar dos variables y fijar los valores de presion


#Extraemos las variables  que nos piden. Es decir, viento zonal y meridional 
#Que segun el archivo CTL corresponde a la variable 2 y 3 y se encuntran en la dimension 4
#Tambien me piden fijar la presion entre 1000 a 500 hpa

#Cargamos una variable que representa los niveles de presion que estan en el CTL
##zdef 21 levels 1000 975 950 925 900 850 800 750 700 650 600 550 500 450 400 350 300 250 200 150 100

levels<-c(1000, 975, 950, 925, 900, 850, 800, 750, 700, 650, 600, 550, 500, 450, 400, 350, 300, 250, 200, 150, 100)


Viento_zonal_1000_500<-datos_array[,,levels>=500 & levels<=1000,2,]
Viento_meridional_1000_500<-datos_array[,,levels>=500 & levels<=1000,3,]

#b) Calcular el criterio de Bonner en el nivel de 850 hPa para todos los tiempos (nivel superior 600 hPa)

#El Criterio de bonner se cumple cuando la diferencia de viento entre dos niveles de presion (uno superior y uno inferior)
#es, en modulo, mayor a 6 m/s
#Y cuando el viento zonal en el nivel seleccionado sea superior a 12 m/s

#Tenemos que fijar la presion a 850 hpa y tomar las variables 2 y 3 (viento zonal y meridional)  


Viento_zonal_850<-Viento_zonal_1000_500[,,which(levels==850),]
Viento_zonal_600<-Viento_zonal_1000_500[,,which(levels==600),]
Viento_meridional_850<-Viento_meridional_1000_500[,,which(levels==850),]
Viento_meridional_600<-Viento_meridional_1000_500[,,which(levels==600),]

#Debemos usar el viento en modulo, es decir, 
#v=sqrt(u^2+v^2) 

Viento_850<-sqrt((Viento_zonal_850)^2+(Viento_meridional_850)^2)
Viento_600<-sqrt((Viento_zonal_600)^2+(Viento_meridional_600)^2)

#Sera mejor hacer esto?:

#Viento_850<-sqrt((Viento_zonal_1000_500[,,which(levels==850),])^2+(Viento_zonal_1000_500[,,which(levels==600),])^2)
#Viento_600<-sqrt((Viento_meridional_1000_500[,,which(levels==850),])^2+(Viento_meridional_1000_500[,,which(levels==600),])^2)
#

#Definimos la cortante de viento como la resta entre el nivel de 600 hpa y 850 hpa en valor absoluto

Cortante_Viento<-abs(Viento_600-Viento_850)

################################################################################################################

#Necesito los valores TRUE o FALSE en los puntos de reticula en donde se cumple el criterio de bonner
#Teniamos dos variables que contenian viento zonal y Cortante de viento
#Podemos hacer una comparacion logica y eso nos va a devolver lo pedido

#Aplico el criterio de bonner
#Viento_850 >=12
#Cortante de viento = Viento(600hpa)- Viento (850hpa) >= 6

Criterio_de_Bonner<-(Viento_850>=12) & (Cortante_Viento>=6)

#c) Definir una variable donde su valor es 1 si se cumple el criterio de bonner.
#Es decir que de cumplirse el criterio de BONNER, en vez de TRUE, pondremos un 1

Criterio_de_Bonner_TRUE<-(Viento_850>=12) & (Cortante_Viento>=6)
Criterio_de_Bonner_TRUE[[TRUE]]<-1


#d) Graficar en 4 paneles la evolución del criterio de Bonner junto con el viento en
#vectores.

dev.off()
x11()

matrix(c(1:4),nrow = 2,byrow = FALSE)
layout(matrix(c(1:4),nrow = 2,byrow = FALSE))

layout.show(4)

#Preparo los datos

lon <- seq(from=200.00,by=1,length.out=nlons)   #Tambien sacado del CTL
lats <- seq(from=-70.00, by=1, length.out=nlats)

x <- rep(lon,nlats) #Se va a repetir 71 veces
y <- rep(lats, each=nlons) #Se va a repetir 141 veces

x
y

length(lon)
length(lats)
length(x)
length(y)

df <- data.frame(lon=x,lats=y)
df

#pero esto mismo lo hace metR <3 :
x_y <- expand.grid(x = lon, y = lats) 

#Listo! Ya podemos armar el df:
df1 <- data.frame(lon=x_y$x,lat=x_y$y)

df==df1

# 5) Graficado de viento --------------------------------------------------

#Grafiquemos el viento: para eso tenemos que agregar a u y a v a nuestro df:

Viento_zonal_850_12<-datos_array[,,levels==850,2,2]
Viento_meridional_850_12<-datos_array[,,levels==850,3,2]

df$Viento_zonal_850_12 = as.vector(Viento_zonal_850_12)  #Lo guardamos en el data frame como vector
df$Viento_meridional_850_12 = as.vector(Viento_meridional_850_12)  #Lo guardamos en el data frame en la columna V


mapa <-map_data("world") #Cargamos un mapa

#Devuelve un dataframe listo para graficar un mapa. 
#Podemos usar geom_path() o geom_polygon() en caso de querer colorear los contientes
#Muy importante mapear estetica "group" para que se unan correctamente los puntos.

ggplot(mapa,aes(x=long,y=lat,group=group))+ #SACA los datos de MAPA
  geom_path() 

#Guardamos la capa geometrica con los datos del mapa en una variable para sumarsela
#a todos los graficos que yo quiera

mi_mapa <- geom_path(data=mapa,                    #Le agrego un poco de estilo
                     aes(x=long,y=lat,group=group),
                     size=.5, 
                     col="#323238")


#Los datos del modelo de donde sacamos la temperatura, y el mapa de ggplot
#usan diferentes convenciones para las longitudes.
#Los de ggplot van de -180 a 180
#Los del modelo van de 0 a 360

#Usamos la función de metR para convertir longitudes:
df$lon <- ConvertLongitude(df$lon) 


# 5) Graficado de viento --------------------------------------------------


#Vamos a usar la capa geometrica geom_arrow() de metR pensada para graficar

# Ajustemos el tamaño con scale_mag() de metR y usemos el parametro skip
# para que no grafique todas las flechas.

ggplot(df,aes(x=lon,y=lats))+
  geom_arrow(aes(dx=Viento_zonal_850_12, dy=Viento_meridional_850_12), 
             skip = 2,           
             size = 0.3,
             arrow.type = "open",
             color = "black")+
  coord_quickmap(xlim = range(df$lon), ylim = range(df$lats), expand = FALSE)+
  scale_mag() +
  mi_mapa +
  labs(title="Viento en 850 hPa",
       x = "Longitud", 
       y = "Latitud",
       mag = "[m/s]")+
  theme_bw()

# 6) Graficado Criterio de Bonner --------------------------------------------------

#Grafiquemos Criterio de Bonner del dia 2

Criterio_de_Bonner_TRUE8500<-Criterio_de_Bonner_TRUE[,,2]

df$Criterio_de_Bonner_TRUE8500 = as.vector(Criterio_de_Bonner_TRUE8500)  #Lo guardamos en el data frame como vector

#grafico 1

ggplot(df,aes(x=lon,y=lats))+
  geom_tile(aes(group=Criterio_de_Bonner_TRUE8500,fill=factor(Criterio_de_Bonner_TRUE8500)))+
  coord_quickmap(xlim = range(df$lon), ylim = range(df$lats), expand = FALSE)+
  mi_mapa+
  labs(title="Criterio de Bonner 850 hPa",
       x = "Longitud", 
       y = "Latitud",
       fill = "[Criterio Bonner]")+
  scale_discrete_manual(
    values = c("white","grey") ,
    aesthetics = "fill",
    breaks = c(0,1),
  )


# 6) Unimos los mapas -----------------------------------------------------

#Unamos ambos mapas:
ggplot(df,aes(x=lon,y=lats))+
  geom_tile(aes(group=Criterio_de_Bonner_TRUE8500,fill=factor(Criterio_de_Bonner_TRUE8500)))+
  mi_mapa+
  geom_arrow(aes(dx=Viento_zonal_850_12, dy=Viento_meridional_850_12), 
             skip = 2,           
             size = 0.3,
             arrow.type = "open",
             color = "black")+
  scale_mag(name="[m/s]")+
  labs(mag = "")+
  coord_quickmap(xlim = range(df$lon), ylim = range(df$lats), expand = FALSE)+
  labs(title="Viento y Criterio de Bonner 850 hPa",
       x = "Longitud", 
       y = "Latitud",
       fill = "Criterio Bonner")+
  scale_discrete_manual(
    values = c("white","grey") ,
    aesthetics = "fill",
    breaks = c(0,1),
  )+ 
  scale_y_continuous(breaks=seq(-90,90,10))+    #Cambio de escalas en y
  scale_x_continuous(breaks=seq(-180,180,30))+  #Cambio de escalas en x
  theme_bw()



#e) Guardar la variable del criterio de Bonner en un archivo binario de doble precisión y
#Little Endian. (Para los puntos donde no se cumple el criterio definir un valor de undef). Crear un archivo de control (header).

#ejemplo de uso de readBin writeBin

#1 Escribo y leo los contenidos de un archivo:

#creo una matriz en el workspace!
a=as.vector(Criterio_de_Bonner)

#Creo el archivo
fid = file('CriterioBonner.bin', 'wb') #Permisos para escribir
fid    
writeBin(a, fid) #guardo a en el archivo fid
close(fid)       #Lo cierro. ya esta
fid              #NO hay nada, esta cerrado



