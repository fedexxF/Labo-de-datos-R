##################
##################################################################
# # Laboratorio de Procesamiento de Informaci?n Meteorol?gica

# 2? cuatrimestre 2022
##################################################################
###################################################

######################################################
# clase_de gr?ficos_1 alumnos
##############################
#dia 6

x<-(0:65)/10 #valores de x
y<-sin(x)    #Sen de los valroes de x
plot(x)      
plot(x, y)
plot(x, y, main="Funci?n Seno") #Agregamos un titulo
z<-cos(x)
plot(x, z, main="Funci?n Coseno") #la z, la toma como eje Y

windows()
######################################3

plot(sin, -2*pi, 2*pi) #Mira que lindo, te grafica sen-cos entre -2pi y 2pi
plot(cos, -2*pi, 2*pi)

############################
# no pdf

temp<-(runif(20,20,25))
hum<-(runif(20,70,85))

plot(temp,hum) #Grafica los valroes de temp vs hum

plot(temp,hum,type="p") #p=puntitos asquerosos

plot(temp,hum,type="l") #l = lineas

plot(temp,type="l") #Aca grafica las lineas de TEMP

plot(hum,type="l") #Idem pero de huemdad

plot(temp,type="b") #b = ambos, puntos + lineas

plot(temp,type="c") #c=solo lineas del grafico b

plot(temp,type="o") #o = lo mismo que b pero hay recta en los puntos

plot(temp,type="h") #h=barras, lineas verticales

plot(temp,type="s")  #"s" tipo escalera,

plot(temp,type="S") #"S" otro tipo de pasos ver ‘Details’ de plot,

plot(temp,type="n") #"n" no graficar.



##################################
#dia 8

meteo<-data.frame(temp,hum)
meteo
class(meteo)
class(temp)

#Graficos tipo "p" o "o", titulo principal, subtitulo, nombre a las variables X e Y

plot(meteo,type="p",main="Relaci?n Temp-Hum", sub="Meteo",xlab="temperatura",ylab="humedad")

plot(temp,type="o",main="Temperatura m?nima",sub=" Buenos Aires",xlab="Tiempo",ylab="Temp (?C)")

###############################

plot(x, y, main="Seno", type="l") #linea comun

plot(x, z, main="Coseno", lty=2, lwd=5, col="red", type="l") #linea tipo 2, roja

plot(x, z, main="Coseno", lty=3, col="blue", type="l", #linea tipo 3, azul
     xlim=c(0, 2), ylab="cos(x)")

#########################
#dia 9

# PROBAR DE IR CAMBIANDO LAS POSICIONES DEL TEXTO

plot(x, y, main="Funciones seno y coseno", type="l")
lines(x, z, col="blue", lty=2) # col=4 es equivalente
text(x=c(0.5, 0.5), y=c(0, 1), labels=c("sin(x)", "cos(x)"), #Posicion en donde ubica los textos (los dos primeros elementos)
     col=c("black", "blue"))

#################################
#dia 10

plot(x, y, main="Funciones seno y coseno", type="l")
lines(x, z, col="blue", lty=2)
legend(x=3, y=1, legend=c("sin(x)", "cos(x)"), lty=c(1,2),
       col=c("black", "blue"))

# ver las diferencias

plot(x, y, main="Funciones seno y coseno", type="l",lwd=2)
lines(x, z, col="blue", lty=2,lwd=3)
legend(x=0, y=-0.5, legend=c("sin(x)", "cos(x)"), lty=c(1,2),
       col=c("black", "blue"),bty='n')

#bty, saca el recuadro

# ?qued? bien la leyenda?
#Nop, le mando x en la posicion 0 y en -0.5 en y.... mejro lo cambio a 0,0 

plot(x, y, main="Funciones seno y coseno", type="l",lwd=2)
lines(x, z, col="blue", lty=2,lwd=3)
legend(x=0, y=-0, legend=c("sin(x)", "cos(x)"), lty=c(1,2),
       col=c("black", "blue"),bty='n')


