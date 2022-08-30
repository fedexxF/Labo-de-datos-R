#################################################################
# # Laboratorio de Procesamiento de Informaci�n Meteorol�gica/Oceanogr�fica
# 2� cuatrimestre 2022
##################################################################

# Clase_ciclos   ALUMNOS

######################################################################

#\n pone una cosa abajo de otro. Es como un punto y aparte

if (10>3) cat("SI es mayor \n") else cat("NO es mayor \n") #Si 10>3 escribe "SI es mayor" SINO aparece "No es mayor"

#Si x es numerico y que sea mayor a 0, calculale la raiz SINO pará(Stop) y decime "x Debe ser numerico y positivo"
x<- 4 #Definimos el valor de x (y si es una letra?)
if (is.numeric(x)&min(x)>0) rax<-sqrt(x) else stop("x debe ser num�rico y positivo \n") 

############################################
aa<-23 #Definimos la variable

#Observar que se usan llaves en el cilo IF
if (10 > aa) {print("RANGO MENOR")                #Si 10>aa imprimie ese texto y sino... 
} else if ( 10 <= aa && aa <= 20) {print("primer renglon"); print("RANGO MEDIO") #ELSE IF = hace dos preguntas a cumplir  && = y
} else { print("RANGO MAYOR") #Sino se cumple la condicion de IF, ni la de ELSE IF, imprimime "Rango mayor"
}


############################################
rm(list=ls()) #Borra todas las variables que almacenamos
a=pi                 	
b=18
if a>b     #No tiene parentesis! No funciona

if (a<b) #Le agregamos los parentesis
  + c=a+b #No asiganmso valor a C
c

if (a<b) #Le agregamos los parentesis
  c=a+b #Ahora si, reconoce a C como suma de a+b y la agrega a la lista de variables definidas
c       #Nos muestra el valor de C en la terminal


############################################
y<- -5:5		#Sucesion de 5  a -5

y.logy<-ifelse(y>0,y*log(y),0)		#y.logy es el nombre de la variable. Si Y>0 haceme y*log(y)SINO dame 0.(mirar las variables generadas)			
                                  #El Nans lo tira porque tenemos valores fuera del dominio del log... aunque tiene una condicion de Y>0...raro
round(y.logy,3)	#Redondea y.logy a 3 decimales

############################################

a<-c(2,5,10,8) #Generamos dos vectores
b<-c(1,15,0,3)
if(a<5 & b>0) rta="cumple la condici�n" # el 2 es menor a 5 y el 1 es menor a 5, cumple. 
#ESTA MIRANDO SOLO EL PRIMER ELEMNTO DE LOS VECTORES PORQUE USAMOS SOLO UN &

#------------

(a<5 & b>0) 	#Me avisa que lo primero se cumple pero despues ya no porque "a" ya no cumple despues del primer termino
(a<5 && b>0) 	#Compara solo el primer elemnto del vector
if(a<5 && b>0) rta="cumple la condici�n" 


############################################


for (i in 1:5) cat("caso ",i,"\n") #Con la i moviendose de 1 a 5 me escribio "caso" 5 veces.

letras <- c("c", "L", "i", "M", "a")


#Tres formas de hacer lo mismo
for (i in 1:5) {         # Va de 1 hasta 5
  print(letras[i])       #Recorre la variable "letra" de 1 a 5 (c,l,i,m,a). Imprime sus elementos 1=c,2=L,..5=a. LISTO }  
}

for (J in letras) {     #Movete a lo largo del vecotr J
  print(J)
}

for (i in seq_along(letras)) {  #Se 
  print(letras[i])              #Imprimime la posicion de la letra
}

############################################

i<-5
while (i >0) {cat("caso ",i,"\n"); i<-i-1} #Mientras i>0 y dame "caso",i (5). #Hacemos que i vaya bajando su valor con i-1, asi va probando con i=4,3,2,1,0,-1...

 ###########################################

i <- 1
while (i <= 5) { #Mientras 5 sea menor o igual a 5
  print(letras[i]) #Imprimime las letras de i. i=C (Primer elemento del vector letras)
  i <- i + 1      #Recorre los elementos de letras. i+1 = L (Da el segundo elemento del vector letras)
}

###################################

x <- 1
repeat {  #Repeti
  print(x) #EL valor de X
  x = x+1 #Despues le sumas 1 a ese valor de x
  if (x == 6){break} # Si x igual a 6, corta el ciclo repeat. Sino pongo esto, el ciclo continua infinitamente
}

##################################

a<-4	 
for (i in 1:10) #Recorreme i 1 a 10
{suma<-a+i	#Sumale "a" + ese recorrido de 1 a 10
print(suma) #Dame la suma 
if (suma >= 9) 	#Si la suma es mayor o igual a 9 cortame el ciclo
  break        #Corta el ciclo
}

##################################

for (i in 1:7) {    # recorreme i de 1 a 7
  if (3 <= i && i <= 5)  #si i es mayor o igual a 3 y menor o igual a 5
    next                #no ejecutes las sentencias, osea que cuando se cumple NO  imprimas esos valores. Si no se cumple, dame los valores
  print(i)              #Imprimime i
}

##################################

inverso <- function(x) { #Definimos una variable "inverso" como funcion
  x <- 1 / x             #x la definimos como la inversa de x
  return(x)              #DAME LA INVERSAAAAAA (se genera la variable funcion) #DEFINIMOS UNA FUNCION
}                        #Si vemos en donde se genera la variable, a la derecha de "function (x)" y hacemos click, podemos ver como esta definida la misma.

inverso(2)          #aca imprimimos el valor de la inversa de x
