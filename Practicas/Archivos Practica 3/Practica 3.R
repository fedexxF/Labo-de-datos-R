#####################Practica 3##########################################
rm(list = ls())
setwd("D:/Users/Windows 10/Desktop/LABO/Labo-de-datos-R-main/Practicas")

#Ejercicio 1
#a) Generar un vector que contenga los n?umeros del 1 al 1000. Generarlo utilizando un ciclo "for"
#y utilizando la notaci?on abreviada de R.

rm(list = ls())

#fomra normal y facil

vector<-c(1:1000)
vector

#Con ciclo for


vectFOR<-c()   #Genero un vector vacio
for (i in 1:1000) { #Hago que la iteracion sea de 1:1000 
  vectFOR[i]<-i+1   #Hago que me recorra i+1 y me lo guarde en la variable asignada
  
}
vectFOR


vectFOR<-c()   #Genero un vector vacio
for (i in 1:L<-as.numeric(readline("Ingresar longitud del vector : "))) {
  vectFOR[i]<-i+1
  
}




#b) Generar un array de dos dimensiones que tenga 20 columnas y 30 filas. 
#La componente correspondiente a la fila i, columna j del array debe tener el resultado del producto de i*j.

rm(list = ls())
m1<-matrix(1:600,nrow=30,ncol=20) #Tiene 600 lugares(30x20), 30 filas, 20 columnas
m1

#Si, pero nos piden que almacene los valores de hacer ixj
#Usando u nciclo for puedo ir acomodando las variables, como hicimos en el punto a)
#Tengo que iterar i 1:30 y j 1:20 y que eso se em guarde en mi variable
#PERO necesito que mi variaboe guarde los datos de ixj... ENTONCES:

for (i in 1:30) {
  for (j in 1:20) {
    m1[i,j]<-i*j
  }
  
}
m1 #Perfecto, conseguimos que alamcene ixj


#c) Generar la misma matriz del punto anterior pero como producto punto a punto de dos matrices.

#Bueno, ahora con producto punto... osea...si...
#No se... osea necesito una matriz i y una matriz j
#hacer que i sea 1:30 y j de 1:20 a eso hacerle i*j y me lo guarde en otra matriz...pero...no se

i<-1:30 #filas
j<-1:20 #Columnas

m1<-i*j #No, obvio que esto no srive jkajaja
m1
#Necesito matrices que esten formadas por i y otra qeu este formada por j


m2<-matrix(i, nrow=30, ncol=20) #Listo, linda matriz
m2
m3<-matrix(j, nrow=30, ncol=20) #Tienen que tener la misma cantidad de filas y de columnas 
m3

m4<-m2*m3
m4        #Esta mal...Esta tomando un elemento de m3 y lo multiplica por la poscion
          #Osea m4 me da por ejemplo
          #Si tomo el elemento [1;2] de m2 osea 1  me lo multiplica por el elemento [1;2] de m3 = 11

#Como soluciono eso...
#Tengo que re acomodar la matriz m3. Si llena por columnas no me sirve pero si hago que llene por filas
#me quedaria 1 2 3 4 5... (columanas enteras de 1,2,3,4,5..20 hasta llegar a 30 filas)
#Entonces
#Si tomo el elemento [1;2] de m2 = 1 me lo multiplica por el elemento [1;2] de m3 osea 2 (ahora es 2)...
#Deberia funcionar



m3<-matrix(j, nrow=30, ncol=20, byrow=TRUE)
m3

m4<-m2*m3 
m4        #Ahora siii. LISTO


#d) Guardar la quinta columna del array mencionado en el punto anterior en un vector B.

B<-m4[,5] #SI
B



#e) Generar un array de tres dimensiones. Si i, j y k son los sub?indices que identifican la posici?on
#de cada componente del array, el valor de cada componente debe ser igual al producto de i * j
#* k. Generar un array de dos dimensiones que contenga la componente k=4 del array de tres
#dimensiones. (El tama~no de la matriz en cada una de las dimensiones debe ser 20, 30 y 10
#              respectivamente).



#Osea me pide que i=20,j=30,k=10 y que sea dim 3
#y generar un array no una matriz ovector.. bueno
#Creo que es igual que lo que ya hicimos en b) Me voy a fijar

rm(list = ls())

for (i in 1:30) {
  for (j in 1:20) {
    for (k in 1:10) {
    m1[i,j,k]<-i*j*k
   }
  }
}
m1

#ah, no defini el array m1 jkajaja
m1<-array(1:600,nrow=30,ncol=20,10)

#Uso help
#array(data = NA, dim = length(data), dimnames = NULL)
#Busco un poquito mas en internet y... creo que deebria funcioanr esto
m1<-array(data = NA, dim=c(20,30,10))
m1



for (i in 1:30) {
  for (j in 1:20) {
    for (k in 1:10) {
      m1[i,j,k]<-i*j*k
    }
  }
}
print(m1)


#---------------------------------------ej2-------------------------------------------------------------

#Es proabr una seguidilla de cosas y ver que hacen, copiarlo manual es la meurte, asique lo hago de una sin poner la consigna

#Pongo los variables predefinidas segun el enunciado
rm(list = ls())
a<-c(4,-10,7,-2,8,-6,1,-15,3,-9)
i<-3
j<-5
b<-c(1,5,7)
c<-c(TRUE,TRUE,FALSE,TRUE,FALSE,FALSE,TRUE,FALSE,FALSE,FALSE)

#Ahora si, hago el ejercicio

a[]                 #Muestra todos los elementos de a
a[i,j]              #"Numero incorrecto de dimensiones", a es un vector, no una matris?
a[seq(i,i,2)]       #Creo que esta sequenciando de 2 en 2 o me esta jugando con las dim?
a[seq(i,j,3)]       #Creo que esta secuenciando de 3 en 3
a[i:length(a)]      #Esta iterando de "i=3" a "longitud de a = 9" (osea muestra que hay en la posocion 3 en adelante, hasta el final del vector a)
a[c(1,5,7)]         #Muestra los valores de las posiciones 1,5,7
a[b]                #Es igual a la sentencia anterior
a[c]                #Me muestra los valores de las posiciones donde hay TRUE en c
a[a==-4]            #Me devuelve si a=-4