#######################################
#dia 12

plot(x, y, main="Funciones seno y coseno", type="l")
lines(x, z, col=2, lty=2)
legend(locator(1),legend=c("sin(x)","cos(x)"),lty=c(1,2),col=c(1,2)) #TREMENDO, TE DEJA HACER CLICK EN EL PLOT Y EL LUGAR DONDE QUEREMOS QUE APAREZCA LA LEYENDA!!!!!

#Gracias locator C:

x <- 1:10; y <- sample(1:10)
nombres <- paste("punto", x, ".", y, sep ="")
plot(x, y); identify(x, y, labels = nombres)

#Gracias identify C: 
#Permite hacer click en los puntos ploteados y te da las coordenadas




################COLORES##########################
#dia 15

pie(rep(1, 12), col = rainbow(12))
pie(rep(1, 12), col = heat.colors(12))
pie(rep(1, 12), col = terrain.colors(12))
pie(rep(1, 12), col = topo.colors(12))
pie(rep(1, 12), col = cm.colors(12))

########################################################
#dia 16

colors()[grep("red",colors())]
colors()[grep("blue",colors())]

#####################################################


############################################
#dia 17

#PAR me deja graficar 4 cosas. 2x2

x <- rbinom(100,5,0.3)


par(mfrow=c(2,2))
plot(x,type="h") 
plot(x,type="l") 
plot(x,type="p") 
plot(x,type="s") 

par(mfrow=c(1,2)) #Llena por filas
plot(x,type="h") 
plot(x,type="l")

par(mfcol=c(2,1)) #Llena por columnas
plot(x,type="h") 
plot(x,type="p") 

###########################
#dia 19

#Correr todo por separado y despues ver todo junto para ver como cambian las cosas

par(bg='blue') #background azul
plot(x,type="h") 

par(bg='white') #background azul
plot(x,type="h")

par(fg='red')
plot(x,type="l") 

par(col.axis="red")
plot(x,type="l") 

par(col.main="darkblue") #Titulo con color
plot(x,type='l',main='Prueba color')

par(col.main="darkgreen",font.main=4) #titulo con color y tamaño de letra
plot(x,type='l',main='Prueba color y letra')

################MARGENES##################

#mai 
# Un vector numérico del tipo c(inferior, izquierdo, superior,
#derecho) que especifica el tamaño de los márgenes en pulgadas.

#mar # idem mai pero en lugar de pulgadas número de líneas.
#Default c(5, 4, 4, 2) + 0.1.

#oma 
#Un vector del tipo c(inferior, izquierdo, superior, derecho) dando el
#tamaño de los márgenes externos en líneas de texto.

#omd 
#Un vector del tipo c(x1, x2, y1, y2) dando la región dentro de los
#márgenes exteriores en NDC (= normalized device coordinates), i.e.,
#como una fracción (in [0, 1]) de la región.

#omi #Un vector del tipo c(inferior, izquierdo, superior, derecho) dando el tamaño de los márgenes externos en pulgadas

########################Más parámetros gráficos#################################

#axes: un valor lógico indicando si ambos ejes deben ser dibujados.
#frame.plot: logical, indicando si se debe trazar un recuadro al grafico. Default
#TRUE
#lty: un vector con tipos de líneas (ya lo vimos, pero estos son los tipos de
# líneas:
# 0=blank, 1=solid (default), 2=dashed, 3=dotted, 4=dotdash, 5=longdash,
# 6=twodash
# lwd: un vector con anchos de líneas. Números positivos, default 1

#############################################################################################
#####################################dia 22##################################################

z <-c(2,4,3,7,8,1,9,4,6,2,7,9,3,8,5,2,4,8,6,2,4)

plot(z, type='l')

plot(z, type='l',axes=FALSE) #Chau recuadro

plot(z, type='l',frame.plot=FALSE) #Hola eje x e y

###############################################
#dia 24


