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







