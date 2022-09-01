#Depto. de Ciencias de la Atm ́osfera y los Oc ́eanos - FCEyN - UBA
#Laboratorio de procesamiento de informaci ́on meteorol ́ogica
#Primer cuatrimestre de 2022
#PR  ́ACTICA 2
#Temas: Operaciones l ́ogicas. Bifurcaciones y ciclos.
#---------------------------------------ej1-------------------------------------------------------------
#Ejercicio 1
#a) Asumir que a es una variable l ́ogica, b y c son variables reales. Determinar el resultado de las
#siguientes expresiones. 
#(b < − 5 y c < − 10)
#a < − (3 < 4)
#a < − (b <= c)
#a < − (b == c)
#a < − (b ! = c)
#b) Suponer que a y b son variables l ́ogicas: a = true , b = false. Determinar el resultado de las
#siguientes operaciones:
#  islogical(a)
#(a & b)
#(a | b)
#(! b)
#islogical(a | b)

#Definimos variables
b<- 5
c<- 2
b<- 2

a<- (3 < 4) #estamos viendo si 3 es menor a 4, nos da TRUE
a<- (b <= c) #Nos dice si B es menos o igual a c
a<-(b == c) #Nos dice si B Es igual a C
a<- (b != c) #Nos dice si b NO es igual a c

#Definimos a y b como operadores logicos
a<- TRUE
b<- FALSE

is.logical(a)
(a & b)       #Pregunta si a y b intersecan
(! b)         #Niega b
is.logical(a | b) #Union entre a y b es logical? (nop)

#---------------------------------------ej2-------------------------------------------------------------

a<- FALSE
b<- FALSE
x<- 1

a&b
a | b
a == b
a != b
x or(a, b)
a &(! b)

a<- FALSE
b<- TRUE

a&b
a | b
a == b
a != b
x or(a, b)
a &(! b)

a<- TRUE
b<- TRUE

a&b
a | b
a == b
a != b
x or(a, b)
a &(! b)

a<- TRUE
b<- FALSE

a&b
a | b
a == b
a != b
x or(a, b)
a &(! b)

#---------------------------------------ej3-------------------------------------------------------------
#Dise~nar el diagrama de flujo y programar el algoritmo necesario para leer un numero x e imprimir Y,
#tal que:
# UNA ECUACION
#Verificar el correcto funcionamiento del programa para x = 1, x = 0 y x = ???1

x<-as.numeric(readline("Ingresar un valor numerico :"))


if (x!=0) {
  if (x>0) {
    y<-5+(1+3*x^2)^(1/2) 
    print(y)
}else {
  y<-1-(1+5*x^2)^(1/2)
  print(y)
}} else {
  print(y<-0)
}
 
#Me ayude con esto jaja
if (x!=0) {
if (x>0) {
  print("holaaa")
} else {
    print("no se")
}} else {
    print(0)
  }
    


#Esta es la logica usada

#if (<condicion logica>){
#  if (<condicion logica>) {
#    
#    <Proceso logico del if2>
#      
#  }else
#  {
#    <proceso del if2 si no se cumple>
#  }
#}else {
#  <proceso del if1 si no se cumple>
#}

#---------------------------------------ej4-------------------------------------------------------------

#a) El siguiente fragmento de c�odigo busca alertar acerca de la presencia o no de fiebre a partir
#de la lectura de un term�ometro (la lectura est�a contenida en la variable temp). Verificar si el
#funcionamiento del c�odigo es correcto, y si no lo es corregirlo.
#i f ( temp < 35 ) {
#  pr int ( " Temperatura por deb a j o de l o normal " )
#} e l s e i f ( temp > 35 ) {
#  pr int ( " Temperatura normal " )
#} e l s e i f ( temp > 3 7 ) {
#  pr int ( " Fi e b r e b a j a " )
#} e l s e i f ( temp > 38 ) {
#  pr int ( " Fi e b r e a l t a " )
#}
#b) Dise~nar un algortimo que permita ingresar un d�ia de la semana y devuelva el n�umero (de 1 a 7)
#o viceversa. El algoritmo tiene que detectar por si mismo el sentido de la conversi�on. Si el valor
#almacenado en la variable es incorrecto debe se~nalarlo con un cartel.


temp<-as.numeric(readline("Ingresar un valor numerico :"))

if ( temp < 35 ) {
  print ( "" Temperatura por deb a j o de l o normal "" )
} else if ( temp > 35 ) {
  print ( "" Temperatura normal "" )
} else if ( temp > 37 ) {
  print ( "" Fi e b r e b a j a "" )
} else if ( temp > 38 ) {
  print( "Fiebre Alta" )
}

#Cumple para Temp<35
#Cumple para Temp > 35
#Tiene probelmas en Temp >37 debido a que el ciclo if, al tener previamente la condicion Temp>35,
#Corta el ciclo y no se pregunta que pasa con valores de 37 o mas grados porque ya detecto qeu se cumple >35y listo
#"Temepratura normal".


temp<-as.numeric(readline("Ingresar un valor numerico :"))

if ( temp < 35 ) {
  print ( "" Temperatura por deb a j o de l o normal "" )
} else if ( temp > 35 ) {
  print ( "" Temperatura normal "" )
} else if ( temp > 37 ) {
  print ( "" Fi e b r e b a j a "" )
} else if ( temp > 38 ) {
  print( "Fiebre Alta" )
}