#b)
#Ingreso los datos que me da el enunciado
rm(list=ls())
m1<-matrix(1:25,nrow=5,ncol=5,byrow=TRUE) 
m1 #Me costo un poquio pero ahi quedo


mi_matriz[3,2]                    #Toma elelemento de la 3er fila, 2da columna
mi_matriz[3,]                     #Elementos de la 3er fila y todas las columnas
mi_matriz[,2]                     #Elementos de la 2da columna y todas las filas
mi_matriz[seq(1,5,2),]            #Toma los elementos de la fila 1 a la 5 de 2 en 2, con todas las columnas
mi_matriz[,seq(1,5,2)]            #de la columna 1 a la 5 de 2 en 2, con todas las filas
mi_matriz[seq(1,5,2),seq(1,5,2)]  #1ra fila 1er columna, 3er fila 3er columna, 5ta fila 5ta columna
mi_matriz[10]                     #10mo valor (contando por columnas)
mi_matriz[b]                      #1er valor, 5to valor, 7mo valor (B esta definido como b<-c(1,5,7))

#---------------------------------------ej3-------------------------------------------------------------

#a) Escribir un programa para calcular el producto matricial entre dos matrices A y B. Verificar los
#resultados utilizando la funci?on "%*%" para el producto de arrays en R.

rm(list = ls())

#defino la matriz m1 y m2
m1<-matrix(1:4,2,2)#Creo una matriz de 2x2
m1 
m2<-matrix(5:8,2,2)#Creo una matriz de 2x2
m2
m3<-matrix(NA,nrow(m1),ncol(m2)) #Genero una variable que me guarde las matrices m1 y m2 
m3

for(i in 1:nrow(m1)){    #Recorro filas de m1
  for(l in 1:ncol(m2)){  #Recorro columnas de m2
    m3[i,l]=sum(m1[i,1:ncol(m1)]*m2[1:nrow(m3),l])  #Realizo el producto matricial
  }
}
print(m3)

print(m1%*%m2) #Hago de la otra forma que me piden

m3==m1%*%m2     #Es TRUE en todas sus posiciones


#b) Realizar un programa que calcule el producto componente a componente entre dos matrices A y
#B. Verificar los resultados utilizando la funci?on "*" para el producto componente a componente
#de arrays en R.


rm(list = ls())
m1<-matrix(1:4,2,2)#Creo una matriz de 2x2
m1 
m2<-matrix(5:8,2,2)#Creo una matriz de 2x2
m2
m1xm2<-matrix(0,nrow(m1),ncol(m2)) #Genero una variable que me guarde las matrices m1 y m2 
m1xm2

for(i in 1:nrow(m1)){    #Recorro filas de A
  for(j in 1:ncol(m2)){  #Recorro columnas de B
    m1xm2[i,j]=m1[i,j]*m2[i,j]  #Realizo el producto componente a componente
  }
}

print(m1xm2)

print(m1*m2) #Hago de la otra forma que me piden

m1xm2==m1*m2     #Es TRUE en todas sus posiciones




#c) Aplicar los programas anteriores al producto entre matrices de m?as de 100 filas/columnas y
#comparar los tiempos involucrados. Comparar la eficicienca de las funciones de R con la de los
#programas realizados.

rm(list = ls())

#defino la matriz m1 y m2
m1<-matrix(1:10000,100,100)#Creo una matriz de 2x2
m1 
m2<-matrix(1:10000,100,100)#Creo una matriz de 2x2
m2
m3<-matrix(NA,nrow(m1),ncol(m2)) #Genero una variable que me guarde las matrices m1 y m2 
m3
m1xm2<-matrix(0,nrow(m1),ncol(m2)) #Genero una variable que me guarde las matrices m1 y m2 
m1xm2

t <- proc.time()  #Inicialza el cronometro


for(i in 1:nrow(m1)){    #Recorro filas de A
  for(l in 1:ncol(m2)){  #Recorro columnas de B
    m3[i,l]=sum(m1[i,1:ncol(m1)]*m2[1:nrow(m3),l])  #Realizo el producto matricial
  }
}

proc.time()-t       #Finaliza el cronometro




t <- proc.time()

m1%*%m2                 #Hago de la otra forma que me piden

proc.time()-t          #Es el doble de rapido como minimo


t <- proc.time()

for(i in 1:nrow(m1)){    #Recorro filas de A
  for(j in 1:ncol(m2)){  #Recorro columnas de B
    m1xm2[i,j]=m1[i,j]*m2[i,j]  #Realizo el producto componente a componente
  }
}


proc.time()-t  

t <- proc.time()

m1*m2             #Hago de la otra forma que me piden

proc.time()-t  




#d) Agregar a los programas mencionados en los puntos a) y b) un chequeo que determine antes
#de realizar los c?alculos si las dimensiones de los arrays son compatibles para los c?alculos que
#se quieren llevar a cabo y que en caso de que las dimensiones no sean compatibles, muestre un
#mensaje por pantalla y que termine el programa.



#e) Al programa del ejercicio anterior agregar una secci?on que identifique las componentes negativas
#del producto de ambas matrices y las convierta en cero.

rm(list = ls())

#defino la matriz m1 y m2
m1<-matrix(1:4,2,2)#Creo una matriz de 2x2
m1 
m2<-matrix(5:8,2,2)#Creo una matriz de 2x2
m2
m3<-matrix(NA,nrow(m1),ncol(m2)) #Genero una variable que me guarde las matrices m1 y m2 
m3

