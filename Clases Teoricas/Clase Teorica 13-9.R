##################
##################################################################
# # Laboratorio de Procesamiento de Informacion Meteorologica/Oceanografica
#
# 2� cuatrimestre 2022
##################################################################

##### Clase LISTAS Alumnos

#####################
pp=rnorm(120,mean=20, sd=7) 
pp
hist(pp) #Histograma
result=hist(pp) #SE lo guarda en la vareable
result          #Nos muestra las varibles y que cosa tiene guardados el histograma
is.list(result) #Pregunta si result es una lista y... TRUE si


hist(pp,freq=TRUE) #Cambia los ejes
hist(pp,Freq=FALSE)

result=hist(pp)
###################################
familia <- list("Maria", "Juan", 10, c("Hugo", "Paula"), c(8,6))
familia         #Como no definimos titulo, nos dice que el primero es MARIA, el segundo Juan... y asi. APARECE ENTRE [[]]

lista.ABC <- c(lista.A, lista.B, lista.C)


familia <- list(madre="Maria", padre="Juan", casados=10,hijos=c("Hugo", "Paula"), edades=c(8, 6))
familia #Ahora si le pusimos nombres, madre = maria... APARECE ENTRE $

length(familia) #largo de la lsita, 5 elementos
length(familia$casados) #Nos dice el largo de la columna que le indicamos, casados tiene 1
length(familia$hijos) #Hijos tiene 2 elementos

#################################


familia$madre		 #Nos da solo la parte de la lista que se llama "madre"
familia[["madre"]] 	
familia[[4]]    #Nos muestra la cuarta columna unicamente
familia[[4]][1] #De la cuarta columna, nos da el primer elemento
familia[["padre"]] <- "Juan Pedro"
familia$padre   		

familia[[4]][3] <- "Ana" #Agrego a la lista 4, espacio 3 la palabra "Ana"
familia
familia$edades[1]<- 2 #Agrega un elemento en la posicion 1 de la lista o columna "edades"
familia 


familia[[4]][2:3] #De la lista 4, me muestra los elementos 2 y 3.


##################################

familia$cumple<-c("3mar","15oct","31dic","7feb") #Le agrega una lista a familia, llamada cumple
familia

################################

mi.lista <- list(a = 1:3, b = c("hola", "adi�s"),z=matrix(1:4,2,2)) #Nos genera un vector y una matriz en una lista
mi.lista

mi.lista[1:2]

mi.lista[2] #Fijate por consola, arriba de lo que me dio, me da un $b
mi.lista[[2]]

is.list(mi.lista[2])
is.list(mi.lista[[2]])

#############################################

air<-airquality #Es una libreria
air             #Nos muestra la librearia

lapply(airquality[, 1:4], mean, na.rm = TRUE) #Nos muestra el promedio de las columnas 1:4. Nos muestra por columnas y en forma de lista. Si hay algun NA, lo saca

sapply(airquality[, 1:4], mean, na.rm = TRUE) #Nos muestra el valor medio de las columnas 1:4, Nosmuestra la RTA por filas. Si hay algun NA, lo saca

################################################

#split, lo que hizo fue pasarme de 150 observaciones a una lista de 3 elementos con 50 datos correspondientes al data frame IRIS

rm (list = ls())
a<-iris
tmp <- split(iris, iris$Species) #Nos toma de iris las Species (iris$Species) y lo almacena en una tabla en trozos en forma vectorial
tmp
is.list(tmp) #Si, es una lista

length(tmp)   #Sus elementos son 3. Lu largo es 3
length(tmp$setosa) #El largo de temp y la columna sesota es 5
length(tmp$setosa$Petal.Length) #El largo de temp y la columna sesota,petal,Length (osea estoy preguntando por todas las columnas )

lapply(tmp,dim)  #Las dimensiones de esa variable temp pero en forma de lista. 
sapply(tmp,dim)  #Las dimensiones de esa variable temp pero en forma de matriz 2x3



##################################

tmp$setosa[Petal.Length](2:10)



###################################

class(tmp) #Que clase es? una lista

class(tmp$setosa) #Que clase es? un data frame!!!
class(tmp$versicolor) #Que clase es? un data frame!!!
class(tmp$virginica)  #Que clase es? un data frame!!!

lapply(tmp$setosa,dim) #Las dimensiones de esa variabe de temp pero en forma de lista. #No tiene dim
tmp$setosa   #Miramos quien es setosa               
#setosa son VECTORES , no tienen dim :c. Dim es para arrays. Por eso nos da NUL a todo




