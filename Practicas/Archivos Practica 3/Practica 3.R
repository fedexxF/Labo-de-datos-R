

#####################Practica 3##########################################
rm(list = ls())
setwd("D:/Users/Windows 10/Desktop/LABO/Labo-de-datos-R-main/Practicas")

#Ejercicio 1
#a) Generar un vector que contenga los n´umeros del 1 al 1000. Generarlo utilizando un ciclo "for"
#y utilizando la notaci´on abreviada de R.

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



#e) Generar un array de tres dimensiones. Si i, j y k son los sub´indices que identifican la posici´on
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
#resultados utilizando la funci´on "%*%" para el producto de arrays en R.

rm(list = ls())

#defino la matriz m1 y m2
m1<-matrix(1:6,3,2)#Creo una matriz 
m1
m2<-matrix(7:12,2,3)#Creo una matriz 
m2
m2<-


#b) Realizar un programa que calcule el producto componente a componente entre dos matrices A y
#B. Verificar los resultados utilizando la funci´on "*" para el producto componente a componente
#de arrays en R.
#c) Aplicar los programas anteriores al producto entre matrices de m´as de 100 filas/columnas y
#comparar los tiempos involucrados. Comparar la eficicienca de las funciones de R con la de los
#programas realizados.
#d) Agregar a los programas mencionados en los puntos a) y b) un chequeo que determine antes
#de realizar los c´alculos si las dimensiones de los arrays son compatibles para los c´alculos que
#se quieren llevar a cabo y que en caso de que las dimensiones no sean compatibles, muestre un
#mensaje por pantalla y que termine el programa.
#e) Al programa del ejercicio anterior agregar una secci´on que identifique las componentes negativas
#del producto de ambas matrices y las convierta en cero.
