
v<- seq(16,5,-2)
f<-8
g<-5
t<-"Azul"

a<-g>v
b<- (f<v[2]) |! (g<0) 
c<- v[3]%%2
d<-paste(t,"el",g) 

M<-matrix(c(4,-1,0,-2,1,7,-3,0,4,2,1,-1,5,-2,0,3),nrow = 4,byrow = TRUE)
M
b<-c(7,9,6,5)
c<-4

2*M[c]
which.max(M)
min(M)
M[M<0]<-NA
M[,c]<-b
M
b



#---------------------------------------ej6-------------------------------------------------------------
########################################################################################################
#####################################DATA FRAME#########################################################
########################################################################################################
########################################################################################################
########################################################################################################


#A partir del archivo "temp bsas.Rdata" con datos de temperatura mensual para 
#diferentes niveles durante el periodo 2000-2005 sobre la provincia de Buenos
#Aires. (Cargar el archivo utilizando la funcion "load()")


rm(list = ls())
getwd()
setwd("D:/Users/Windows 10/Desktop/LABO 3/Archivos Practica 3")
setwd("~/LABO/Consultas")

#Cargamos el data frame que nos pedian

datos<-load("temp_bsas.Rdata")
datos<-load("temp_bsas.RData")

#a) Obtener el promedio mensual de temperatura en el periodo analizado para cada
#nivel y cada punto de reticula. Hagalo por un lado utilizando ciclos y por
#otro reacomodando el arreglo utilizando la funcion "apply()".


#Viendo los datos con

datos_dimensiones
datos_dimensiones[["time"]]
datos_dimensiones[["latitude"]]
datos_dimensiones[["longitude"]]
datos_dimensiones[["isobaricInhPa"]]

#Son 6 a?os x 12 meses x 30 dias 

#Nos piden el promedio MENSUAL en esos 6 a?os.
#Usando apply()

#Nos quedamos con longitud, latitud, presion, y transformo el tiempo:
#12 meses en 6 a?os

#Tenemos 72 tiempos. No nos sirve esto, pero si nos sirve 12 meses y 6 años ("por separado", entocnes armo un array con eso)

temp_mensual<-array(variable,c(8,14,4,12,6))       #Armo el array para agarrar los datos que necesito. 12 meses, 6 años. La dim 4 son los meses y la dim 5 son los años
temp_mensual
# E1 E2 E3 ..
# F1 F2 F3 ..
# ..
media_mensual<-apply(temp_mensual,c(1,2,3,4),mean) #Esto toma los datos de la dim 1,2,3,4 (longitud,latitud,presion, MESES , AÑO). la dim 5 no la usamos, chau
media_mensual 
dim(media_mensual)

#Si quiseramos la media estacional o lo que sea, seria lo mismo pero dividiendo con cudiado los 72 datos. Las ultimas son
#meses y años, asique ahi esta la cosa


#Si en el array original dividi 72 datos en 12 meses y 6 a?os
#Aca estoy dividiendo 12 meses en 4 , quedandome con 3 meses y 6 a?os
#Armo el array para agarrar los datos que necesito. 
#Dividiendo 12 meses en 4 , quedandome con 3 meses y 6 a?os. La dim 4= division de meses, dim 5 = meses que me quedo  y la dim 6 = años


temp_EFM<-array(variable,c(8,14,4,3,4,6))
temp_EFM

###
m=temp_mensual[1,1,1,,1]
m_trim=array(temp_mensual,dim=c())

#Esto toma los datos de la dim 1,2,3,4,5 (longitud,latitud,presion,division de meses,Trimestre,A?osO).
#Estaria calculando el promedio mensual de esos 3 meses??? si

media_EFM<-apply(temp_EFM,c(1,2,3,5,6),mean)
media_EFM 


#Es lo mismo esto??? Creo que no, porque estoy dividiendo los meses en 12/3 entonces tengo datos de 4x3 meses (sindo 3 la segmentacion que hice)

temp2_EFM<-array(variable,c(8,14,4,3,4,6))
temp2_EFM
# E1 E2 E3 ..
# F1 F2 F3 ..

#Esto toma los datos de la dim 1,2,3,4,5 (longitud,latitud,presion,division de meses,Trimestre,A?osO). la dim 6 no la usamos, chau
#Estaria calculando el promedio mensual de esos 3 meses???

media2_EFM<-apply(temp2_EFM,c(1,2,3,4,5),mean)
media2_EFM 

#Es legal esto????
#Quedarme con el trimestre (o con los meses) que va de 3:5
#Veo que no, por la cantidad de datos que tendria esto, no tiene sentido

temp_MAM<-array(variable,c(8,14,4,4,3:5,6))
temp_MAM=temp_mensual[,,,3:5,]
(temp_MAM)
# E1 E2 E3 ..
# F1 F2 F3 ..

#Esto toma los datos de la dim 1,2,3,4,5 (longitud,latitud,presion,division de meses,Trimestre,A?osO). la dim 6 no la usamos, chau
#Estaria calculando el promedio anual de esos 3 meses????

media_MAM<-apply(temp_MAM,c(1,2,3,4,6),mean)
media_MAM 


#Jugando con los a?os

#Es legal esto????
#Quedarme con el trimestre (o con los meses) 
#y se me da por divir los a?os de 2 en 2
#Entonces la dim 6 tendria los primeros 2 a?os
#La dim 7, los a?os que van de 2 a 4
#La dim 8, los a?os que van de 4 a 6