m1<-matrix(-1:2,2,2)#Creo una matriz de 2x2 #Prueba que me transforme los valores negativos en 0

                     
{replace (m1,m1<0,0)} #replace(de m1, agarrame los valores que en m1 son menores a 0 y reemplazalos por 0)
{replace (m2,m2<0,0)} 
M=matrix(NA,nrow(m1),ncol(m2)) #Me genero la matriz como antes

if(ncol(m1)==nrow(m2)){         #si tiene el mismo numero de columnas, entoces haceme la cuenta. SINO printiame u nmsj de error)
  for(i in 1:nrow(m1)){
    for(l in 1:ncol(m2)){
      m3[i,l]=sum(m1[i,1:ncol(m1)]*m2[1:nrow(m2),l])
    }
  }
}else{print("Las dimensiones no son compatibles")}

print(m3)
print(m1%*%m2)


#para el item b seria lo mismo pero con DIM

rm(list = ls())
m1<-matrix(1:4,2,2)#Creo una matriz de 2x2
m1 
m2<-matrix(5:8,2,2)#Creo una matriz de 2x2
m2
m1xm2<-matrix(0,nrow(m1),ncol(m2)) #Genero una variable que me guarde las matrices m1 y m2 
m1xm2

m1<-matrix(-1:1,1,1)#Creo una matriz de 2x2 #Prueba para que de error
       
{replace (m1,m1<0,0)} #replace(de m1, agarrame los valores que en m1 son menores a 0 y reemplazalos por 0)
{replace (m2,m2<0,0)} 
m1xm2=matrix(0,nrow(m1),ncol(m2)) #Me genero la matriz como antes

if(dim(m1)==dim(m2)){         #si tiene el mismo numero de columnas, entoces haceme la cuenta. SINO printiame u nmsj de error)
  for(i in 1:nrow(m1)){    #Recorro filas de m1
    for(j in 1:ncol(m2)){  #Recorro columnas de m2
      m1xm2[i,j]=m1[i,j]*m2[i,j]  #Realizo el producto componente a componente
    }
  }
}else{print("Las dimensiones no son compatibles")}

print(m1xm2)
print(m1*m2)





#---------------------------------------ej4-------------------------------------------------------------

#a) Desarrollar y programar un algoritmo que resuelva el siguiente sistema de
#ecuaciones lineales:A ??? X = B donde A es una matriz de 2x2 y B es un vector.
#Probar el algoritmo.



rm(list = ls())
a<-matrix(NA,2,2) #Matriz vac?a de 2x2
b<-matrix (NA,2,1) #matriz vac?a de 2x1 (vector)
a
b

#Como me piden que lo haga con 4 matrices, prefiero yo mismo ingresar los valroes. Con ciclo for pedimos el ingreso de datos

#Pedimos que ingresen 4 valores en la matriz a
for(i in 1:4){
  a[i] <- as.numeric(readline("Ingrese los valores de A, se completa por columna: "))
}
a
#Pedimos que ingresen valores al vector b
for(j in 1:2){
  b[j] <- as.numeric(readline("Ingrese los valores de B: "))
}
b

#...

#Para resolver esto podemso hacer un quilombo de determinantes y matrices y bla bla 
#Podemos calcular la inversa de A y multiplicarla por B
#Para eso necesitamos el det de A, su inversa y el producto entre ESO y B

#La inversa de A es 
# (a b) ->(d/det(a) -b/det(a)
# (c d) ->(-c/det(a) a/det(a))
# Podemos sacar factor  comun 1/det(a)
#
a
inversa <- (1/det(a))*matrix(c(a[4],-a[2],-a[3],a[1]),2,2) #Tomo los elementos que encesito para calcular la inversa


#Hago la multiplicacion de matrices

x <- inversa%*%b

#El vector final es (x1,x2) el resultado

print(x)




#b) Resolver el punto a) utilizando la funcion intrinseca "solve".

print(solve(a,b)) 


#NICEEEEE

#---------------------------------------ej5-------------------------------------------------------------

#a) Se tienen datos de temperatura tomados cada 3 horas en una estacion de 
#superficie comenzando a las 00 y terminando a las 21 
#(serie <-c( 25, 20, 18, 22, 27, 31, 32, 28)). 

#Armar un script de R que permita 
#ingresar la serie de datos por pantalla, la guarde en un vector y muestre por
#pantalla la hora en la que ocurrio el maximo valor medido y el valor de la 
#temperatura maxima medida


rm(list = ls())

t <- proc.time()

a<-matrix(NA,1,8) #Creamos la matriz 1x8 (ya que necesitamos 8 valores!), los completamos como NA

for(i in 1:8){
  a[i] <- as.numeric(readline("Ingresar valroes de temperatura : "))
  if(i==1){                     #Me lo robe de youtube/internet
    max=a[i]
  }else if (a[i]>max){ 
    max=a[i]
  }
}


hora<-which(a==max)     #Veo en que posicion se cumpli? el maximo
hora
#printeamos el horario. 
#Ya que el vector temepratura es 1,2,3,4,5,6,7,8... voy a definir a la hora como
#(hora*3)-3. si hora = 1 ... 00. Y si hora = 8... 21 LISTO!!
print(paste("El valor maximo de temperatura fue de:",max,"?C y ocurrio a las",(hora*3)-3,"hs."))

proc.time()-t 

#b) Repetir el inciso anterior utilizando la funcion intrinseca "max". 
#Comparar los tiempos involucrados con los del inciso anterior.



rm(list = ls())

t <- proc.time()

a<-matrix(NA,1,8) #Creamos la matriz 1x8 (ya que necesitamos 8 valores!), los completamos como NA

for(i in 1:8){
  a[i] <- as.numeric(readline("Ingresar valroes de temperatura : "))
}

max<-max(a)

hora<-which(a==max)     #Veo en que posicion se cumpli? el maximo
hora
#printeamos el horario. 
#Ya que el vector temepratura es 1,2,3,4,5,6,7,8... voy a definir a la hora como
#(hora*3)-3. si hora = 1 ... 00. Y si hora = 8... 21 LISTO!!
print(paste("El valor maximo de temperatura fue de:",max,"?C y ocurrio a las",(hora*3)-3,"hs."))

