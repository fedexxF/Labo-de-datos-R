##################################################################
# # Laboratorio de Procesamiento de Informaci�n Meteorol�gica/Oceanogr�fica
# 
# 2� cuatrimestre 2022
##################################################################

# Clase_Arrays 1

##############################################################################################

z<-numeric(1500) #NUmeros de 1 a 15000
z
dim(z) <- c(3,5,100) #AHora le digo que tenga 3 dim #Priemr elemento filas, segundo elemento (5) columnas y 100 matrices (osea 100 veces eso!!!) (o tiempos...? si)
z #nos muetras la matriz. Los numeros a la izquierda muestra lo que hay adentro de la primjer fila[1,], segunda fila[2,] y tercer fila [3,]
#los ,,67 nos marca los tiempos (osea de 100 me tiro 67 matrices)
#Dim 4, fila clomunas nivel, tiempo. Podemos fijar esas variables y nos quedamos con solo los datos que queremos del arrays

h<-numeric(24) 
h
Z <- array(h, dim=c(3,4,2))
Z[,,1]   #Dame todas las filas del primer tiempo


#############################
m <- 21:40 #Sucesiones de valores de 21 a 40
dim(m)<-c(4,5)	#Quiero que n tenga 4 filas 5 columnas
m 				#Me lo acomoda en una matriz por columnas 
class(m) 	

dim(m)<-c(5,4) 	#5 filas 4 columnas
m

m[3,4] 		#me da el dato de la fila 3 y columna 4
m[14]		 # El elemento numero 14


m[3,] 			#Toda la fila 3
m[,2] 		 #Toda la columna 2

#############################
                                           #nrow numero de filas, ncol numero de columnas
m1<-matrix(11:30,nrow=4,ncol=5,byrow=TRUE)#byrow completa los datos por filas al ser TRUE. sino lo hace como siempre, por columnas
m1
rownames(m1)<-c('rojo','azul','amarillo','verde') #Nombre de filas	
colnames(m1)<-c('a','b','c','d','e')				#Nombre de columnas
m1						
colnames(m1) 		#Cuales son los nombres de las columnas
m1[,'b']        #Dame "b", me la dio en forma de fila

#############################
x<-c(1:6) #SUcesion de 1 a 6
dim(x)<-c(2,3) #2 filas, 3 columnas para x
dimnames(x)<-list(c('Fila1','Fila2'),c('Col1','Col2','Col3'))#Les asigno el nombre a las filas y a las columnas
x
ejema<-matrix(1:12,ncol=3,byrow=T, #le puso un nombre filas de 1 a 12 PERO como tenemos 3 columnas, me va a dar 4 filas, columnas a 3 y que me mantenga el formato Fila por fila por el byrow=TRUE)
dimnames=list(letters[1:4],LETTERS[1:3])) #le asgina el nombre a las filas y a las columnas
ejema
ejema[1,1] #da el elemento 1,1. EL que esta en la fila 1 y columna 1
ejema[,c(2,3)] #Me da la matriz que incluye la segunda y tercer columnas y todas las filas
ejema
ejema[,c(-1,-3)] #Me da la matriz que incluye solo la columna 2. No quiero la columna 1  ni la 3.
ejema
ejema[,c(-1,-3),drop=F] #Me da la matriz en forma de columnas. (Tal como esta en la matriz)


#############################
m2<-cbind(c(2,3,4.5),c(5,6,7.5)) # pega por columnas la info. 2,3,4.5 va a la primer columna y 5,6,7.5 en la otra columna. Matriz 3x3
m2		
m3<-rbind(c(2,3,4.5),c(5,6,7.5)) #pega 2,3,4.5 en la primer FILA y 5,6,7.5 en la segunda FILA. Matriz 2x2
m3		
#apply(x,margin,FUN,) # Aplica la función FUN a la dimensión especificada en “margin” 1 indica filas,2 indica columnas.
#############################
x<-matrix(1:6,2,3)#Suceesiones de 1 a 6 en filas. 2 columnas 3 tiempos
x
x[,2]      #Me va a dar solo los elementos de la columna 2
x[1,1:2]   #Me va a dar de la fila 1, los elementos de la columna 1 y 2
x[3,]     #Da error, porque no es de dim 3. no hay 3 filas!
x[3]      #Me da el elemento que esta en la 3 posicion (llenando la columna)
ncol(x); nrow(x) #Numero de columnas y de filas
t(x)            #La traspuesta de la matris
cbind(1,x)      # Uni al 1 que esta en columnas con X. Entonces usa el 1 para completar la primer columna
cbind(1:3,1:6)  #Quiero que me pegues 1 a 3 en columnas y como el elemento mas largo es la columna es la que va de 1 a 6, me reciclo el 1 a 3 en la priemra columna.

#apply(x,margin,FUN,) # Aplica la función FUN a la dimensión especificada en “margin” 1 indica filas,2 indica columnas.

