##################
##################################################################
# # Laboratorio de Procesamiento de Informaci�n Meteorol�gica/Oceanografica
#
# 2� cuatrimestre 2022
#################################################################################
# Clase Funciones
#################


factorial<-function(x) prod(1:x) #Creamos la funcion factorail en donde va a hacer el producto entre 1 hasta el numero que le digamos


factorial(4) #x=4
factorial(8) #x=8

#####################
hipotenusa <- function(x, y) {  #Definimos la funcion hipotenusa
  sqrt(x^2 + y^2)
}

hipotenusa <- function(x, y) {
  return(sqrt(x^2 + y^2))     #Le pedimosuqe nos devuelva la funcion raiz cuadrada...bla bla. 
}

class(hipotenusa)  #Le preguntamos que clase es, es una funcion
hipotenusa(2,3)    #Ingresamos valores de x,y
hipotenusa(y=3,x=2)  #Puedo asignarlo asi c:

#############################
ff <- function(r) {
  return(PI * r^2)  #PI va con minuscula,sino no sabe que es PI
}

ff(2)

ff <- function(r) { #Definimos la funcion
  return(pi * r^2)  
}

ff(2)


#################################################
# ejemplo8.R
# Laboratorio de Procesamiento de Informaci?n Meteorol?gica
# 2? cuatrimestre 2019

# Creamos una funci?n que calcula el m?dulo a un vector
############################################

modulo <- function(v) {         # nombro a la funci?n con el nombre "modulo"
  s <- 0                        # inicializo en 0 a la suma de los cuadrados
  for (e_v in v) {              # me desplazo por los elementos del vector
    s <- s + e_v^2              # incremeto la suma de los cuadrados
  }
  sqrt(s)                     # calculo la ra?z cuadrado y ese es el resultado
}

### Probamos con un vector

vv <- c(-2, 3, 4, -5)
vv <- c(1)
vv <-c(NA)

### Evaluamos la funci?n
modulo(vv)

################################################
# ejemplo8.R
# Laboratorio de Procesamiento de Informaci?n Meteorol?gica
# 2? cuatrimestre 2019

# Creamos una funci?n que calcula el m?dulo a un vector
############################################


# OPTIMIZO la pogramaci?n usando la funci?n de agregaci?n sum()
# que toma como argumento un vector y 
# suma uno a uno sus elementos y entrega esa suma como resultado


####################################################
# Se simplifica la funci?n MODULO

modulo_1 <- function(v) {sqrt(sum(v^2))}  #Le sacamos el ciclo for, es ineficiente y un poquito rebuscado jaja pero esta bien.

#################################################

### Probamos con un vector

vv <- c(-2, 3, 4, -5)
vv <- c(1)
vv <-c(NA)

# lo evaluamos con alg?n vector

modulo_1(vv)


#################################################
# ejemplo9.R
# Laboratorio de Procesamiento de Informaci?n Meteorol?gica
# 2? cuatrimestre 2019

# Creamos una funci?n que calcule el valor medio de un vector
##############################################
promedio <- function(v) {
  
  suma <- 0            # inicializo la suma en cero
  n <- 0               # voy a contar los elementos del vector
  
  for (e_v in v) {
    suma <- suma + e_v      # sumo cada elemento del vector
    n <- n+1                # voy contando los elementos
  }
  
  #(calculo <- suma/n) # Se calcula e imprime el promedio
  
  return(suma/n)
}

#################################################################

# construyo un vector con elementos num?ricos
# arbitrarios, con un generador de n?meros aleatorios
# (distribuci?n uniforme), entre 10.5 y 40.8, generamos 32


nums <- runif(32, 10.5, 40.8)
nums
nums <- runif(1)
nums
nums <- runif(NA)
nums
nums <- runif(1,NA)
nums

promedio(nums)


#################################################
# ejemplo8.R
# Laboratorio de Procesamiento de Informaci?n Meteorol?gica
# 2? cuatrimestre 2019

# Creamos una funci?n que calcule el valor medio de un vector

#########################################################
## utilizando las funciones para vectores sum y length optimizamos el programa


hacer_promedio <- function(v) {
  sum(v)/length(v)
}

#############################################

#con el mismo vector que antes

nums <- runif(32, 10.5, 40.8)
nums
nums <- runif(1)
nums
nums <- runif(NA)
nums
nums <- runif(1,NA)
nums


hacer_promedio(nums)



######################
ejem.fun <- function(x, y, label = "nombre de variable"){ #Buenisima la funcion, pone nombre a los ejes
  plot(x, y, xlab = label) }                              #y lo grafica!!

ejem.fun(1:5,c(2,4,6,8,10))



ejem.fun.2<-function(x){
  y<-x^2
  plot(x, y) }

######################

grande<-function(x,y){  #Es una funcion que compara dos vecores, necesitamos x e y
  y.g<-y>x              # y.g es y>x GUARDA UN TRUE. no un valor
  x[y.g]<-y[y.g]        # a las x en las posiciones y.g(TRUE-FALSE-TRUE...) asginfame lo que esta em Y em esas posiciones               
                        #EN donde es TRUE quedate con Y. Cuando es FALSE no hace nada
  x                     #Dame x 
}