proc.time()-t 


#c) Calcular la suma de todos los elementos de la serie de temperaturas y 
#comparar los resultados utilizando la funcion intrinseca "sum".
#Idem con el promedio de las temperaturas (verificar utilizando la funcion
#intrinseca "mean").


#Genial, ahora hay que sumar y sacar promedios con ciclo for y despues uso el comando lindo

rm(list = ls())


a<-matrix(NA,1,8) #Creamos la matriz 1x8 (ya que necesitamos 8 valores!), los completamos como NA
sumatoria<-0


for(i in 1:8){
  a[i] <- as.numeric(readline("Ingresar valroes de temperatura : "))
  sumatoria<-sumatoria+a[i]
}
print(sumatoria)
promedio<-sumatoria/8  #El promedio es la suma de todos los datos dividido la cantidad de datos
print(promedio)

# Usando los comnados como una persona sana y normal

suma<-sum(a)
print(suma)

prom<-mean(a)
print(prom)



#d) Extender el programa anterior, para que permita mostrar la suma pero 
#solamente de las temperaturas que estan por encima de 20???C. (Resolver este 
#inciso probando dos maneras, una utilizando arrays logicos y otra utilizando
#la funcion intrinseca "which").

rm(list = ls())


a<-matrix(NA,1,8) #Creamos la matriz 1x8 (ya que necesitamos 8 valores!), los completamos como NA
suma20<-0

for(i in 1:8){
  a[i] <- as.numeric(readline("Ingresar valroes de temperatura : "))
  if (a[i]>20){
    suma20<-suma20 + a[i]
  } 
} 

print(suma20)

mayores<-a[which(a>20)]      #Los which son las posiciones, entre parentesis lo que queremos que busque, a[] los valores
print(sum(mayores))          #Sumo todos los valores del vector a, que son mayores a 20


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
setwd("D:/Users/Windows 10/Desktop/LABO/Labo-de-datos-R-main/Practicas/Practica 3")

#Cargamos el data frame que nos pedian

datos<-load("temp_bsas.Rdata")

#a) Obtener el promedio mensual de temperatura en el periodo analizado para cada
#nivel y cada punto de reticula. Hagalo por un lado utilizando ciclos y por
#otro reacomodando el arreglo utilizando la funcion "apply()".


#Viendo los datos con

datos_dimensiones
datos_dimensiones[["time"]]

#Son 6 a?os x 12 meses x 30 dias 

#Nos piden el promedio MENSUAL en esos 6 a?os.
#Usando apply()

#Nos quedamos con longitud, latitud, presion, y transformo el tiempo:
#12 meses en 6 a?os

temp_mensual<-array(variable,c(8,14,4,12,6))       #Armo el array para agarrar los datos que necesito
temp_mensual
media_mensual<-apply(temp_mensual,c(1,2,3,4),mean) #Dejo fijo todo menos los a?os
media_mensual 

#Con ciclos, es masomenos lo que ya hicimos con los ciclos for de recorrer el script

temp_mensual<-array(variable,c(8,14,4,12,6))    
prom_mensual<-array(NA,c(8,14,4,12))

for (i in 1:8) {
  for (j in 1:14) {
    for (k in 1:4) {
      for (t in 1:12) {  #Uso 12 y no 72 (ya que sino da error). Uso 12 porque son 12 meses
        prom_mensual[i,j,k,t]<-mean(temp_mensual[i,j,k,t,])
      }
      
    }
  }
  
}


prom_mensual==media_mensual #Nos dio todo TRUE asique si, son iguales jaja.

#b) Obtener la temperatura media anual en el periodo analizado para cada nivel
#y cada punto de reticula.

#Es lo mismo que arriba pero ahora nos piden media anual y no mensual(osea no 12 meses sino 6 a?os )


#Nos quedamos con longitud, latitud, presion, y transformo el tiempo:
#En 6 a?os

temp_anual<-array(variable,c(8,14,4,12,6))       #Armo el array para agarrar los datos que necesito
temp_anual
media_anual<-apply(temp_anual,c(1,2,3,4),mean) 
media_anual 

#Con ciclos, es masomenos lo que ya hicimos con los ciclos for de recorrer el script

temp_anual<-array(variable,c(8,14,4,12,6))    
prom_anual<-array(NA,c(8,14,4,6))

for (i in 1:8) {
  for (j in 1:14) {
    for (k in 1:4) {
      for (t in 1:6) {  #Uso 6 porque el tiempo son 6 a?os
        prom_anual[i,j,k,t]<-mean(temp_anual[i,j,k,t])
      }
      
    }
  }
  
}


prom_anual==media_anual #... :C


#c)Utilizando la indexaci?on l?ogica seleccione el nivel de 850hPa e imprima por pantalla el promedio
#de temperatura sobre el dominio para cada a~no


prom_anual[,,2,] #Creo que aca estoy seleccionando 850hpa de la variable promedio_anual... osea...esta bien?
prom_mensual[,,2,]


#d) Utilizando la indexacion logica seleccione el punto de reticula mas 
#cercano a la localidad de Olavarria y obtenga la temperatura promedio para 
#cada anio en el nivel de 1000hPa.

#Coordenadas de Olavarria(internet):
#Longitud: Oeste 60°19'
#Latitud: Sur 36°53'

datos_dimensiones$longitude
datos_dimensiones$latitude



#---------------------------------------ej7-------------------------------------------------------------

#EJERCICIO 7##########################################################

#El archivo "datos tmedia SABE 2010.txt" contiene la serie de temperaturas 
#medias diarias de la estacion Aeroparque correspondiente al 2010.
#Utilizando el comando "scan" cargar los datos en una variable de R.
#Por ejemplo: TEMP <??? scan( ' d a t o s tmedia SABE 2 0 1 0. t x t ' , sep=" " )

