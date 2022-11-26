#################################################TP FINAL#################################################################
#Instalamos las librerias a usar

install.packages("metR")
install.packages("ggplot2")
install.packages("maps")
isntall.packages("here")

# Cargamos librerias
library(ggplot2)
library(metR)
library(maps)
library(here)

#################################################################################################################
#########################################ENUNCIADO###############################################################

# Corriente en chorro en capas bajas (LLJ)

#Para estimar la posiciÃ³n del LLJ en el norte argentino se puede utilizar el criterio de
#Bonner, donde la condiciÃ³n para que se cumpla el mismo es que el viento en el nivel
#elegido sea superior a 12 m/s y la cortante vertical del viento entre ese nivel y un nivel
#superior supere los 6 m/s. Se tienen los datos de anÃ¡lisis del GDAS, de un evento de
#LLJ, en formato binario


#a) Leer los datos del viento zonal y meridional para los niveles entre 1000 y 500 hPa.
#b) Calcular el criterio de Bonner en el nivel de 850 hPa para todos los tiempos (nivel superior 600 hPa).
#c) Definir una variable donde su valor es 1 si se cumple el criterio de bonner.
#d) Graficar en 4 paneles la evoluciÃ³n del criterio de Bonner junto con el viento en
#vectores.
#e) Guardar la variable del criterio de Bonner en un archivo binario de doble precisiÃ³n y
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

#Variables totales

nrecords<-nlevs*nvars*nlats*nlons


#Con list.files le pedimos que lea los archivos que se encuentran en la carpeta /datos
#Con pattern le pedimos que carge solo los archivos con extension .gra
#Guardamos en una varible los archivos a leer

archivos<-list.files(".//datos", pattern = "\\.gra")


#Con ciclo for abrimos todos los archivos 

vector=c()
for (i in 1:length(archivos)) {
  print(paste0(datos,archivos[i]))
  vector = c(vector, readBin(paste0(datos,archivos[i]),"numeric", size=4, n=nrecords, endian="little"))
  print(length(vector))
  
}

datos_array<-array(vector,dim=c(nlons,nlats,nlevs,nvars,ntime)
)

#Extraemos las variables  que nos piden. Es decir, viento zonal y meridional 
#Que segun el archivo CTL corresponde a la variable 2 y 3 y se encuntran en la dimension 4
#Tambien me piden fijar la presion entre 1000 a 500 hpa

#Cargamos una variable que representa los niveles de presion que estan en el CTL
##zdef 21 levels 1000 975 950 925 900 850 800 750 700 650 600 550 500 450 400 350 300 250 200 150 100

levels<-c(1000, 975, 950, 925, 900, 850, 800, 750, 700, 650, 600, 550, 500, 450, 400, 350, 300, 250, 200, 150, 100)
lon_D<-c(seq(200,340,1))
lat_D<-c(seq(-70,0,1))

#Tengamos en cuenta que las longitudes y latitudes en donde se encuntra sudamerica son aproximadamente :

Sud_lon<-c(seq(270,330,1))
Sud_Lat<-c(seq(-60,0,1))

#Las vamos a necesitar mas adelante como variables por eso las dewfino ahora 
# y las vamos a tener en cuenta a la hora de extraer los datos.

Viento_zonal_1000_500<-datos_array[lon_D>=270 & lon_D<=330,lat_D>=-60 & lat_D<=0,levels>=500 & levels<=1000,2,]
Viento_meridional_1000_500<-datos_array[lon_D>=270 & lon_D<=330,lat_D>=-60 & lat_D<=0,levels>=500 & levels<=1000,3,]

#b) Calcular el criterio de Bonner en el nivel de 850 hPa para todos los tiempos (nivel superior 600 hPa)

#El Criterio de bonner se cumple cuando la diferencia de viento entre dos niveles de presion (uno superior y uno inferior)
#es, en modulo, mayor a 6 m/s
#Y cuando el viento en el nivel seleccionado sea superior a 12 m/s