z <-c(2,4,3,7,8,1,9,4,6,2,7,9,3,8,5,2,4,8,6,2,4)
y <-c(4,8,6,7,2,4,9,3,4,8,5,7,2,6,1,8,4,3,9,5,7)

plot(z, type='l',col='red',lty=2,lwd=2)
lines(y,col='blue',lty=1,lwd=3)

leyenda = c("z","y") #Puedo definir una variable leyenda
colors<-c('red','blue') #Puedo definir una variable colores
legend("topleft", leyenda  , text.col = "darkgreen",col=colors, cex=0.8, lty=1, y.intersp = 1, lwd = 3 )

plot(z, type='l',col='red',lty=2,lwd=2,ylim=c(0,12))
lines(y,col='blue',lty=1,lwd=3)

plot(z, type='l',col='red',lty=2,lwd=2,ylim=c(0,12),xlab='tiempo',ylab='valores')
lines(y,col='blue',lty=1,lwd=3)

#LE cambiamso el tamaño de LOS ejeS con cex.axis = 0.6 y con font.axis = 2  lo pone en negrita, es el tipo de letra
plot(z, type='l',col='red',lty=2,lwd=2,ylim=c(0,12),xlab='tiempo',ylab='valores',font.axis=2,cex.axis=0.6)
lines(y,col='blue',lty=1,lwd=3)


##############################
#dia 25

x<-array(rnorm(100),c(100,4)) 
par(fig=c(0,1,0,1), 		 #Region de la figura en el display
    omi=c(0.05,0.9,0,0.3)) 		#Margenes globales en pulgadas (abajo,izq,sup,der)
#Lo pltea, tipo linea,color violeta, ancho 3, titulos de los ejes, escala de los ejes, titulo principal, tamaños
plot(x[,1], type="l", col="violetred2", lwd=3, ylab="Anom. Temperatura",xlab="Tiempo", xlim=c(0,100), ylim =c(-3,3)  ) 
title(main=("Climograma"), font=2, line=1, cex.main=1.2)

par(new=TRUE)    #para graficar sobre la figura anterior
barplot(x[,3]*x[,1],  col="cyan",lwd=2, yaxt="n", ylab="",xaxt="n", xlab="",cex.axis=1.0 )
axis(4, cex.axis=1.0) ## Valores en el eje izquierdo
mtext("Precipitaci?n", side=4, line=2, col="darkblue", cex=1.0) ## Texto para el eje derecho


###################LANYOUT#########################
##################################################

#layout divide el dispositivo en tantas filas y columnas como aparecen en la matriz

#mat 
#con los anchos de las columnas y las alturas de las filas especificadas en
#sus respectivos argumentos (widths y heights)

#layout(mat, widths = rep.int(1, ncol(mat)), heights = rep.int(1, nrow(mat)),
#       respect = FALSE)

#layout.show(n = 1) 
#grafica (parte de) la disposición actual, esquema de las n figuras.

#####organizar el espacio de graficado###############

#dia 27

a1<-matrix(c(1,1,0,2), 2, 2, byrow = TRUE) #Armo una matriz en donde la fig 1 ocupe toda la fila
a1                                         #La fig 2 solo ocupa la posicion 4

a<-layout(matrix(c(1,1,0,2), 2, 2, byrow = TRUE))
a

layout.show(2) #Lo que anticipamos

x<-array(rnorm(100),c(100,4))  
titulo<-c("Figura1","Figura 2")  

for(k in 1:2){
  plot(x[,k], type="l", col="darkblue", lwd=2, ylab="variable",xlab="tiempo",xlim=c(0,100),ylim =c(-3,3)  ) 
  title(main=(titulo[k]), line=1, cex.main=1.2)}



#######################################################
#dia 28

nf <- layout(matrix(c(1,1,0,2), 2, 2, byrow = TRUE), respect = TRUE) #igual a la anterior salvo respect, relaciones entre altos y anchos
layout.show(nf)

#######################################################
#pdf

