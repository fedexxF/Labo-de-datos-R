#CLASE MAPAS CON GGPLOT2
#01/11/2022
#Dalia

#########
#Objetivo: Graficar temperatura en 850 hPa con sombreado y el viento en 850 hPa
# con flechas.
#########

#Siempre:
rm(list=ls())
graphics.off()


# 1) Instalar/cargar librerias --------------------------------------------

#Instalamos metR
install.packages("metR")

# Cargamos librerias
library(ggplot2)
library(metR)


# 2) Lectura de datos -----------------------------------------------------

# Establecemos directorio donde estan los datos y donde guardar las figuras

setwd("~/Escritorio/LABO/Labo-de-datos-R-main/Clases Practicas/Clase 18 - Graficado campos (ggplot2)-20221101/clase_campos_ggplot2")
datos <- "~/Escritorio/LABO/Labo-de-datos-R-main/Clases Practicas/Clase 18 - Graficado campos (ggplot2)-20221101/clase_campos_ggplot2/datos/"
salidas <- "~/Escritorio/LABO/Labo-de-datos-R-main/Clases Practicas/Clase 18 - Graficado campos (ggplot2)-20221101/clase_campos_ggplot2/salidas/"

#Los datos que vamos a usar estan en un archivo binario, necesito ver el ctl:

#DSET ^modelo.grd
#TITLE SPEEDY MODEL OUTPUT
#UNDEF -9.99E33
#OPTIONS sequential
#XDEF 96 LINEAR 0.0 3.75
#YDEF 48 LINEAR -87.159 3.7
#ZDEF 7 LEVELS 925 850 700 500 300 200 100
#TDEF  1 LINEAR 00Z01JAN1982 6HR
#VARS 5
#U 7 0 U-wind [m/s]
#V 7 0 V-wind [m/s]
#T 7 0 Temperature [K]
#Q 7 0 Specific Humidity [kg/kg]
#Z 7 0 Geopotential Height [m]
#ENDVARS

# Leemos los datos

#Datos en total:
nlons<-96
nlats<-48
ntimes<-1
nlevs<-7
nvars<-5
nrecords<-ntimes*nlevs*nvars*nlats*nlons

data <- readBin(paste0(datos,"model_output.grd"),
                "numeric", #Tipo de datos a leer
                size=4, 
                n=nrecords, #Cantidad de datos a leer
                endian="little")

#Armamos array multidimensional. Recordar orden de dims en binario: 
# lon > lat > level > var > time

data <- array(data,c(nlons,nlats,nlevs,nvars)) #Armo un array segun el orden del CTL

#Creo vectores con info de las latitudes, longitudes y niveles:
lons <- seq(from=0,by=3.75,length.out=nlons)   #Tambien sacado del CTL
lats <- seq(from=-87.159, by=3.7, length.out=nlats)
levels <- c(925, 850, 700, 500, 300, 200, 100)


# 3) Preparación del dataframe para graficar con ggplot2 ------------------

#SI O SI UN DATA FRAME

# Grafiquemos la temperatura en 850 hPa

#Subselección
t850 <- data[,,which(levels==850),3] #Variable 3 es la temperatura (por eso la fijamos) #Queda de dim 2 esto, longitudesx latitudes
t850

#Preparo las columnas del df
#El array resultante de la subselección tiene dos dimensiones (96x48).
#Las filas representan cada longitud
#Las columnas representan cada latitud

#Cada columna del df debe representar un eje y la variable
#Eje x: longitudes
#Eje y: latitudes
#t: temperatura


#Transformo en vector altura geop:
t <- as.vector(t850)  #Esto pone una columna abajo de la otra
t
#¿R ordena x columna o filas? 
# Por columnas. entoonces, los primeros 96 datos corresponden a una latitud.
# Los siguientes 96 a la segunda latitud, y así sucesivamente. 
# Esto es para saber como armar las columnas del eje x e y. 

x <- rep(lons,nlats) #Se va a repetir 96 veces
y <- rep(lats, each=nlons) #Se va a repetir 96 veces

x
y

#Listo! Ya podemos armar el df:
df <- data.frame(lon=x,lat=y,t=t)
df

# 4) Graficado de temperatura ---------------------------------------------

ggplot(df,aes(x=lon,y=lat))+   #Le indicamos de donde saca los ddatos, df y quien es x e y
  geom_point()

#¿Qué es esto?¿Estamos viendo temperatura?

#Probamos mapeando el color de los puntos con el valor de temperatura
ggplot(df,aes(x=lon,y=lat))+
  geom_point(aes(colour=t))

#Funciona, pero no es muy fácil de entender. Sería mejor si cada grilla
#fuese un rectangulo cuyo color de relleno (fill) indique la temperatura
#Existen tres capas geometricas para esto: 
#   geom_raster
#   geom_tile
#   geom_rect