rm(list=ls())

setwd("D:/Users/Windows 10/Desktop/LABO/Labo-de-datos-R-main/Practicas/Practica 3")
load("D:/Users/Windows 10/Desktop/LABO/Labo-de-datos-R-main/Practicas/Practica 3")

Temp<-scan ("datos_tmedia_SABE_2010.txt")
Temp

#Me devuelve 365 dias 


#a) Dado que se trata de temperaturas medias diarias para la Ciudad de Buenos
#Aires, valores superiores a 40C son, muy probablemente, erroneos de acuerdo 
#con el comportamiento climatogico de esta variable.

#Diseniar y programar un algoritmo que identifique la posicion dentro 
#de la serie de los dias donde el valor de la temperatura media supera
#los 40C, pero que ademas muestreel valor del dia anterior y del dia siguiente.

#Obtener la cantidad total de elementos erroneos.


#Vamos a encesitar un programa que recorra las variables (ciclo for)y que agarre la variable(which) > 40?C
#Necesitamos que designe la poscicion...
#Nos piden la cantidad de datos erroneos tambien...

#La idea va ser hacer un ciclo for que recorra los 365 datos y que si (if) temp[i]>40 me printee lo que piden
#Piden que diga el dia y la temperatura
#Piden que diga el dia anterior y la temperatura
#Piden que diga el dia siguiente y la tempertatura


for (i in 1:365) {
  if(Temp[i]>40) {
    print(paste("El dia",i,"presenta una T media de",Temp[i],"?C"))
    print(paste("El dia anterior a",i,"presenta una T media de",(Temp[i-1]),"?C"))
    print(paste("El dia siguiente a",i,"presenta una T media de",(Temp[i+1]),"?C"))
  }
}
    
#Este queda medio feo jajaj
for (i in 1:365) {
  if(Temp[i]>40) {
    print(paste("El dia",i,"presenta una T media de",Temp[i],"?C"))
    print(paste("El dia anterior","," ,"es decir",",","el",i-1,"presenta una T media de",(Temp[i-1]),"?C"))
    print(paste("El dia siguiente",",","es decir",",","el",i+1,"presenta una T media de",(Temp[i+1]),"?C"))
  }
}



#Finalmente piden la cantidad de datos erroneos
#Con un lenght para que nos de la caantidad de datos y un which para que agarre y tome los que cumplan esa condicion

print(paste("La cantidad de datos erroreos es : ", length(which(Temp>40))))

#b) Calcular el valor maximo y el minimo de la serie teniendo en cuenta los
#puntos erroneos y sin tenerlos en cuenta. 


#Si tengo en cuenta los datos erroneos

Temp_Max<-max(Temp)
Temp_Min<-min(Temp)

Temp_Max
Temp_Min

#Si no tenog en cuenta los datos erroneos tengo que colocar un NA donde haya valores >40C?

Temp2<-replace(Temp,Temp>40, NA)
Temp2

#Medio una NA -.-

maximo2<-max(Temp2)
maximo2

#Ahora si

maximo3<-max(Temp2, na.rm = TRUE)
maximo3

Temp2<-replace(Temp,Temp==-999, NA) #Use -999 porque es el valor que me decia que era min de temperatura
Temp2

minimo3<-min(Temp2, na.rm = TRUE)
minimo3

Temp2
Temp2<-replace(Temp2,Temp>40, NA);replace(Temp2,Temp==-999, NA)


#c) Ordenar la serie de menor a mayor y calcular su mediana.

#Para ordenar una serie temporal se usa...
#sort
#Le voy a filtrar los datos erroneos, por eso uso Temp2

Temp3<-sort(Temp2)
Temp3

#Sacamos la mediana como ya sabemos

Mediana_Temp3<-mean(Temp3)

Mediana_Temp3


#d) Generar una serie de medias semanales a partir de los datos medios diarios.

#Osea que tenemos que agarrar los 365 datos y dividirlos por 7... da con decimal
# si hago 7*53 = 371 dias... me sobran 6 dias jeje
#Les podre poner NA a esos valores que sobran?... diria que si

#Primero armo la matriz

Temp4<-matrix(Temp2,7,53)  #ok, nos da un warning
Temp4

#hagamos un ciclo for que vaya de 366 (o 367? ahora me fijo. ES 366) hasta el final de Temp4 y llene de NA a medida que avanza

for (i in 366:length(Temp4)) {
  Temp4[i]<-NA
}
Temp4

#Ahora calculamos la media como ya sabemos

Media_Semanal<-mean(Temp4, na.rm = TRUE)
Media_Semanal

#UPS lo de arriba no funciona porque estoy tomando todo el promedio de todos los datos jajaj
#Voy a usar apply

#apply(array, margin,function (x), no se como se llama)
#siendo nuestro array TEMP4, margin = 2 , function (x) = mean , na.rm =true

Media_Semanal<-apply(Temp4, 2,mean,na.rm=TRUE)
Media_Semanal


#e) Dividir el rango de la variable en N intervalos de igual longitud y calcular
#el numero de elementos de la serie que cae dentro de cada intervalo. Repetir 
#el ejercicio utilizando la funcion intrinseca "hist".


#WOWOW ESTO TE HACE EL HISTOGRAMA DE UNA. USO TEMP3 QUE TIENE TODO ORDENADO
hist(Temp3,main="Temperatura media",xlab="Temperatura",plot=T)

#Bueno, ahora a hacerlo de una forma poco eficiente
#Necesito...

Temp3

#Necesito un rango, osea Rango<-Temp_Max-Temp_min
#Cantdad de intervalos q<-5*log(N) (N=cantidad total de datos. osea lenght(Temp3)
#Ancho de intervalo a = rango/q

N<-length(Temp3)
range(Temp3,na.rm = TRUE)
q<-5*log(length(Temp3)) #casi 30 intervalos
a<-(30.27-5.4)/q

#Me canse, creo que no era asi jajaja