temp3_EFM<-array(variable,c(8,14,4,4,3,2,2,2))
(temp3_EFM)
# E1 E2 E3 ..
# F1 F2 F3 ..

#Esto toma los datos de la dim 1,2,3,4,5 (longitud,latitud,presion,division de meses,Trimestre,A?osO). la dim 6 no la usamos, chau
#Estaria calculando el promedio anual de los 3 priemros a?os de esos 3 meses????

media3_EFM<-apply(temp3_EFM,c(1,2,3,4,6),mean)
media3_EFM 


#Es legal esto????
#Quedarme con el trimestre (o con los meses) 
#y se me da por divir los a?os de 3 en 3
#Entonces la dim 6 tendria los primeros 3 a?os
#La dim 7, los a?os que van de 3 a 6


temp4_EFM<-array(variable,c(8,14,4,4,3,3,3))
(temp4_EFM)
# E1 E2 E3 ..
# F1 F2 F3 ..

#Esto toma los datos de la dim 1,2,3,4,5 (longitud,latitud,presion,division de meses,Trimestre,A?osO). la dim 6 no la usamos, chau
#Estaria calculando el promedio anual de los dos priemros a?os de esos 3 meses????

media4_EFM<-apply(temp4_EFM,c(1,2,3,4,6),mean)
media4_EFM 

#Como hago si me quiero quedar con los primeros 3 meses o los segundos 3 meses o con 6 meses 
#Si es con 6 meses, deberia dividir los 12 meses en 2
#array(variable,c(8,14,4,6,2,6)) 


#c)Utilizando la indexaci?on l?ogica seleccione el nivel de 850hPa e imprima por pantalla el promedio
#de temperatura sobre el dominio para cada a~no



#Agarro la dimension que me interesa. osea me hablan de presion.
#EN nuestro array la dim 3 es la de presion
datos_dimensiones[["isobaricInhPa"]]

#La indexacion logica es

datos_dimensiones[["isobaricInhPa"]] == 850

#Which indexa por posicion osea 2 en este caso. Logicamente, es con FALSE TRUE FALSE FALSE ... etc
#La posicion 2 es la que nos interesa, la dejo fija

which(datos_dimensiones[["isobaricInhPa"]] == 850)
prom_anual[,,which(datos_dimensiones[["isobaricInhPa"]] == 850),]
dim(prom_anual[,,which(datos_dimensiones[["isobaricInhPa"]] == 850),]) #Creo que aca estoy seleccionando 850hpa de la variable promedio_anual... osea...esta bien?

Tiempo_meses_anios_850 <-prom_anual[,,which(datos_dimensiones[["isobaricInhPa"]] == 850),]
dim(Tiempo_meses_anios_850) #Me quedo dim 3 (porque me quede con los valores de 850 hpa, soea chau esa dimension = 1)

medias_anuales_850_dominio <- apply(Tiempo_meses_anios_850, c(3), mean, na.rm = TRUE) #Sacame el promeddio de esas 3 dimensiones que quedaron

print(medias_anuales_850_dominio)


#d) Utilizando la indexacion logica seleccione el punto de reticula mas 
#cercano a la localidad de Olavarria y obtenga la temperatura promedio para 
#cada anio en el nivel de 1000hPa.

#Coordenadas de Olavarria(internet):
#Longitud: Oeste 360-60.32'(-60.32)
#Latitud: Sur 36?89'  (-36.89 )

datos_dimensiones$longitude
datos_dimensiones$latitude

#ES utilizando indexacion logica, osea nada de which
#La indexacion logica es
#datos_dimensiones[["isobaricInhPa"]] == 850 asi nos da TRUE FALSE FALSE TRUE BLA BLA BLA

datos_dimensiones[["latitude"]] == -60#ESto va en la segunda dim de nuestra variable
datos_dimensiones[["longitude"]] == -36.75 #ESto va en la primer dim de nuestra variable
datos_dimensiones[["isobaricInhPa"]] == 1000 #ESto va en la tercer dim de nuestra variable
# la cuarta dim, queda asi. COmo esta en años

#Todo muy lindo pero algo anda mal jajaja. La idea safa pero supongo que tengo que encontrar la forma de que me encunetre el valor mas cercano a
#Coordenadas de Olavarria(internet):

#Longitud: Oeste 360-60.32'(-60.32)
#Latitud: Sur 36?89'  (-36.89 )


Latitud_Olavarria<- -36.89 
J<-datos_dimensiones$latitude-Latitud_Olavarria 
J<-abs(J)
Valor_cercano_LatitudOL<-which.min(J)

Longitud_Olavarria<- 360-60.32
f<-datos_dimensiones$longitude-Longitud_Olavarria 
f
f<-abs(f)
Valor1_cercano_LongitudOL<-which.min(f)


#Despues la idea calculo que seria, tomar de proedio anual que ya tenia cargado el array con 6 años, tomo la longitud,latitud y presion que quiero

prom_anual[Valor1_cercano_LongitudOL,Valor_cercano_LatitudOL,(datos_dimensiones[["isobaricInhPa"]] == 1000),]

dim(prom_anual[Valor1_cercano_LongitudOL,Valor_cercano_LatitudOL,(datos_dimensiones[["isobaricInhPa"]] == 1000),])