nf <- layout(matrix(1), widths = lcm(5), heights = lcm(5)) #5 cm de largo y 5 de alto

layout.show(nf)

plot(z, type='l',col='red',lty=2,lwd=2)
#####################################################
###########Crea un scatterplot con histogramas en los márgenes#####
#dia 29

x <- pmin(3, pmax(-3, stats::rnorm(50)))
y <- pmin(3, pmax(-3, stats::rnorm(50)))
xhist <- hist(x, breaks = seq(-3,3,0.5), plot = FALSE)
yhist <- hist(y, breaks = seq(-3,3,0.5), plot = FALSE)
top <- max(c(xhist$counts, yhist$counts))
xrange <- c(-3, 3)
yrange <- c(-3, 3)
Matriz<-matrix(c(2,0,1,3),2,2,byrow = TRUE)
Matriz #Fig 2, fig 1 , nigguna figura, fig 3
nf <- layout(matrix(c(2,0,1,3),2,2,byrow = TRUE), c(3,1), c(1,3), TRUE) #Largo 3 filas 1 columna, altura 1 fila 3 columnas
layout.show(nf)
par(mar = c(3,3,1,1))
plot(x, y, xlim = xrange, ylim = yrange, xlab = "", ylab = "",col='darkgreen')
par(mar = c(0,3,1,1))
barplot(xhist$counts, axes = FALSE, ylim = c(0, top), space = 0, col="lightblue")
par(mar = c(3,0,1,1))
barplot(yhist$counts, axes = FALSE, xlim = c(0, top), space = 0, horiz = TRUE,col="pink")

################################################
#dia 30

x<-array(rnorm(100),c(100,4)) #creo los datos a graficar. Replico los 100 datos en 4 columnas

titulo<-c("Figura1","Figura 2","Figura 3","Figura 4")  #Titulo de cada grafico individual

par(fig=c(0,1,0,1), # Region de la Figura dentro de la region display (x1,x2,y1,y2)
    omi=c(0.05,0.15,0,0.05), # margenes globales en pulgadas (inferior, izquierdo,superior, derecho)
    mai=c(0.6,0.6,0.6,0.5)) # margenes del subplot en pulgadas (inf izq, superior,derecho)
layout(matrix(1:4, 2, 2, byrow= TRUE))

for(k in 1:4){ #Ciclo for para cada que haga eso con las 4 figuras
  plot(x[,k], type="l", col="darkblue", lwd=2, ylab="variable",xlab="tiempo",xlim=c(0,100),ylim=c(-3,3) ) 
  title(main=(titulo[k]), line=1, cex.main=1.2)
  abline(v=20,lty=2,col="grey"); abline(v=40,lty=2,col="grey"); abline(v=60,lty=2,col="grey")
}

#Abline: linea verticual en el eje X en 20,40,60
#OJO CON LOS Margenes, hay que acomodarlos

################################################################
#################Como graficar una serie de tiempo - curve######
#pdf

curve(sin, -2*pi, 2*pi, xname = "t",col="royalblue",lwd=3)
curve(tan, xname = "t", add = NA,  main = "curve(tan)  --> misma x-escala que el gr?fico anterior",col.main="orangered")

########################Gráfico de barras - BARPLOT#################################
#pdf 

require(grDevices) 	
tN <- table(Ni <- stats::rpois(100, lambda = 5))

r <- barplot(tN, col = topo.colors(20))
lines(r, tN, type = "h", col = "red", lwd = 2)


barplot(tN, space = 1.5, axisnames = FALSE,
        sub = "barplot(..., space= 1.5, axisnames = FALSE)")

#################Diagrama de cajas - BOXPLOT##################
x<-rnorm(100)
boxplot(x)
#también es posible dibujar boxplots para matrices, uno por cada columna (variable) de la matriz.
x<-array(rnorm(100),c(100,5))
boxplot(x)
boxplot(x,notch=TRUE)
title(main="notch=TRUE")


