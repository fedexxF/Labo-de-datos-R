#Ejemplo clase 18/10/22
#Objetivo: Graficado de series temporales
#A partir de las series de T y PP de OCBA trabajadas la clase pasada
#Generar graficos 
###########################################################################


rm(list=ls())
graphics.off()   #cierro los graficos 

DATA<- "~/Escritorio/LABO/Labo-de-datos-R-main/Clases Practicas/Graficado 18-10/datos/"       #CAMBIAR RUTA
salidas<-"~/Escritorio/LABO/Labo-de-datos-R-main/Clases Practicas/Graficado 18-10/salidas/"      #CAMBIAR RUTA

archivos <- list.files(salidas,pattern = "\\.csv$")  # Obtengo los nombres de todos los archivos en un directorio
                                                     #PATTERN para quedarme solo con los que contienen .csv  
#Leo los datos de Temperatura
TablaT <- read.csv(paste(salidas,archivos[2],sep=""))
temp <- as.matrix(TablaT[1:7,2:13])

#Leo los datos de PP
TablaPP <- read.csv(paste(salidas,archivos[1],sep=""))
precip <- as.matrix(TablaPP[1:7,2:13])

#Genero vectores de anios y de meses
a<-seq(2000,2006)
m<-colnames(temp) #Guardo los nombres de las columnas de temp en m (osea los nombres de los meses)

##############################################################
#GRAFICADO
##############################################################
#1) Grafico las series de temperatura de 2000, 2006 y promedio
texto <- c("2000","2006","2000-2006")
colores<-c("pink","blue","black")
jpeg(filename = paste(salidas,"FIG_1.jpg",sep=""), res = 300, width=2000, height=1500, pointsize= 10)
plot(temp[1,],type="b",xlab="meses",ylab="Temperatura (C)",
     main="Temperatura OCBA",ylim=c(0,30),col = "pink",xaxt="n")  #xaxt="n" para que no coloque labels del eje x
lines(temp[7,],type="b",col = "blue",xaxt="n") #Agrega eso al plot. NO se puede suar plot otra vez porque lo sobreescribe
abline(a=TablaT[8,14],b=0,lty=3,col="black",xaxt="n")  #grafica una recta a+bx
legend("bottomright",texto,cex=0.8,col = colores,lty=1)
axis(1,at=1:12,labels=m)   #pongo nombres al eje x
dev.off()

#2) Grafico las series de temperatura de todos los anios
nyears <-dim(temp)[1]    #la cantidad de a?os que tengo
colors <- rainbow(nyears) #Defino un vector con los colores de la paleta rainbow
markers <- seq(1,nyears)  #Defino los marcadores
linetype <- c(1:nyears)   #Defino tipo de linea

jpeg(filename = paste(salidas,"FIG_2.jpg",sep=""), res = 300, width=2000, height=1500, pointsize= 10)

#Preparo el grafico
plot(c(1,12),c(1,30), type="n", xlab="meses",
     ylab="Temperatura (C)",main="Temperatura 2000-2006 OCBA",xaxt="n")
for(i in 1:nyears){
  lines(c(1:12), temp[i,], type="b", lwd=1.5,
        lty=linetype[i], col=colors[i],pch=markers[i])
}
axis(1,at=1:12,labels=m)   #pongo nombres al eje x
#Agrego la leyenda
legend(1, 12, a, col=colors,pch=markers,lty=linetype)

dev.off()


#3) Grafico la Precipitacion

jpeg(filename = paste(salidas,"FIG_3.jpg",sep=""), res = 300, width=2000, height=1500, pointsize= 10)

#Genero la disposici?n de los paneles
par(fig=c(0,1,0,1),omi=c(0.5,0.15,0,0.05),mai=c(0.7,0.7,0.7,0.7)) #Pone los margenes en la figura 
layout(matrix(1:2,2,1))                                           #Nos distribuye los graficos matrix(1:2,2,1) 

barplot(precip[1,],col="forestgreen",main="Precipitacion OCBA 2000",
        xlab="meses",ylab="PP (mm)",ylim=c(0,500),names.arg=m)

box()    #agrego recuadro
barplot(precip[7,],col="firebrick",main="Precipitacion OCBA 2006",
        xlab="meses",ylab="PP (mm)",ylim=c(0,500),names.arg=m)
box()   #agrego recuadro

dev.off()


######
# 4) Grafico una serie temporal y su ajuste lineal   

jpeg(filename = paste(salidas,"FIG_4.jpg",sep=""), res = 300, width=2000, height=1500, pointsize= 10)

d <- dim(temp)
serieT <- array(t(temp),dim=d[1]*d[2])   #Armo una serie temporal para graficar
time <- seq(as.Date("2000/1/1"), by = "month", length.out = length(serieT))

plot(time,serieT,type="b", col = "blueviolet", lwd = 2, ylab="Temperatura (C)",
     xlab = "Tiempo",ylim = c(0,30),
     main = "Serie Temperatura mensual OCBA \n y ajuste por cuadrados minimos")
#NOTA: Graficamos el ajuste por cuadrados minimos, solo para conocer la herramienta
#No tiene sentido estadístico (porque son pocos datos)
abline(lsfit(time,serieT), col = "cornflowerblue", lwd=1.5) #grafica el ajuste por cuadrados minimos

dev.off()    