#Tenemos que fijar la presion a 850 hpa y tomar las variables 2 y 3 (viento zonal y meridional)  
#Defino estas variables, ya que las vamos aneceistar mas adelante para graficar


Viento_zonal_850<-Viento_zonal_1000_500[,,which(levels==850),]
Viento_zonal_600<-Viento_zonal_1000_500[,,which(levels==600),]
Viento_meridional_850<-Viento_meridional_1000_500[,,which(levels==850),]
Viento_meridional_600<-Viento_meridional_1000_500[,,which(levels==600),]


#Debemos usar el viento en modulo, es decir, 
#v=sqrt(u^2+v^2) 

Viento_850<-sqrt((Viento_zonal_850)^2+(Viento_meridional_850)^2)
Viento_600<-sqrt((Viento_zonal_600)^2+(Viento_meridional_600)^2)

#Sera mejor hacer esto?:


#Definimos la cortante de viento como la resta entre el nivel de 600 hpa y 850 hpa en valor absoluto

Cortante_Viento<-abs(Viento_600-Viento_850)

################################################################################################################

#Necesito los valores TRUE o FALSE en los puntos de reticula en donde se cumple el criterio de bonner
#Teniamos dos variables que contenian viento en modulo y la Cortante de viento
#Podemos hacer una comparacion logica y eso nos va a devolver lo pedido

Criterio_de_Bonner<-(Viento_850>=12) & (Cortante_Viento>=6)

#c) Definir una variable donde su valor es 1 si se cumple el criterio de bonner.
#Es decir que de cumplirse el criterio de BONNER, en vez de TRUE, pondremos un 1

Criterio_de_Bonner[[TRUE]]<-1


#d) Graficar en 4 paneles la evoluciÃ³n del criterio de Bonner junto con el viento en
#vectores.

#Preparo los datos


lon <- seq(from=270,by=1,length.out=length(Sud_lon))   #Tambien sacado del CTL
lats <- seq(from=-60.00, by=1, length.out=length(Sud_Lat))

x <- rep(rep(lon,length(Sud_Lat)),4) #Se va a repetir 61x4 veces
y <- rep(rep(lats, each=length(Sud_lon)),4) #Se va a repetir 61x4 veces

#Armo el dataframe con las variables pedidas:

df <- data.frame(lon=x,lats=y)

#Grafiquemos el viento: para eso tenemos que agregar a u y a v a nuestro df:

Viento_zonal_850_12<-c(Viento_zonal_850[,,2],Viento_zonal_850[,,4],Viento_zonal_850[,,6],Viento_zonal_850[,,8])
Viento_meridional_850_12<-c(Viento_meridional_850[,,2],Viento_meridional_850[,,4],Viento_meridional_850[,,6],Viento_meridional_850[,,8])

df$Viento_zonal_850_12 = as.vector(Viento_zonal_850_12)  #Lo guardamos en el data frame como vector
df$Viento_meridional_850_12 = as.vector(Viento_meridional_850_12)  #Lo guardamos en el data frame en la columna V

#Para que ggplot2 interprete que estoy cargando datos de 4 dias distintos, almaceno en el data frame una forma de
# diferenciar ese cargado de datos de cada dia

Datos_12_hs<-c(rep("26/03 12hs",length(Sud_lon)*length(Sud_Lat)),
               rep("27/03 00hs",length(Sud_lon)*length(Sud_Lat)),
               rep("27/03 12hs",length(Sud_lon)*length(Sud_Lat)),
               rep("28/03 00hs",length(Sud_lon)*length(Sud_Lat)))
df$Datos_Cada_12_hs<-as.vector(Datos_12_hs)


#Todo listo para realizar el grafico

mapa <-map_data("world") #Cargamos un mapa del mundo

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


#Los datos que obtuvimos de los archivos binarios, y el mapa de ggplot
#usan diferentes convenciones para las longitudes.
#Los de ggplot van de -180 a 180
#Los del modelo van de 0 a 360

#Usamos la funciÃ³n de metR para convertir longitudes:

df$lon <- ConvertLongitude(df$lon) 


