#################
##################################################################
# # Laboratorio de Procesamiento de Informaci�n Meteorol�gica/Oceanogr�fica

# 2� cuatrimestre 2022
################################
##################################################################
# # Laboratorio de Procesamiento de Informaci�n Meteorol�gica/Oceanogr�fica

# 2� cuatrimestre 2022
##################################################################

# Clase_Array_2 alumnos
##############################


matrix(8,ncol=2,nrow=4) #Generamos matrices
matrix(NA,ncol=2,nrow=4)
matrix(Inf,ncol=2,nrow=4)
matrix(NaN,ncol=2,nrow=4)

b=matrix(runif(6),nrow=3,ncol=2) #Vector que contenga 6 valores aleatorios entre 0 y 1
b

#############################################
J=matrix(NA,nrow=3,ncol=1) #mATRIZ J de NA
J

J[1,1]=readline('Ingrese su edad ')  #Pedimos que ingresar esos datos en una matriz en la posicion 1:1
J[2,1]=readline('Ingrese su peso ')  #Pedimos que ingresar esos datos en una matriz en la posicion 2:1
J[3,1]=readline('Ingrese su altura ') #Pedimos que ingresar esos datos en una matriz en la posicion 3:1

########################################
m2 <- matrix(1:15, nrow=5, ncol= 3) #genramso 15 espacios de 5 filas y 3 columnas
m2
m3<-rbind(1:3,3:1,c(1,1,1),c(2,2,2),c(3,3,3)) #Pegar vectores por filas(r)
m3
m4<-cbind(1:3,3:1,c(1,1,1),c(2,2,2),c(3,3,3)) #Pegar vectores por columnas(c)
m4

m2 * m3 #Multiplicacio de la matriz m2 y m3. Elemento x elemento... y eso no funca (necesitamos usar otro operador)




#######################################
x <- 1:4
x

z <- x %*% x	#ahora si, el resutlado es un escalar. TODO OK
z

drop(z) 		
z #un vector de un elemento
y <- diag(x) 	 #diagonles de x, el resto 0. MAtriz 4x4 (porque x es el vector 1:4)
y

g <- matrix(1:12, ncol = 3, nrow = 4) #12 elementos entre 3 columnas y 4 filas
g

y %*% g	 #Matriz 4x4 * 4x3 = mos va a dar otra 4x3	
y %*% x  #Matriz 4x4 * 1x4 = nos va a dar otra de 4x1 #OJO QUE LA RTA ME LA DA VERTICAL PERO ES HORIZONTAL REALMENTE
x %*% g	 #Matriz 1x4 * 4x3 = nos va a dar otra de 1x3.


#######################################
A=matrix(c(1:2,3:4), ncol=2,byrow=TRUE)
A

det(A)		

solve(A)    	

A%*%solve(A)
#######################################

B=matrix(c(1,8,5,3,0,2,3,6,1), ncol=3,byrow=TRUE) #byrow=TRUE llena por FILAS
B

L=B
L

L[lower.tri(B)]=0  #Trabajaa co nla diagonal superior de la matriz. Enla daigonal inferior, me pone 0
L                 

L[lower.tri(B,diag=TRUE)]=5    #Trabajaa con la diagonal inferior de la matriz.En la daigonal inf le pone 5. ADEMAS 
L                              #diag=TRUE coloca 5 en la diagonal

U=B
U
U[upper.tri(B,diag=TRUE)]=10 #Completa con 10 el triangulo superior y la diagonal
U

M=B
M
M[upper.tri(B,diag=TRUE)]->pp #El triangulo sup y la diagonal almacenalos en la variable pp
M
pp                           #La maquina va agarrando los valores por columnas



####################################

a<-matrix(c(1,1,1,2,2,2,3,3,3,4,4,4),nrow=3,ncol=4)
a
mean(a) #Calcula la media

colMeans(a,dims=1)		#Calcula la media de las columnas. #Dims=1 no significa nada. Es por default. Osea no se relaciona con filas y columnas
rowMeans(a,dims=1)	  #Calcula la media de las filas.


b<-matrix(c(4,4,4,5,5,5,6,6,6,7,7,7),nrow=3,ncol=4)
b
c=abind(a,b,along=3) #Necesitamos intalar el packages ABIND
c                    #Uso a y le agrego b. Los puso en dos matrices dif
#apply aplica a (a quien, segun que/como, y que cosa/que)
#C Es una matriz 3 filas, 4 coñumnas y dim 2 [3,4,2]
media_1<-apply(c,c(1,3),mean)  #Aplica a la amtriz C, para cada tiempo 1 y 3, dejando libre la dim 2, calculale el prom   
media_1                        #Promedia las columnas. OSEA si C era [3,4,2], chau las Columnas. NOs queda una matriz 3x2
media_2<-apply(c,c(2,3),mean)  #Aplica a la matriz C,para cada tiempo 2 y 3, dejando libre la dim 1, calcula el prom
media_2                        #Promedia las filas. OSEA si C era [3,4,2], chau las filas. NOs queda una matriz 4x2
media_3<-apply(c,c(1,2),mean)  #Aplica a la matriz C, para cada tiempo 1 y 2, dejando libre la dim 3. calcula el prom
media_3                        #Si C es [3,4,2], la matriz quedara 3x4 (sacamos la dim)

desvio_1<-apply(c,c(1,3),sd)
desvio_1
desvio_2<-apply(c,c(2,3),sd)
desvio_2
desvio_3<-apply(c,c(1,2),sd)
desvio_3




###################################################

# Clase_Array_2 alumnos
##############################


matrix(8,ncol=2,nrow=4)
matrix(NA,ncol=2,nrow=4)
matrix(Inf,ncol=2,nrow=4)
matrix(NaN,ncol=2,nrow=4)

b=matrix(runif(6),nrow=3,ncol=2)

#############################################
J=matrix(NA,nrow=3,ncol=1) 

J[1,1]=readline('Ingrese su edad ')
J[2,1]=readline('Ingrese su peso ')
J[3,1]=readline('Ingrese su altura ')

########################################
m2 <- matrix(1:15, nrow=5, ncol= 3)
m3<-rbind(1:3,3:1,c(1,1,1),c(2,2,2),c(3,3,3))

m2 * m3

#######################################
x <- 1:4

z <- x %*% x	

drop(z) 		
y <- diag(x) 	

g <- matrix(1:12, ncol = 3, nrow = 4) 

y %*% g		
y %*% x 
x %*% g		

#######################################
A=matrix(c(1:2,3:4), ncol=2,byrow=TRUE)

det(A)		

solve(A)    	

A%*%solve(A)
#######################################

B=matrix(c(1,8,5,3,0,2,3,6,1), ncol=3,byrow=TRUE)

L=B
L[lower.tri(B)]=0  

L[lower.tri(B,diag=TRUE)]=5    
U=B
U[upper.tri(B,diag=TRUE)]=10

M=B
M[upper.tri(B,diag=TRUE)]->pp
####################################

a<-matrix(c(1,1,1,2,2,2,3,3,3,4,4,4),nrow=3,ncol=4)
mean(a)

colMeans(a,dims=1)		
rowMeans(a,dims=1)	


b<-matrix(c(4,4,4,5,5,5,6,6,6,7,7,7),nrow=3,ncol=4)
c=abind(a,b,along=3)
media_1<-apply(c,c(1,3),mean)
media_2<-apply(c,c(2,3),mean)
media_3<-apply(c,c(1,2),mean)

desvio_1<-apply(c,c(1,3),sd)
desvio_2<-apply(c,c(2,3),sd)
desvio_3<-apply(c,c(1,2),sd)