for(i in 1:length(Temp3)){
  if (Temp3[i]>=5 & Temp3[i]<6){
    i1=i1+1
  }else if (Temp3[i]>=6 & Temp3[i]<7){
    i2=i2+1
  }else if (Temp3[i]>=7 & Temp3[i]<8){
    i3=i3+1
  }else if (Temp3[i]>=8 & Temp3[i]<9){
    i4=i4+1
  }else if (Temp3[i]>=9 & Temp3[i]<10){
    i5=i5+1
  }else if (Temp3[i]>=10 & Temp3[i]<11){
    i6=i6+1
  }else if (Temp3[i]>=11 & Temp3[i]<12){
    i7=i7+1
  }else if (Temp3[i]>=12 & Temp3[i]<13){
    i8=i8+1
  }else if (Temp3[i]>=13 & Temp3[i]<14){
    i9=i9+1
  }else if (Temp3[i]>=13 & Temp3[i]<14){
    i10=i10+1
  }else if (Temp3[i]>=13 & Temp3[i]<14){
    i9=i9+1
  }else if (Temp3[i]>=13 & Temp3[i]<14){
    i9=i9+1
  }else if (Temp3[i]>=13 & Temp3[i]<14){
    i9=i9+1
  }else if (Temp3[i]>=13 & Temp3[i]<14){
    i9=i9+1
  }else if (Temp3[i]>=13 & Temp3[i]<14){
    i9=i9+1
  }else if (Temp3[i]>=13 & Temp3[i]<14){
    i9=i9+1
  }else if (Temp3[i]>=13 & Temp3[i]<14){
    i9=i9+1
  }else if (Temp3[i]>=13 & Temp3[i]<14){
    i9=i9+1
  }else if (Temp3[i]>=13 & Temp3[i]<14){
    i9=i9+1
  }else if (Temp3[i]>=13 & Temp3[i]<14){
    i9=i9+1
  }else if (Temp3[i]>=13 & Temp3[i]<14){
    i9=i9+1
  }else if (Temp3[i]>=13 & Temp3[i]<14){
    i9=i9+1
  }
}
{print(paste0("Cantidad de valores entre 5°C y 6°C: ",i1))
  print(paste0("Cantidad de valores entre 6°C y 7°C: ",i2))
  print(paste0("Cantidad de valores entre 7°C y 8°C: ",i3))
  print(paste0("Cantidad de valores entre 8°C y 9°C: ",i4))
  print(paste0("Cantidad de valores entre 9°C y 10°C: ",i5))
  print(paste0("Cantidad de valores entre 10°C y 11°C: ",i6))
  print(paste0("Valores totales: ",i1+i2+i3+i4+i5+i6))
}


#---------------------------------------ej8-------------------------------------------------------------

#EJERCICIO 8

#a) En base al programa anterior, desarrollar una funcion que reciba una serie
#de longitud N y entregue como resultado su media, valor maximo, valor minimo 
#y desviacion estandar. Evaluar el desempeno de esta funcion con la serie 
#utilizada en el ejercicio anterior.

rm(list=ls())

#Nos piden desarrollar UNA FUNCION!! que mida muchas cosas jaja

Estadistica<-function(serie){
  media<-mean(serie)
  maximo<-max(serie)
  minimo<-min(serie)
  desvio<-sd(serie)
  return(list(media,maximo,minimo,desvio))
}

#Creamosuna serie cualqueira de N cantidad de elementos
  
serie<-scan()      #Nos permite ingresar valores, la cantidad que querramos y cortamos con doble enter
Estadistica(serie)  
  

Estadistica(Temp)  
  
#b) Armar una funcion a la que se le ingrese una serie de longitud N y una 
#cantidad de intervalos I,y que calcule un histograma usando I intervalos
#iguales que abarquen la totalidad del rango de la serie.

#Para un histograma necesitamos maximo, min, ancho de los intervalos y que se calcule el grafico
#El ancho es maximo-min/intervalos

Histograma<-function(serieN,intervalos){
  maximo<-max(serieN,na.rm=T)
  minimo<-min(serieN,na.rm=T)
  ancho<-(maximo-minimo)/intervalos
  grafico<-hist(serieN,intervalos,plot = T)
  return(grafico)
  
}

Histograma(serie,4)
Histograma(Temp3,11)


#---------------------------------------ej9-------------------------------------------------------------

#El archivo t media EF.RData contiene un array de tipo lista con la
#temperatura media del mes de Enero y Febrero desde 1982 a 2012 para 5 
#estaciones argentinas (usar la sentencia load("t media EF.RData") para abrirlo). 

#La primera columna del array contiene el nombre de cada estacion, la segunda 
#contiene la serie para el mes de enero y la tercera para el mes de febrero. 
#Cada fila del array esta asociada a una estacion:


rm(list=ls())
setwd("D:/Users/Windows 10/Desktop/LABO/Labo-de-datos-R-main/Practicas/Practica 3")
load("t_media_EF.RData")

is.data.frame("t_media_EF.RData")
is.list("t_media_EF.RData")
class("t_media_EF.RData")



#a) Para cada estacion: Obtener la anomalia mensual maxima de enero y el anio
#en que se alcanzo. Almacenarlo en un data frame donde la primer variable 
#sea el nombre de cada estacion, la segunda el anio de la anomalia y la tercera
#dicho valor.

#Tenemos los datos de 5 estaciones


#Osea necesitamos sacar las columnas 2:3 (osea enero)
#La primera columna del array contiene el nombre de cada estacion, la segunda 
#contiene la serie para el mes de enero y la tercera para el mes de febrero. 
#Cada fila del array esta asociada a una estacion:

#Hay 31 a?os de datos

colnames(estaciones)<-c("Estaciones", "Enero", "Febrero")
rownames(estaciones)<-c("1", "2", "3", "4", "5" )

#Con un cilo for, voy recorriendo esas 5 estaciones y pidiendole todo lo que me pide el enunciado
#sapply(list, function)


