
Estacion<-as.character(readline("Ingresar nombre de estacion meteorologica : "))
Altitud<-as.numeric(readline("Ingresar la altura en mts de estacion meteorologica : "))

if (Altitud => 0 & Altitud<= 200) {
  print(paste("La estacion",Estacion,"tiene una altitud de",Altitud, "es una estacion cercana al nicel del mar", sep =" " ))
} else if (Altitud >200 & Altitud <= 1000){
  print(paste("La estacion",Estacion,"tiene una altitud de",Altitud, "es una estacion que se encuentra en un terreno elevado", sep =" " ))
} else if (Altitud >1000 & Altitud<=4000 ){
  print(paste("La estacion",Estacion,"tiene una altitud de",Altitud, "es una estacion que se encuentra en una zona montañosa", sep =" " ))
} else if (Altitud > 4000){
  print(paste("La estacion",Estacion,"tiene una altitud de",Altitud, "es una estacion que s eceuntra en una zona de dificil acceso", sep =" " ))
} else {
  Altitud<-as.numeric(readline("El valor ingresado no es valido. Debe ser un numero y debe ser mayor a 0.Ingresar la altura en mts de la estacion meteorologica : "))
}

#---------------------------------

#Le pedimos que ingrese variables
Estacion<-readline("Ingresar nombre de estacion meteorologica : ")
Altitud<-as.numeric(readline("Ingresar la altura en mts de estacion meteorologica : "))


#Tengo que meter el repeat si(if) se cumple que sea mayor a 0 y sea un .numeric y que repita hasta(break) que ponga bien los datos

#La ide ae smeterle aca el ciclo repeat
repeat{
  if (Altitud <= 0 | is.na(Altitud)==TRUE){
  Altitud<-as.numeric(readline("El valor ingresado no es valido. Debe ser un numero y debe ser mayor a 0.Ingresar la altura en mts de la estacion meteorologica : "))
  } else {break
    }
} 

#y despues

if (Altitud<= 200) {
  print(paste("La estacion",Estacion,"tiene una altitud de",Altitud,"mts", "es una estacion cercana al nicel del mar", sep =" " ))
} else if (Altitud >200 & Altitud <= 1000){
  print(paste("La estacion",Estacion,"tiene una altitud de",Altitud,"mts", "es una estacion que se encuentra en un terreno elevado", sep =" " ))
} else if (Altitud >1000 & Altitud<=4000 ){
  print(paste("La estacion",Estacion,"tiene una altitud de",Altitud,"mts,", "es una estacion que se encuentra en una zona montañosa", sep =" " ))
} else  {
  print(paste("La estacion",Estacion,"tiene una altitud de",Altitud,"mts", "es una estacion que s eceuntra en una zona de dificil acceso", sep =" " ))
} 



#---------------------------------------------------------------------------------------------------------------------------------------------------

m<-c(2,4,5,10,20,50)
m                                #Masa en kg
f<-c(12.5,23.5,30,61,118,294) 
f                               #Fuerza en N
g<-9.8                          #Gravedad en m/s2

p<-m*g
p

mu<- f/p
mu



#Ejemplo vectores
#Este programa calcula el coeficiente de friccion de distintos experimentos
#asi como el coeficiente medio.
# mu = F/(m*g)

rm(list=ls())

#Defino las variables
g <- 9.8  #[m/s^2] gravedad
m <- c(2,4,5,10,20,50)  #[kg]  masa
F <- c(12.5,23.5,30,61,118,294)   #[N]   fuerza
experim<-c(1:6)

#Calculo de mu
mu <- F/(m*g)

#Calculo de la media
mu_media = mean(mu)

#Muestro por pantalla los resultados
print("Los resultados experimentales del coeficiente de friccion",quote=FALSE)
print("Experimento    Coef. friccion",quote=FALSE)
for(i in 1:length(experim)){
  print(paste("",experim[i],format(mu[i],digits=3),sep="         "),quote=FALSE)
}
print(paste("El coeficiente de friccion medio es:",format(mu_media,digits=3)),quote=FALSE)


############################################
############################################
############################################
############################################
############################################


#Ejemplo: producto escalar entre vectores
rm(list=ls())

#Genero dos vectores
a<-10*runif(1000000)
a
b<-10*runif(1000000)
b

#Calculo el producto usando un ciclo FOR
t1<-proc.time()
t1
e<-0
e
for(i in 1:length(a)){
  e<-a[i]*b[i]+e
}
e
print(proc.time()-t1)

#Calculo el producto manipulando arrays
t2<-proc.time()  #Mide el tiempo que tarda la compu en hacer el calculo
t2
c<-sum(a*b)
c
print(proc.time()-t2)


















###################################################################################################
#                               Ejemplo creacion y manipulacion de matrices                       #                                
###################################################################################################

rm(list = ls())

#Vamos a analizar las Temperaturas de diciembre, enero y febrero de 3 estaciones distintas de Argentina.

Mendoza <- c (27,25,23)
Jujuy <- c(24.5, 24,23.5)
Bsas <- c(23,25,24)

# Combinar todas las estaciones con c(Mendoza,Jujuy,Bsas) en un mismo vector y llamarlo Temp_verano:

Temp_verano <-c(Mendoza,Jujuy,Bsas) 
Temp_verano
  
  # Construir una matriz de 3 filas donde cada fila representa cada estacion. Utilizar la funcion matrix().
  # El primer argumento es el vector Temp_verano que contiene todas las temperaturas de verano de las 3
  # estaciones.
  # A continuacion hay que especificar cuantas filas va a tener la matriz nrow=3 y que la informacion 
  # la complete por filas
  # (Por default R completa por columnas) byrow= TRUE
  
  matriz_temp_verano <-matrix(Temp_verano,nrow=3,byrow= FALSE)
  matriz_temp_verano
  
  # Para recordar que es lo que esta guardado en la matriz, podemos ponerle nombres a las filas y a las
  #columnas.
  # Utilizar la funcion colnames() para nombrar las columnas de la matriz matriz_temp_verano con el vector meses.
  # Utilizar la funcion rownames() para nombrar las filas de la matriz matriz_temp_verano con el vector estaciones.
  
  
  meses <- c("DIC", "ENE","FEB")
  meses
estaciones <- c("Mendoza","Jujuy","Bsas")
estaciones

# Nombrar las columnas con el vector meses

colnames(matriz_temp_verano)<-c("DIC", "ENE","FEB")

# Nombrar a las filas con el vector estaciones

row.names(matriz_temp_verano)<-c("Mendoza","Jujuy","Bsas")

#Imprimir por pantalla la matriz

print(matriz_temp_verano)

#Calcular la temperatura media de verano para las tres estaciones utilizando las funciones rowMeans() o colMeans()
# y guardarla en el vector media_verano


rowMeans(matriz_temp_verano)
colMeans(matriz_temp_verano)

media_verano <-c()     #COMPLETAR  
  
  
  # Agregar a la matriz matriz_temp_verano una columna con las temperaturas medias de verano. 
  # utilizar la funcion cbind() 
  
  
cbind(c(),)
  
  # supongamos ahora que queremos agregar la informacion de otra estacion a nuestra matriz. 
  #  utilizar la funcion rbind()
  
ushuaia<- c(9, 10.5,10, 9.8)

rbind(c(ushuaia,matriz_temp_verano))

# calcular la media de enero  de todas las estaciones. Para eso utilizar la funcion mean()
# y seleccionar una columna de la matriz con [ , ]

media_enero <-        #COMPLETAR  
  