apply(x,1,sum)  # Sumame los elementos de cada fila
apply(x,2,sum)  #Suma los elmentos de cada columna
max(x); min(x)  #Decime el valor max y min de los elementos del array
dim(x)          #Nos dice la dim de la matriz
length(x)       #La longitud de la matriz
max(dim(x))     # Me dice cual es la dim mas grande. osea 3x2, me va a dar 3 supongo jaja

#############################
a=diag(3) #me da la matriz con diagonal de 1
a
b=rnorm(9) 		#nueve valores aleatorios y con distribucion normal. MEDIA 0 Y DESVIO ESTANDAR 1 PORQUE NO ACLARAMOS SINO PODEMOS DEFINIRLO
b
dim(b)=c(3,3) 		#Me hace la matriz 3x3 con los datos que estaban arriba
b
#INstalamos la librearia abind
require(abind)  #Tenemos que abrir la libreria que instalamos #Se ponen arriba de todo!!!!!! Asi ya vemos si las tenemos y todo eso
a
b
abind(a,b,along=3)->c	#	matriz 3x2x2 de 3 tiempos
c                     #
abind(a,b,along=1)->d # matriz 3x3 . 3x3 osea matriz 6x3
d                     #
abind(a,b,along=2)->e # matriz 3x3 . 3z3 ose matriz 3x6
e                     #

##################################################

c<-matrix(c(2,1,5,6,3,8,4,9,2,7,3,5),nrow=3,ncol=4) #IMprime la matriz poniendo los datos por columnas
c
c[order(c[,1]),] #me permuto la fila 1 y 2?
c
c[order(c[,3]),] #me los permuto la fila 
c
c[order(c[,2],decreasing=TRUE),] #no se
c

#################################################
x
diag(x) 		#No hace falta que sea una matriz cuadrada, notemos que x es 2x3 y nos devuelve la diagonal 1:1 =al elemento 1 y 2:2 = al elemento 4

l<-diag(5) #Matriz 5x5 con diagonal de 1
l
s=diag(10,3,4) #10 en la diagonal, 3 filas y 4 columnas
s

x=c(2,3,4,5) #Vector
x
y=diag(x,4,4) #Mandame el vector X a la diagonal y el resto llename de 0 hasta ser una matriz 4x4
y
#######################

x<- matrix(1:6,2,3)
x

suma_fila<-vector("numeric",2)
suma_fila
aux=0

for (i in 1:2){
  for (ii in 1:3){
    aux=aux + x[i,ii]
  }
  suma_fila =aux
  aux=0
}

suma_fila

#Funcion apply
apply(x,1,sum)

#-------------------------------------------------
########################################################
# EJEMPLO para pensar diapositiva final

# esta es una posible soluci�n
# RECUERDEN que lo que estamos practicando es FOR y WHILE
# se puede resolver sin usar estas funciones, pero la clase es sobre ellas ;)

#Sea:
#  • a la secuencia de valores del 1 al 10
#• b los primeros 10 números pares
#Calcular usando el comando for
#- La suma de a y b (guardar en un nuevo vector de 10 elementos)
#- El producto entre los elementos 1,3 ,5 y 7 de a y b (guardar en un nuevo
#                                                       vector de 4 elementos)
#- El cuadrado de cada elemento de a (guardar en un nuevo vector de 10
#                                     elementos)
#- La raíz cuadrada de cada elemento de b (guardar en un nuevo vector de 10
#                                          elementos)
#- Mostrar por pantalla los resultados, indicando lo calculado en cada caso
#- Repetir los cálculos utilizando el comando while


a<-seq(1,10)
b<-seq(2,20,by=2)
a
b
suma<-c(1:10)
suma
# suma<-vector('numeric',10)  # dos formas (de las tantas de generar un vector para despues completar)

for (i in 1:10){
  suma[i]=a[i]+b[i]
}
print(suma)


prod<-c(1:4)
for (i in 1:4){ prod[i]=a[2*i-1]*b[2*i-1]
}

print(prod)


a[3]*b[3] #pruebo que lo haga

cuad<-c(1:10)
for (i in 1:10){
  cuad[i]=a[i]^2
}

print(cuad)

raiz<-c(1:10)
for (i in 1:10){
  raiz[i]=sqrt(b[i])
}

print("la raiz es")
print(raiz)

##### ahora con WHILE ############
sumaw<-c(1:10)

i<-1
while (i <=10){
  sumaw[i]=a[i]+b[i]
  i=i+1  
}
print(sumaw)

cuadw<-c(1:10)
i<-1
while (i <=10){
  cuadw[i]=a[i]^2
  i=i+1
}
print(cuadw)


prodw<-c(1:4) 
i<-1
while (i <=4){ prodw[i]=a[2*i-1]*b[2*i-1]
i=i+1
}

print(prodw)