grande(1:5, c(1,6,2,7,3))     #Todas formas equialentes
grande(x=1:5, y=c(1,6,2,7,3)) # RESULTADO x1,y2,x3,y4,x4 (FALSE,TRUE,FALSE,TRUE,FALSE)
grande(y=c(1,6,2,7,3), x=1:5)
grande(1:5, y=c(1,6,2,7,3))

grande(x=c(1,2,3,4,5), y=c(1,6,2,7,3)) # RESULTADO x1,y2,x3,y4,x4 (FALSE,TRUE,FALSE,TRUE,FALSE)


############################
media.total<-function(...) { mean(c(...)) } #No le doy argumentos... de todo lo que te metan adentro, calculale el valor medio

#Pruebo valores para ver si funciona
a<-c(10,20)
media.total(a)       #Funciona

############################

media.total1<-function(...){
  for (x in list(...)){
    if (!is.numeric(x)) stop("No son numeros") #si no son numeros, para y nos muestra un msj
  }
  mean(c(...))
}

#Pruebo valores para ver si funciona
a<-c(10,20)
media.total1(a)      

aNA<-c(10,20,NA)
media.total1(aNA) 

aCH<-c(10,20,"CH")
media.total1(aCH)  "me printea el texto que deberia cuando ingreso un valor no numerico y me para con la funcion"

############################

myplot <- function(x,y) {  #Dos argumentos
  if(missing(y)) {         #Si nadie te mete un valor de y entonces
    y <- x                 # Esa x que te pusieron, asignacela a Y (x=y)(si nadie metio valor de y)
    x <- 1:length(y)       #y a esa X asignale 1 hasta el largo de Y (1:largo de y)(osea tener datos pares)
  }
  plot(x,y)                #Y bueno, graficamelo pls
}


myplot(1:20,11:30)  #aca, todo bien, asignamos todo lo que podiamos
myplot(12:20) #son 9 valores y son solo en x... osea que va a haber 9 datos de x y 9 datos de y por como definimos la funcion

############################

xln <- function(x){      #Dado un vector x
  return(-x * log(x))    #Dame -x multiplicado por el log de x
}
x <- 1:10000 / 10000     #Esto es x

plot(x, xln(x), type = "l", xlab = "Nombre variable X", ylab = "Nombre variable Y",   #Graficamos
     main = "Funcion -x * log(x)")                  # le pone un titulo!!
#Type "l" quiere dewcir que no use los puntitos horribles sino una linea linda. Si se lo sacamos, la linea se vuelve gruesa y fea jaja

########################

grande<-function(x,y=0*x){	#ASignamos si Y = 0 lo toma como numero y no funciona
  y.g<-y>x
  x[y.g]<-y[y.g]
  x
}

grande(c(-12:3)) #logico, porque 0 es mayor que los negativos hasta el 1,2,3. USA 0 PORQUE NO ASIGNE VALORES DE Y
grande(c(1,5),2:3) #ahora si, le puse valores a y. Es igual que el otro

############################
grande<-function(x,y=0*x){	
  if (missing(y)) warning("Estamos comparando con 0") #Buenisimo que me avise, sino, no sabia que pasaba
  y.g<-y>x
  x[y.g]<-y[y.g]
  x
}
grande(-3:3) #muy amable la compu, me avisa que no ingrese valores de Y y que entonces estamos comparando con valores de y=0

############################################

DosMuestras <- function(y1, y2) {        #dos variables
  n1 <- length(y1); n2 <- length(y2)     #asigna n1 = longitud de y1. asigna n2 la longitud de y2
  yb1 <- mean(y1); yb2 <- mean(y2)       #calcula las medias y las guarda en variables
  s1 <- var(y1); s2 <- var(y2)           #Calcula las varianzas y las guarda en variables
  s <- ((n1-1)*s1 + (n2-1)*s2)/(n1+n2-2)   
  tst <- (yb1 - yb2)/sqrt(s*(1/n1 + 1/n2)) #ESta es la t de student creo jajaj
  tst                                      #Damelo por pantalla
}

altura.hombres<-(c(1.78,1.65,1.82,1.69,1.74,1.89,1.67,1.58,1.72,1.64,1.85,1.92,1.70,1.63)) #Pueden tener dif longitud, tienen que ser num
altura.mujeres<-(c(1.56,1.74,1.63,1.58,1.54,1.72,1.63,1.71,1.65))                          
DosMuestras(altura.hombres,altura.mujeres)

###########################################

fibbonacci <- function(y) {if (y==0 | y==1)     #Si y == 0 o y == 1 entocnes devolveme 1
  return (1)
  F0 <- 1; F1 <- 1; i <- 2                      #F0 = 1 . F1 es 1 . i = 2
  repeat {                                      #Repeti todo
    s <- F0 + F1                 	              # s = F0+F1 , suma de los fibs anteriores
    if (i == y)                                 #Si i==2
      return (s)              	                #Dame s
    
    F0 <- F1                                    # F0 = F1
    F1 <- s                                     # F1 = s
    i <- i+1                                    # i = i+1
  }#Hasta aca llega el repeat 
} #Hasta aca llega el if


fibbonacci(0) 
fibbonacci(4) 
fibbonacci(8)                  
fibbonacci(1)
