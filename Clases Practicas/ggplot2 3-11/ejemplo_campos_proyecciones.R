#CLASE MAPAS CON PROYECCIÓN ESTEREOGRÁFICA POLAR CON GGPLOT2
#03/11/2022
#Nadia

#########
#Objetivo: Graficar temperatura en 850 hPa con sombreado 
# con flechas, en la región antártica (lats < 50ºS) usando una proyección estereográfica polar
#########

#Siempre:
rm(list=ls())
graphics.off()


# Cargo librerias ---------------------------------------------------------

library(ggplot2)
library(metR)

# Defino rutas y cargo datos (igual a clase pasada!)---------------------------------------------------------

setwd("~/Escritorio/LABO/Labo-de-datos-R-main/Clases Practicas/Clase 3-11")
datos <- "~/Escritorio/LABO/Labo-de-datos-R-main/Clases Practicas/Clase 3-11/datos/"
salidas <- "~/Escritorio/LABO/Labo-de-datos-R-main/Clases Practicas/Clase 3-11/salidas/"

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
                "numeric",
                size=4, 
                n=nrecords, 
                endian="little")

#Armamos array multidimensional. Recordar orden de dims en binario: 
# lon > lat > level > var > time

data <- array(data,c(nlons,nlats,nlevs,nvars))

#Creo vectores con info de las latitudes, longitudes y niveles:
lons <- seq(from=0,by=3.75,length.out=nlons)
lats <- seq(from=-87.159, by=3.7, length.out=nlats)
levels <- c(925, 850, 700, 500, 300, 200, 100)


# Selecciono nivel, variable y region -------------------------------------

t850_antartida <- data[,lats < -50 , levels==850,3]
t850_antartida

#defino latitudes antartida

lats_ant <- lats[lats < -50]

# Armo dataframe para entrar a ggplot -------------------------------------

#Preparo las columnas del df
#El array resultante de la subselección tiene dos dimensiones (96x13).
#Las filas representan cada longitud
#Las columnas representan cada latitud

#Cada columna del df debe representar un eje y la variable
#Eje x: longitudes
#Eje y: latitudes
#t: temperatura


#Transformo en vector temperatura:
t <- as.vector(t850_antartida) 

#R ordena por columnas. entoonces, los primeros 96 datos corresponden a una latitud.
# Los siguientes 96 a la segunda latitud, y así sucesivamente. 
# Esto es para saber como armar las columnas del eje x e y. 

#así habiamos hecho la clase pasada:
nlats_ant <- length(lats_ant)
x <- rep(lons,nlats_ant)
y <- rep(lats_ant, each=nlons)

#pero esto mismo lo hace metR <3 :
x_y <- expand.grid(x = lons, y = lats_ant) 

#Listo! Ya podemos armar el df:
df <- data.frame(lon=x_y$x,lat=x_y$y,t=t)

# Grafico campos de temperatura en ggplot (como en clase pasada!) -------------------------------------

#cargo mapa de base
mapa <- map_data("world")
mi_mapa <- geom_path(data=mapa,
                     aes(x=long,y=lat,group=group),
                     size=.3, 
                     col="#323238")

#Usamos la función de metR para convertir longitudes:
df$lon <- ConvertLongitude(df$lon)

#grafico 1
ggplot(df,aes(x=lon,y=lat))+
  geom_tile(aes(fill=t))+
  mi_mapa+
  labs(title="Temperatura 850 hPa",
       x = "Longitud", 
       y = "Latitud",
       fill = "[K]")+
  scale_fill_distiller(palette = "Oranges", direction = 1)

# Hay lugares donde no tenemos datos, entonces saquemos eso del grafico. Para
# ello usamos coord_quickmap o coord_sf con los limites en x y en y que estaran dados por los rangos que
# toman las longitudes y latitudes

#grafico 2
ggplot(df,aes(x=lon,y=lat))+
  geom_tile(aes(fill=t))+
  mi_mapa+
  coord_quickmap(xlim = range(df$lon), ylim = range(df$lat), expand = FALSE)+
  labs(title="Temperatura 850 hPa",
       x = "Longitud", 
       y = "Latitud",
       fill = "[K]")+
  scale_fill_distiller(palette = "Oranges", direction = 1)