#Algunas pruebas previas al ciclo for


estaciones[[1,2]] #Nos da los datos de buenos aires en ENERO
estaciones[[2,2]] #idem pero de Viedma

estaciones[1,2:3] # Nos da los datos de buenos aires en ENERO Y FEBRERO

estacion_prom<-sapply(estaciones[1,2:3], mean) #Saca el promedio de lo de arriba
estacion_prom

#La anomalia es promedio - datos

anomalia_ENE<-(estaciones[[1,2]]-estacion_prom[1])
anomalia_ENE                                      #Ahi esta, la anomalia


#Nos piden la "Obtener la anomalia mensual maxima de enero"

#Entonces necesitamos la maxima anomalia en MODULO porque veo que hay valroes negativos y positivos
#Mientras estaba haciendo pruebas me sugirio una "which.max", que piola, justo lo que necesitaba

anomaliaMax_ENE<-which.max(abs(anomalia_ENE))
anomaliaMax_ENE #Okey, esta en la posicion 7

#nos piden "el anio en que se alcanzo"
#Bueno...algo mas?
#Facil, inicialmente estamos en 1981 (posicion 0) + anomaliaMax_ENE (en este caso 7) 
#osea 1981+7 = 1988 listo!!

anomaliaMax_ENE_anio<-1981 + anomaliaMax_ENE
anomaliaMax_ENE_anio


#Nos piden el valor de es anomalia... bueno dale
#Me falto inicializar la variable

anomalias.max.valor<-c()

anomalias.max.valor[1]<-(anomalia_ENE[anomaliaMax_ENE])

anomalias.max.valor[1] #Perfecto, este es el valor de la anomalia


#Listo, ahora todo en un data frame

Datos_Estaciones<-data.frame("Nombre Estacion" , "Anio de anomalia" , "Valor de anomalia")
Datos_Estaciones

nombre[1]

anomalias.max.valor<-c()
nombre<-estaciones[[1,1]] 
nombre

nombre<-estaciones[[2,1]]
nombre

mi_df <- data.frame("Nombre Estacion" = nombre_estacion, "Anio de anomalia" = anomaliaMax_ENE_anio, "Valor de anomalia" = anomalias_max_valor)
#############################################################################################################################################
#############################################################################################################################################
#############################################################################################################################################
#############################################################################################################################################
#Ahora si, todo en un for

rm(list=ls())
setwd("D:/Users/Windows 10/Desktop/LABO/Labo-de-datos-R-main/Practicas/Practica 3")
load("t_media_EF.RData")

anomalias.max.valor<-c()
nombre_estacion<- 0
anomalias_max_valor<-0
anomaliaMax_ENE_anio<-0


for (i in 1:5) {
  estacion_prom<-sapply(estaciones[i,2:3], mean) #Recorre las estaciones 1,2,3,4,5 y que agarra ENE:FEB y me saca el promedio
  anomalia_ENE<-(estaciones[[i,2]]-estacion_prom[1]) #Agaramos los datos de las estaciones 1 hasta la 5, fijamos la columna 2 y le restamos su media
  anomaliaMax_ENE<-which.max(abs(anomalia_ENE)) #Nos va a decir la posicion de la anomalia
  anomaliaMax_ENE_anio[i]<-1981 + anomaliaMax_ENE  #Nos da el año
  anomalias_max_valor[i]<-(anomalia_ENE[anomaliaMax_ENE]) #Recorre las estaciones 1 a 5 y nos da el valor que estaba en la posicion de la anomalia
  nombre_estacion[i]<-estaciones[[i,1]]
}
  
Datos_Estaciones<-data.frame("Nombre Estacion" = nombre_estacion, "Anio de anomalia" = anomaliaMax_ENE_anio, "Valor de anomalia" = anomalias_max_valor )


Datos_Estaciones




#b) Para cada estacion: Calcular la media y el desvio estandard para el mes de
#febrero. Imprimir luego un cartel que seale para cada estacion en que los anios la
#temperatura estuvo por encima de la media mas un desvio standar.


media<-sapply(estaciones[,3], mean) # columna 3 osea feb
desvio<-sapply(estaciones[,3], sd)


#Con un ciclo for hago que imprima los resultados a medida que va recorriendo las 5 estaciones. 
#Tenemos 31 datos en Febrero (31 a?os de datos)

#Inicializamos la variable

anio <- 0

for (i in 1:5){ #las 5 estaciones
  for (j in 1:31) { #los datos de febrero
    if (estaciones[[i,3]][j]>(media[i]+desvio[i])) {
      anio <- 1981+j #desde 1981 en adelante (1982,1983,etc)
      print(paste("Para la estacion",estaciones[i,1],"la temperatura por encima de la media mas un desvio estandar se alcanzo en el anio",anio))
    }
  }
}

#c) Escribir una funcion que, dado un vector de longitud N con los datos de 
#temperatura calcule el rango de la serie y la mediana. Utilizar dicha funcion
#en los datos de enero y guardar los resultados en una nueva matriz que lleve
#como nombre en cada columna el de cada una de las estaciones.

vector<-c(1,2)

Estadistica<-function(vector){
  rango<-apply(estaciones, range(vector()))
  mediana<- apply(list, margin, ...)
}

vector<- c(1,2)

Estadistica<-function(vector){
  Data_Frame<-data.frame("No se" = c(vector))
  Mediana<-median(c(vector))
  Rango<-range(c(vector))
  Data_Frame$Mediana<- Mediana
  Data_Frame$Rango<-Rango
}

Estadistica(vector)
Data_Frame


funcion_2<-function (vector1,vector2,Character=c("Fila 1","Fila 2","Fila 3","Fila 4")){
  Data_Frame<-data.frame("Base" = c(vector1),"Altura"= c(vector2))
  rownames(Data_Frame)<-c(Character)
  sup <- Data_Frame$Base * Data_Frame$Altura
  Data_Frame$Superficie <- sup
  return(Data_Frame)
  
}

