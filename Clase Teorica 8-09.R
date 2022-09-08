##################
##################################################################
# # Laboratorio de Procesamiento de Informaci�n Meteorol�gica/Oceanogr�fica
#
# 2� cuatrimestre 2022
##################################################################

###########  CLASE data.frame ALUMNOS

#########################################################

iris #Aparece toda la inforpacion
print(iris) #Pasa lo mismo que con iris   #pero no almacene ninguna variable
plot(iris) 		 # Representa graficamente las cosas
summary(iris) 		#Resumen estadistiico por columnas
str(iris) 	#representación textual" del objeto
head(iris) # primeras seis filas
tail(iris) # últimas seis filas
		

########################################

m <- cbind(ord=1:3, edad=c(30L, 26L, 9L))  #Uniendo por columnas los vectores ord y edad(en enteros). Matriz 3x2
m
v <- c(1.80, 1.72, 1.05) #un vector 
v

ff <- data.frame(familia=c("Padre", "Madre", "Hijo"),m, estatura=v) #Primer columna llamada familia, con nombres Padre, madre e hijo. Usa como segunda columna la matriz M y la tercer columna alk vector V
ff
ff1 <- data.frame(familia=c("Padre", "Madre", "Hijo"),m, estatura=v,row.names=1) #row.names = Hace que los de las filas sean el primer elemento. Osea Padre Madre e Hijo
ff1
#############################
WORKDIR <- "/home/clinux01/Escritorio/LABO"  #POdemos cargar un data frame, setemao el directoprio de trabajo

setwd (WORKDIR)        

mitabla <- read.table("Leer_tabla.txt") 
mitabla #Me muesra la tabla que arriba le dije que lea 
is.data.frame(mitabla) #ES un daata framE?true
colnames(mitabla) #Nombre de las columnas
rownames(mitabla) #Nombre de las filas

mitabla$Piso #El signo pesos ya sabe que estamos seleccionando alguna variable

mitabla[[2]] #Aca estoy solo pidiendo la columna 2, piso

mitabla[2]    #Muetsra tambien las filas y las columans

mitabla[3, 2]  #Me muettra que hay que la fila 3 y la columna 2

mitabla[3, 2] <- 106   
mitabla #ME modifico el valor de la fila 3 y la columna 2
mitabla$Total <- mitabla$Precio * mitabla$Area
mitabla$Tota #Me genero una tabla que sea Precio*Area como dice arriba
###########################
#
datosimp <- data.frame(anyos=c(1.3,0.4,1.1,2.3,3.1,1.3),                      #Cargamos otro data frame
                       tipo=c(2,3,3,1,3,1),edad=c(22,21,34,42,17,43),
                       sexo=c("H","M","H","H","M","H"))                     #NO lo carga como caracteres,los puso como una variables (factores) H O M. H = 1 y M = 2

attach(datosimp)   #atacahr es.. como crear una variable en GLOBAL ENVIROMENT
anyos              #COmo hice el attach, me lee esta variable sino, no hace nada.
detach(datosimp)   #DEsatachar es...Lo contratio a attach



datos.hombre.filtrados <- datosimp$anyos[datosimp$sexo=='H'] #ME meti en la columnas años, no quiuero todos los elementos, solo los que tienen sexo = H
datos.hombre.filtrados 
mas.peq <- subset(datosimp,anyos<2,select=c(edad,sexo))
mas.peq #Me quedo con algunas filas y con algunas columnas (sunset). TOma los que son menores a 2 años y selecciona edad y sexo (los puso como nombres de columans)

attach(datosimp)           #Atachamos, osea, ya sabes esta masa rriba. Crea un archico en el GLOBAL ENVIROMMENT
edad.final <- edad + anyos 
edad.final             #Suma la edad con los años
datosimp <- transform(datosimp, edad.final = edad+anyos) 
datosimp
datosimp <- transform(datosimp, edad = edad+1) 
datosimp


#Cargamos este data frame
airquality
a<-airquality
plot(a)


#¿cuál es la temperatura media de todos los días?
attach(airquality)
Temp
Temp_Media <- mean(Temp)
Temp_Media

#¿cuál es la temperatura media en el mes de mayo?



#¿cuál fue el día más ventoso?



