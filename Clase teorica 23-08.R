#################################################################
# # Laboratorio de Procesamiento de Informaci�n Meteorol�gica/Oceanogr�fica

# 2� cuatrimestre 2022
##################################################################

# Clase_Vectores ALUMNOS

######################################################################

nombre<-c("Pablo", "Mar�a") 	
edad<-c(35, 24)			
estatura<-c(1.77, 1.64)
estatura[2]          

##########################################

v <- vector("integer", 0)	
w <- vector("numeric", 3)		
u <- vector("logical", 5)		 

1:3					

v1<-40:13                 
print(v1);class(v1)


##########################################

labs <- paste(c("X","Y"),1:10,sep="") 
c("X1","Y2","X3","Y4","X5","Y6","X7","Y8","X9","Y10")

#######################################################

pi:1
seq(0,1,length=10)
seq(3) 		
seq(1,5,by=0.5)
seq(from = 4, by = 2, length.out = 8) #lenght y lenght.out en este caso es lo mismo
-1:1/0
rep(1:4,2)
rep(1:4,c(2,3,1,2)) #que y como lo repito. Repite dos veces el primer elemento, 3 veces el segundo. 1 vez el tercero y 2 dos veces el cuarto
rep(1:4,c(2,2)) #REpeti los elementos primeros y segundos dos veces. Da error. C no tiene 4 elementos!!	
sequence(c(2,3)) 

v<-numeric()   #Indica que V almacena numeros       
v[3] <- 17     # el primer elemnto es vacio,el segundo es vacio y el tercer elemento le asginamos el 17.        	 

##########################################

x<-c(1:10)
sample(x,3) 	#Toma de x 3 elementos, aleatorio!
sample(x) 		#Toma todos aleatorios
y<-sample(5:15,5)	#Toma 5 elementos aleatorios de una lista que va del 5 hasta el 15

##########################################

x<-c(0,NA,1,2) #Generamos este vector
y<-x[!is.na(x)] #Generamos el vector X sacando(!, es la negacion)el NA #De X no(!) es NA de (x), buscame y excluime esos valores que NO son  NA
(x+1)[!is.na(x) & x>0] -> z #No Na de x, No 0 de x. quedate con el elemento 1 y 2. Entonces z 2,3. #EL programa primer excluye, despues hace x+1

x<-letters[c(13,1,18,9,15)] #Guarda todas las letras del abecedario letters. Podes calearlas inidicando el numero de la letra en el abecedario
paste(letters[c(13,1,18,9,15)],collapse="") #ESto nos arroja... 1=A...
x[-(4:5)] #Quedate con todos menos con lo que tenes en la posicion 4 y 5)

##############################################

a=c(3,7,6,1,8,9,2)		
sort(a)				#Ordena ascendentemente

sort(a,decreasing=TRUE)	#DEcreciente

sum(a)			#Suma los argumentos de a

b=c(6,5,3,2,NA,8)
sum(b)		 #No puede sumar NA
sum(b,na.rm = TRUE) #Expluimos NA y listo

prod(b)		#Multiplica todo pro tenemos una NA
prod(b,na.rm = TRUE)	#Expluimos NA y listo

##########################################


x<-c(2,5,3,7,1,8,9,4,6)
sum(x)
length(x) #Cuanto mide el vector

sum(x<5)  #Cuantos cumplen la condicion de ser menores a 5
x[x<5]    #Dame los elementos menores a 5 del vector. Los corchetes son los que excluyen los valores.
sum(x[x<5]) #Sumame los elemenetos menores a 5 del vector
length(x[x<5]) #Dame el largo de los elementos que cumplen esa condicion

x*(x<5) #Me devuelve el vector que cumple que x sea menor a 5. De no cumplir, da 0. Sino, me da el numero. Estos fueron los valores que sumo!
sum(x*(x<5)) 
which(x<5) #Donde estan parados los elementos que cumplen eso
sum(which(x<5)) #SUMA POSICIONES NO VALORES!!!!)

##############################################

z<-numeric(10) #Generamos un ector numerico
id<-which(x<5) #Me quedo con la posicion que cumplan eso
z[id] <- x[x<5] #en z de 1,2,3,,4,5,8 guardame esos elementos donde x<5
z[id]
z[which(x<5)] <- x[x<5] 	
z[which(x<5)]

#########################################
u <-c(3, 4, 5) 
v <- c(5, 4, 3)
w <- c(u, v) 		 
print(w)


v <- c(8, 7, -3, 2, 182)
v
v[1]
v[2]
v[5] 
v[1] <- v[2] - v[5] 		#Toma el vector de la posicion
v

v[8] <- 213 #Le asgina 213 al elemnto 8, lo que no encuentra (elemnto 6 y 7) son NA.

############################################

v <- c(2, 3) - c(5, 1) 	 
v
v <- c(2, 3, 4) * c(2, 1, 3)	
v
v <- c(2, 3, 4)^(3:1)
v
v <- c(9, 8, 31)		 
sqrt(v)			

angulos <- c(30, 45, 60) * (pi/180)     	
angulos
senos <- sin(angulos)	
senos
################################################
nombre<-c("Pablo", "Maria")
edad<-c(35,24)
v<-vector("integer",0)
integer(0)
w<-vector("numeric",0)
u<-vector("logical",0)

1:3

labs <- paste(c("X","Y"),1:10,sep="")   
c("X1","Y2","X3","Y4","X5","Y6","X7","Y8","X9","Y10")

pi:1
seq(0,1,length=10)
seq(3)
seq(1,5,by=0.5)
seq(from = 4, by = 2, length.out = 8)  #lenght y lenght.out en este caso es lo mismo
-1:1/0
rep(1:4,2)
rep(1:4,c(2,3,1,2))
rep(1:4,c(2,2))
sequence(c(2,3))


ejercicio en clases "para pensar"
x<-c(2,0,1,3,6,1)
x[1:3]

1:5
2*1:5

1:7*1:2
1:8*1:2