funcion_2(c(1,2,3,4),c(1,2,3,4),c("hola","hola2","hola3","hola4"))


#---------------------------------------ej10-------------------------------------------------------------

#EJERCICIO 10##########################################################

#Generar una celda con 10 elementos, donde cada elemento sea un nombre propio.
#Armar una funcion que permita ingresar una lista con nombres (de cualquier 
#dimension) y una letra, y que devuelva una lista que contenga todos los
#nombres contenidos en la celda original que comiencen con dicha letra.


#Creo un vector con 10 elementos

nombres<-c("Estaciones", "Enero", "Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre")


#Nos piden que hagamos uan funcion en donde
#Generemos una lista con 10 elementos (nombres, de cualquier dimension)
#Debe devolver una lista con todos los nombres en la celda original que comiencen co ndicha letra
#Osea que si en mi lista meti un April e inregse la letra A, me tiene que devovler esa palabra y cualquiero otra que emepiece con A (agosto tambien)



#Aramar la funcion es facil

funcion<-function(nombres,letra){
}
#Pido que se almacene en una lista la variable que vamos a crear
  
funcion<-function(nombres,letra){
nombres_letra<-list() #(1)
}

#Voy a necesitar un ciclo for que me recorrar toda la lista

for (i in 1:length(nombres))

funcion<-function(nombres,letra){
    nombres_letra<-list()
    for (i in 1:length(nombres)){}
  }

#Quiero que me extraiga de cada iteracion la primera letra, SI coincide con la segunda variable ingresada en la funcion
#SINO quiere decir que no hay nombres en la lista que empeicen con la letra indicada
#osea

#Me costo una banda la sintaxis pero ahi esta, esto me saca la primera letra de ESTACION y la otr DE Febrero
#Substr(Variable_a_extraer [Item de la lista,primera letra, hasta primera letra])

substr(nombres [1],1,1)
substr(nombres [3],1,1)


#Bueno, le pido que si es igual a la eltra ingresada entonces me lo guarde 
if(substr(nombres[1],1,1)== (letra)){
}


#Ahora si hago la funcion. Capaz tengo que agregarle cosas

#(1) Ingresamos la lista que me pide el enunciado
#(2) Se inicia el contador en el primer elemento de la lista
#(3) Me muevo desde 1 hasta el numero que represente la longitud del vector
#(4) #Si la primer letra de cada nombre substr(nombres[i],1,1)) es igual al
#igual a la letra que el usuario ingreso, entonces empieza a alamcenar en un vector
#(5) Almaceno el resultado

funcion<-function(nombres,letra){
  nombres_letra<-list() #(1)
  j<-1 #(2)
  for (i in 1:length(nombres)){ #(3)
    if ((substr(nombres[i],1,1)) == (letra)){ #(4)
      nombres_letra[[j]]<-nombres[i]
      j=j+1                          #Para que recorra todo
    }
  }
  return(nombres_letra) #(5)
}

#Pruebo el resultado 

funcion(nombres,"Y") #Bien, me da la lista vacia
funcion(nombres,"E") #BIEN

#---------------------------------------ej11-------------------------------------------------------------



#Se cuenta con seis archivos de datos correspondientes a valores medios diarios
#de temperatura, temperatura de rocio y presion reducida a nivel del mar para 
#las estaciones Azul, Catamarca, Aeroparque, Chilecito, Iguazu y Mendoza.
#Los datos faltantes de temperatura estan codificados con el valor 999.9.
#Los valores de temperatura estan en grados Farenheit.

setwd("D:/Users/Windows 10/Desktop/LABO/Labo-de-datos-R-main/Practicas/Practica 3")
rm(list=ls())

#Cargamos los datos

{
  Azul<-read.table("AZUL.txt")
  Catamarca<-read.table("CATAMARCA.txt")
  Aeroparque<-read.table("AEROPARQUE.txt")
  Chilecito<-read.table("CHILECITO.txt")
  Mendoza<-read.table("MENDOZA.txt")
  Iguazu<-read.table("IGUAZU.txt")
  informacion<-read.table("estaciones.txt")
}

#a) Armar un array de listas que contenga los datos correspondientes a cada 
#estacion como asi tambien informacion asociada a cada estacion en particular:
#nombre, latitud, longitud, altura y codigo de identificacion. Convertir los 
#valores de temperatura y temperatura de rocio a grados centigrados.
#La informacion sobre la ubicacion de cada estacion esta disponible en el archivo
#estaciones.txt.













#---------------------------------------ej12-------------------------------------------------------------


setwd("D:/Users/Windows 10/Desktop/LABO/Labo-de-datos-R-main/Practicas/Practica 3")
rm(list=ls())

#Cargo los datos

#El archivo presiondesaturacion.txt contiene dos columnas, una con datos de 
#temperatura (???C) y la segunda con valores de presion de saturacion para el
#vapor de agua (hPa) correspondientes a dichas temperaturas. 


PresionDeSaturacion<-read.table("presiondesaturacion.txt")


#Armar una funcion
#de R que dada una temperatura obtenga el valor de presion de saturacion
#interpolado linealmente al valor de temperatura deseado a partir de los datos
#presentes en el archivo. Hacer que la funcion muestre un mensaje 
#advertencia y termine correctamente en el caso de que el valor de temperatura 
#indicado este fuera del rango abarcado por la tabla. Comparar los resultados
#utilizando la funcion intrinseca interp1 de R


#Hacer que la funcion muestre un mensaje 
#advertencia y termine correctamente en el caso de que el valor de temperatura 
#indicado este fuera del rango abarcado por la tabla.

#Facil, literal es hacer lo que me piden

if(t<min(serie)|t>max(serie)){
  warning("El valor ingresado de temperatura esta fuera del rango de datos")
}

#necesitamos ingresar 2 parametros, los datos y una temperaturas


Presion_Saturacion<-function(serie,t)