#Hago lo mismo pero con líneas de contorno (con geom_contour()): líneas de nivel que unen puntos de valor constante.
#grafico 3
ggplot(df,aes(x=lon,y=lat))+
  # geom_tile(aes(fill=t))+ #esta linea se va!
  geom_contour(aes(z=t, color = stat(level)))+ #agrego esta linea
  mi_mapa+
  coord_quickmap(xlim = range(df$lon), ylim = range(df$lat), expand = FALSE)+
  labs(title="Temperatura 850 hPa",
       x = "Longitud", 
       y = "Latitud",
       fill = "[K]")

#Ahora quiero "rellenar" esos contornos
#grafico 4  
ggplot(df,aes(x=lon,y=lat))+
  # geom_tile(aes(fill=t))+ #esta linea se va!
  geom_contour_fill(aes(z=t))+ #cambio esta linea
  geom_contour(aes(z = t),
               color = "white",
               size = 0.2) +
  mi_mapa+
  coord_quickmap(xlim = range(df$lon), ylim = range(df$lat), expand = FALSE)+
  labs(title="Temperatura 850 hPa",
       x = "Longitud", 
       y = "Latitud",
       fill = "[K]") +
  scale_fill_distiller(palette = "YlOrRd", direction = 1)

#la leyenda muestra los colores de manera continua pero en el gráfico los contornos son discretos.
#cambio esto:
#Cambiamos la guia o leyenda a una discreta (super = ScaleDiscretised) --> agrego ademas el fill a geom_contour_fill
#Ademas cambiamos el ancho y alto de la barra de colores (guide = guide_colorsteps(barheight = 10, barwidth=1))
 
#grafico 5 
ggplot(df,aes(x=lon,y=lat))+
  # geom_tile(aes(fill=t))+ #esta linea se va!
  geom_contour_fill(aes(z=t, fill = stat(level)))+ #cambio esta linea #rellena con los colores de esa variable (fill)
  geom_contour(aes(z = t),
               color = "white",
               size = 0.2) +
  mi_mapa+
  coord_quickmap(xlim = range(df$lon), ylim = range(df$lat), expand = FALSE)+
  labs(title="Temperatura 850 hPa",
       x = "Longitud", 
       y = "Latitud",
       fill = "[K]") +
  scale_fill_distiller(palette = "YlOrRd", direction = 1,
                       super = ScaleDiscretised, #Modifica ancho y alto de la barra
                       guide = guide_colorsteps(barheight = 10,barwidth =1))  

#Ahora si. Cambiemos la proyección!
#grafico 6
ggplot(df,aes(x=lon,y=lat))+
  # geom_tile(aes(fill=t))+ #esta linea se va!
  geom_contour_fill(aes(z=t, fill = stat(level)))+ #cambio esta linea
  geom_contour(aes(z = t),
               color = "white",
               size = 0.2) +
  mi_mapa+
  #coord_quickmap(xlim = range(df$lon), ylim = range(df$lat), expand = FALSE)+ #esto se va
  scale_x_longitude(limits = range(df$lon)) + #lo cambio por esto
  scale_y_latitude(limits =  range(df$lat)) + #lo cambio por esto
  
  coord_polar() + #esto dice que la proyeccion es esterográfica polar
  
  labs(title="Temperatura 850 hPa",
       x = "Longitud", 
       y = "Latitud",
       fill = "[K]") +
  theme(plot.title = element_text(hjust = 0.5)) + #centro el titulo
  scale_fill_distiller(palette = "YlOrRd", direction = 1,
                       super = ScaleDiscretised,
                       guide = guide_colorsteps(barheight = 10,barwidth =1))
  
#
#pueden investigar cómo corregir lo que pasa en 180º aca: https://github.com/eliocamp/ggperiodic 

#  Guardado del gráfico -------------------------------------------------

ggsave(
  paste0(salidas,"temp_850hPa_antartida.jpg"),
  dpi=300,
  height=10,
  width=20,
  units="cm"
)
