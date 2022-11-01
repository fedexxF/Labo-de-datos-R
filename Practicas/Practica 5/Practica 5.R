#Ejercicio 1
#El sitio https://legacy.bas.ac.uk/met/gjma/sam.html almacena la serie mensual del
#Modo Anular del Sur (SAM en ingl ́es) definido a partir de informaci ́on de estaciones en
#el Hemisferio Sur.
#a) Descargar el archivo en formato ASCII y graficar la evoluci ́on temporal del  ́ındice
#b) Calcular el promedio estacional para las 4 estaciones del a ̃no y graficar todas las series
#juntas
#c) Testear si el  ́ındice presenta una tendencia significativa. Filtrar dicha tendencia y
#graficar ambas series en una misma figura.
#d) Utilizando la serie de El Ni ̃no 3.4, realizar un scatter plot del  ́ındice SAM vs El Ni ̃no
#3.4 para el trimestre Sep-Oct-Nov. Obtener la ecuaci ́on de la regresi ́on y testear si la
#relaci ́on es significativa. Superponer la ecuaci ́on de la regresi ́on al gr ́afico del scatter
#plot.

rm(list=ls())
graphics.off()
setwd("~/Escritorio")
setwd("D:/Users/Windows 10/Desktop/LABO/Labo-de-datos-R-main/Practicas/Practica 5")


# 1) Instalar/importar ggplot2

#install.packages("ggplot2")
library(ggplot2)
library(here)

# 2) Leer y preparar datos 

# Configuro el espacio de trabajo

setwd("~/Escritorio/LABO/Labo-de-datos-R-main/Practicas/Practica 5")
setwd("D:/Users/Windows 10/Desktop/LABO/Labo-de-datos-R-main/Practicas/Practica 5")

# Leo los datos del archivo txt
datos<-here("datos","newsam.1957.2007.txt")

tabla1<-read.table(datos,fill = TRUE ,header=TRUE)
tabla1 


#AHora si empezamos a trabajar co nlso datos
#Nos piden graficar la evolucion temporal del  iındice

#Acomodamos los datos

#Eje x: tiempo
fechas <- seq(as.Date("1957-01-01"),as.Date("2022-12-01"),by="month")
fechas

# Genero un array de 7x12 vacío donde guardar los datos
Tabla_Completar <- array(NA, c(66,12))
Tabla_Completar
#Le pongo nombre a las columnas
colnames(Tabla_Completar) <- colnames(tabla1)

#Recorro las columnas de la tabla original,les guardo los datos que cargamos en la tabla

for(i in 1:12){
  Tabla_Completar[,i] <- tabla1[1:66,i]  #a tabla de 1 a 7 y de columnas i (1 a 12). Guardalas por columnas en Tabla_Completar
}
Tabla_Completar

#Eje y: SAM
SAM<- as.vector(t(Tabla_Completar)) # t traspone la matriz
SAM

#Creo el df
df <- data.frame(fecha=fechas, SAM=SAM)
df

# 2) Capa de datos y mapeo de estéticas -----------------------------------

#Llamo a la función ggplot para comenzar un gráfico
#Primer parametro: dataframe
#Segundo parametro: mapeo de esteticas con aes()
g <- ggplot(df, aes(x=fechas,y=SAM))
g

# 3) Capa geometrica ------------------------------------------------------

# En este caso quiero hacer un grafico de barras, la capa correcta es
# geom_col()
g <- g + geom_col(aes(fill=SAM)) #usamos fill porque fill es de relleno y colors es de relieve
g

#Me gustaria remarcar el eje donde y=0. Agrego la capa geométrica
#geom_hline()
g <- g + geom_hline(yintercept=0) #geom_hline agrega una recta horizontal
g

# 4) Capas extra para personalizar el gráfico -----------------------------

#Etiquetas
g <- g + labs(title="Evolucion temporal del SAM",
              subtitle="Respecto del período 1957-2022",
              x="años", #Etiquetas, podria ser tiempo
              y="SAM [No se las unidades ]",
              fill="No se las unidades") #Etiquetas, podria agregarla
g

#Intervalos del eje y
g <- g + scale_y_continuous(breaks=seq(-6,4,1)) 
g

#Intervalos de tiempo del eje x
g <- g +scale_x_date(breaks="4 year",date_labels="%Y")
g

#Colores ed las barras
g <- g + scale_fill_manual(values=c("#E06F21","#00A89D"))
g



# 5) Guardamos el gráfico -------------------------------------------------

ggsave("salidas/SAM.jpg",dpi=600, units="cm", height=15,width=30)


###################################B#######################################
#b) Calcular el promedio estacional para las 4 estaciones del ãno y graficar todas las series
#juntas

#Necesito sacar los promedios de todos los años de
#DEF
#MAM
#JJA
#SON

DEF<-c(tabla1[,1],tabla1[,2],tabla1[,12])
MAM<-tabla1[]
JJA<-tabla1[]
SON<-tabla1[]

# Genero un array de 66x2 vacío donde guardar los datos
Tabla_Completar_DEF <- array(NA, c(66,2))
Tabla_Completar_DEF
#Le pongo nombre a las columnas
DEF_nombres<-c("DICIEMBRE","ENERO","FEBRERO")
colnames(Tabla_Completar_DEF) <- colnames(DEF_nombres)

#Recorro las columnas de la tabla original,les guardo los datos que cargamos en la tabla

for(i in 1:2){
  Tabla_Completar_DEF[,i] <- tabla1[1:66,i]  #a tabla de 1 a 7 y de columnas i (1 a 12). Guardalas por columnas en Tabla_Completar
}
Tabla_Completar_DEF<-cbind(Tabla_Completar_DEF,tabla1[,12])
Tabla_Completar_DEF<-rowMeans(Tabla_Completar_DEF,na.rm = TRUE)

#Eje y: SAM
SAM_PROM_DEF<- as.vector(t(Tabla_Completar_DEF)) # t traspone la matriz
SAM_PROM_DEF

#Eje x: tiempo
fechas <- seq(("1957"),("2022"))
fechas

#Creo el df
df_DEF <- data.frame(fecha=fechas, SAM=SAM_PROM_DEF)
df_DEF