#Graficado de viento --------------------------------------------------


#Vamos a usar la capa geometrica geom_arrow() de metR pensada para graficar viento

# Ajustemos el tamaÃ±o con scale_mag() de metR y usemos el parametro skip
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

#Graficado Criterio de Bonner --------------------------------------------------

#Grafiquemos Criterio de Bonner para los tiempos 2,4,6,8 (cada 12 hs)

Criterio_de_Bonner_Evaluacion<-c(Criterio_de_Bonner[,,2],Criterio_de_Bonner[,,4],Criterio_de_Bonner[,,6],Criterio_de_Bonner[,,8])

#Lo guardamos en el data frame como vector
df$Criterio_de_Bonner_Evaluacion = as.vector(Criterio_de_Bonner_Evaluacion) 

#grafico 

ggplot(df,aes(x=lon,y=lats))+
  geom_tile(aes(group=Criterio_de_Bonner_Evaluacion,fill=factor(Criterio_de_Bonner_Evaluacion)))+
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
    labels = c("No cumple", "Cumple")
  )

# 6) Unimos los mapas -----------------------------------------------------

Grafico_mapa<-ggplot(df,aes(x=lon,y=lats))+
  geom_tile(aes(group=Criterio_de_Bonner_Evaluacion,fill=factor(Criterio_de_Bonner_Evaluacion)))+
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
    labels = c("No cumple", "Cumple")
  )+ 
  scale_y_continuous(breaks=seq(-90,90,10))+    #Cambio de escalas en y
  scale_x_continuous(breaks=seq(-180,180,20))+  #Cambio de escalas en x
  theme_bw()

#Unimos el mapa de arriba y le agregamos la separacion por dias y detalles esteticos

Grafico_mapa + facet_wrap( ~ Datos_Cada_12_hs, ncol=2)+
  theme(strip.text.x = element_text(size=8, angle=0),
        strip.background = element_rect(colour="black", fill="#CCCCFF"))

#Guardamos el plot creado

ggsave("./salidas/Criterio_Bonner_850_12hs.jpg",dpi=600, units="cm", height=25,width=25)

#e) Guardar la variable del criterio de Bonner en un archivo binario de doble precisiÃ³n y
#Little Endian. (Para los puntos donde no se cumple el criterio definir un valor de undef). 
#Crear un archivo de control (header).

#Definimos un valor para identificar los puntos en donde no se cumple el criterio

Criterio_de_Bonner_Evaluacion[Criterio_de_Bonner_Evaluacion == 0]<-9.999

#Creo el archivo binario y  le damos permisos de escritura con "wb"

Archivo_Bonner = file('./salidas/CriterioBonner.bin', 'wb')

#Para guardar una variable nos piden que este en forma de vector
#Criterio_de_Bonner_Evaluacion ya esta en la forma que necesitamos

writeBin(Criterio_de_Bonner_Evaluacion, Archivo_Bonner,size = 4,endian = "little" ) 

#Cerramos el archivo 

close(Archivo_Bonner)      

#Leemos el archivo
readBin(paste0(salidas,"CriterioBonner.bin"),"double",n=length(Criterio_de_Bonner_Evaluacion),size = 4,endian = "little" )



archivo_salida <- (here("salidas","CriterioBonner.ctl"))


Instrucciones_CTL<-data.frame(c(paste("dset ^CriterioBonner.bin"),
                                paste("undef 9.999"),
                                paste("title Criterio de Bonner"),
                                paste("options little_endian"),
                                paste("options template"),
                                paste("xdef 61 linear 270.000000 1.000000"),
                                paste("ydef 61 linear -60.000000 1"),
                                paste("tdef 8 linear 18Z26mar2007 6hr"),
                                paste("zdef 1 levels 850"),
                                paste("vars 1"),
                                paste("CB  1 99  Criterio de Bonner"),
                                paste("endvars")
))

write.table(Instrucciones_CTL,archivo_salida,quote=FALSE,col.names = FALSE,row.names = FALSE)