# Usamos geom_tile()
ggplot(df,aes(x=lon,y=lat))+
  geom_tile(aes(fill=t)) #Fill es relleno y lo indexa a la temperatura

# Una vez graficados los datos, para poder ubicarnos mejor geograficamente
# lo ideal seria minimamente graficar los continentes. Para eso usamos los mapas
# que vienen con ggplot, y los obtenemos con map_data(). Existen librerias, por
# ejemplo rearthnature, que ofrecen mas variedad de mapas. 

mapa <- map_data("world") #Cargamos un mapa

#Devuelve un dataframe listo para graficar un mapa. 
#Podemos usar geom_path() o geom_polygon() en caso de querer colorear los contientes
#Muy importante mapear estetica "group" para que se unan correctamente los puntos.

ggplot(mapa,aes(x=long,y=lat,group=group))+ #SACA los datos de MAPA
  geom_path() 

#Guardamos la capa geometrica con los datos del mapa en una variable para sumarsela
#a todos los graficos que yo quiera

mi_mapa <- geom_path(data=mapa,                    #Le agrego un poco de estilo
                     aes(x=long,y=lat,group=group),
                     size=.3, 
                     col="#323238")

#Hacemos de nuevo el grafico de temperatura de 850 hPa y sumamos mi_mapa

ggplot(df,aes(x=lon,y=lat))+
  geom_tile(aes(fill=t))+
  mi_mapa

#Los datos del modelo de donde sacamos la temperatura, y el mapa de ggplot
#usan diferentes convenciones para las longitudes.
#Los de ggplot van de -180 a 180
#Los del modelo van de 0 a 360

#Usamos la función de metR para convertir longitudes:
df$lon <- ConvertLongitude(df$lon) #EHHHH TE CONVIERTE LAS LONGITUDES ACORDE AL SISTEMA WTF

#Graficamos
ggplot(df,aes(x=lon,y=lat))+
  geom_tile(aes(fill=t))+
  mi_mapa+
  coord_cartesian(expand = 0)+
  labs(title="Temperatura en 850 hPa",
       x = "Longitud", 
       y = "Latitud",
       fill = "[K]")

#Los colores no son los adecuados, mejor una escala de naranajas

ggplot(df,aes(x=lon,y=lat))+
  geom_tile(aes(fill=t))+
  mi_mapa+
  coord_cartesian(expand = 0)+
  labs(title="Temperatura 850 hPa",
       x = "Longitud", 
       y = "Latitud",
       fill = "[K]")+
  scale_fill_distiller(palette = "Oranges", direction = 1) #direccion = 1  pone la paleta como viene. -1 la invierte)


# 5) Graficado de viento --------------------------------------------------

#Grafiquemos el viento: para eso tenemos que agregar a u y a v a nuestro df:

u850 = data[,,which(levels==850),1]
v850 = data[,,which(levels==850),2]

df$u = as.vector(u850)  #Lo guardamos en el data frame como vector
df$v = as.vector(v850)  #Lo guardamos en el data frame en la columna V

#Vamos a usar la capa geometrica geom_arrow() de metR pensada para graficar
#viento facilmente

ggplot(df,aes(x=lon,y=lat))+
  geom_arrow(aes(dx=u, dy=v)) #Las flechas son muy grandes

# Ajustemos el tamaño con scale_mag() de metR y usemos el parametro skip
# para que no grafique todas las flechas.

ggplot(df,aes(x=lon,y=lat))+
  geom_arrow(aes(dx = u, dy = v), 
             skip = 2,           
             size = .6,
             arrow.type = "open",
             color = "black")+
  scale_mag() +
  mi_mapa +
  coord_cartesian(expand = 0) +
  labs(title="Viento en 850 hPa",
       x = "Longitud", 
       y = "Latitud",
       mag = "[m/s]")+
  theme_bw()

# 6) Unimos los mapas -----------------------------------------------------

#Unamos ambos mapas:
ggplot(df,aes(x=lon,y=lat))+
  geom_tile(aes(fill=t))+
  mi_mapa+
  geom_arrow(aes(dx = u, dy = v), 
             skip = 2,
             size = .3,
             arrow.type = "open",
             color = "black")+
  scale_mag(name="20 m/s",
            label="")+
  coord_cartesian(expand = 0)+
  labs(title="Temperatura y viento en 850 hPa",
       x = "Longitud", 
       y = "Latitud",
       fill = "[K]")+
  scale_fill_distiller(palette = "Oranges", 
                       direction = 1, 
                       breaks=seq(230,320,10))+ 
  scale_y_continuous(breaks=seq(-90,90,15))+    #Cambio de escalas en y
  scale_x_continuous(breaks=seq(-180,180,60))+  #Cambio de escalas en x
  theme_bw()



# 7) Guardado del gráfico -------------------------------------------------

ggsave(
  paste0(salidas,"temp_viento_850hPa.jpg"),
  dpi=300,
  height=10,
  width=20,
  units="cm"
  )


