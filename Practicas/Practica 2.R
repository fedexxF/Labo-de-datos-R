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

#a) El siguiente fragmento de c?odigo busca alertar acerca de la presencia o no de fiebre a partir
#de la lectura de un term?ometro (la lectura est?a contenida en la variable temp). Verificar si el
#funcionamiento del c?odigo es correcto, y si no lo es corregirlo.
#i f ( temp < 35 ) {
#  pr int ( " Temperatura por deb a j o de l o normal " )
#} e l s e i f ( temp > 35 ) {
#  pr int ( " Temperatura normal " )
#} e l s e i f ( temp > 3 7 ) {
#  pr int ( " Fi e b r e b a j a " )
#} e l s e i f ( temp > 38 ) {
#  pr int ( " Fi e b r e a l t a " )
#}



temp<-as.numeric(readline("Ingresar un valor numerico :"))

if ( temp < 35 ) {
  print ("Temperatura debajo de lo normal" )
} else if ( temp > 35 ) {
  print (  "Temperatura normal" )
} else if ( temp > 37 ) {
  print ("Fiebre baja" )
} else if ( temp > 38 ) {
  print( "Fiebre Alta" )
}


#Cumple para Temp<35
#Cumple para Temp > 35
#Tiene probelmas en Temp >37 debido a que el ciclo if, al tener previamente la condicion Temp>35,
#Corta el ciclo y no se pregunta que pasa con valores de 37 o mas grados porque ya detecto qeu se cumple >35y listo
#"Temepratura normal".


temp<-as.numeric(readline("Ingresar un valor numerico :"))


if (temp > 38){
  print( "Fiebre Alta" )
} else if (temp >37) {
  print("Fiebre baja")
} else if (temp>35){
  print("Temperatura normal")
} else if (temp < 35) {
  print("Temperatura debajo de lo normal")
}

#b) Dise~nar un algortimo que permita ingresar un d?ia de la semana y devuelva el n?umero (de 1 a 7)
#o viceversa. El algoritmo tiene que detectar por si mismo el sentido de la conversi?on. Si el valor
#almacenado en la variable es incorrecto debe se~nalarlo con un cartel.

x<-(readline("Ingresar un valor numerico de 1 a 7 o un dia de la semana con su primer letra en mayuscula:"))

if (x==1 | x==2 | x==3| x==4 | x==5 | x==6 | x==7){
  if (x == 1) {
    print("Lunes")
  } else if (x == 2){
    print("Martes")
  } else if (x == 3 ) {
    print("Miercoles")
  } else if (x == 4){
    print("Jueves")
  } else if (x== 5){
    print("Viernes")
  } else if (x==6){
    print("Sabado")
  } else if (x==7){
    print("Domingo")
  } else {x<-as.numeric(readline("Porfavor revisar la variable ingresada e ingresar un valor numerico de 1 a 7 :"))
  }} else {
    if (x == "Lunes") {
      print("1")
    } else if (x == "Martes"){
      print("2")
    } else if (x == "Miercoles" ) {
      print("3")
    } else if (x ==  "Jueves"){
      print("4")
    } else if (x=="Viernes"){
      print("5")
    } else if (x=="Sabado"){
      print("6")
    } else if (x=="Domingo"){
      print("7")
    } else {print("El dia ingresado no es correcto")
      
    }
  }





#---------------------------------------ej5-------------------------------------------------------------

#Ejercicio 5
#a) Dise~nar el diagrama de flujo y programar un algoritmo que permita determinar si el n�umero
#entero A es m�ultiplo del n�umero entero B. El programa primero debera alertar al usuario en el
#caso de que los numeros A y B no sean enteros.
#b) Utilizar la funci�on intr�inseca % % para resolver este problema.


#Pensemos dos segundos que es un multiplo y como sacarlo. 
#Basicamente el resto de la division entre dos numero tiene que dar 0 para ser multiplos.
# y que es el resto? Bueno, esto
#
#cociente<-A/B
#cociente<-as.integer(cociente)
#resto<-A-(cociente*B)
# Es un quillimbo verlo asi jajaja. Mejor lo hago facil, si la division entre los dos numeros me da un entero, listo
#Son mutltiplos

A<-as.numeric(readline("Ingresar un valor numerico ENTERO :"))
B<-as.numeric(readline("Ingresar un valor numerico ENTERO :"))

#Verifico que los numeros sean ENTEROS
if(A!=as.integer(A)|B!=as.integer(A)){
  print(A<-as.numeric(readline("Ingresar un valor numerico ENTERO :")), 
        B<-as.numeric(readline("Ingresar un valor numerico ENTERO :")))
} 
#Pido ver que pasa con la division entre A/B y pregunto si me da un entero. Si es asi, son multiplos,sino,no lo son.
if((A/B) == as.integer(A/B)){
  print("A es multiplo de B")
}else {
  print("A NO es es multiplo de B")
}

#B es usando la funcion %% que justamente es el resto de la div.
#Si A%%B == 0, entonces son multiplos, sino,no lo son

A<-as.numeric(readline("Ingresar un valor numerico ENTERO :"))
B<-as.numeric(readline("Ingresar un valor numerico ENTERO :"))

#Verifico que los numeros sean ENTEROS
if(A!=as.integer(A)|B!=as.integer(A)){
  print(A<-as.numeric(readline("Ingresar un valor numerico ENTERO :")), 
        B<-as.numeric(readline("Ingresar un valor numerico ENTERO :")))
} 
#Pido ver que pasa con la division entre A/B y pregunto si me da un entero. Si es asi, son multiplos,sino,no lo son.

if (A>B){
  if((A%%B) == 0){
    print("A es multiplo de B")
  }else {
    print("A NO es es multiplo de B")
  }} else if((B%%A) == 0){
    print("A es multiplo de B")
  }else {
    print("A NO es es multiplo de B")
  }



#---------------------------------------ej6-------------------------------------------------------------

#La siguiente tabla muestra el impuesto a las ganancias que debe pagar un trabajador en funci�on del
#salario percibido. Dise~nar el diagrama de flujo y programar un algoritmo que dado el sueldo anual
#calcule el impuesto que debe ser abonado.
#Sueldo anual (u$s) Impuesto (u$s)
#0 a 6000 No paga impuestos
#6000 a 20000 17 cent. por cada u$s por encima de los 6000
#20000 a 50000 2380 u$s + 30 cent. por cada u$s por encima de los 20000
#50000 a 60000 11380 u$s + 42 cent. por cada u$s por encima de los 50000
#M�as de 60000 15580 u$s + 47 cent. por cada u$s por encima de los 60000

x<-as.numeric((readline("Ingresar el valor numerico de su sueldo :")))
if ( x>60000) {
  impuesto<-0.47*(x-60000)+15580
  print(paste("Usted debe pagar",impuesto,"usd de impuesto"))
} else if (x>50000 & x<=60000 ){
  impuesto<-0.47*(x-60000)+15580
  print(paste("Usted debe pagar",impuesto,"usd de impuesto"))
} else if (x>20000 & x<=50000) {
  impuesto<-0.47*(x-60000)+15580
  print(paste("Usted debe pagar",impuesto,"usd de impuesto"))
} else if (x>6000 & x<=20000){
  impuesto<-0.47*(x-60000)+15580
  print(impuesto)
} else if (x>0 & x<6000){  
  print("No paga impuesto")
} else {x<-as.numeric((readline("Porfavor revise el valor ingresado, debe ser mayor a 0.Ingresar el valor numerico de su sueldo :")))
}


#---------------------------------------ej7-------------------------------------------------------------


#a) Dadas tres variables num�ericas que contienen un d�ia, mes y a~no cualquiera, dise~nar y programar
#un algoritmo que calcule el d�ia, mes y a~no correspondiente al d�ia siguiente, sin considerar los a~nos
#bisiestos. Mostrar por pantalla la siguiente frase construida a partir del resultado: "El resultado
#es: d�ia DD de 'nombre del mes' de YYYY."
#Modificar el programa de forma tal que permita considerar los a~nos bisiestos. Tener en cuenta
#que los a~nos bisiestos son aquellos que son divisibles por 4 con la excepci�on de los que son
#divisibles por 100. No obstante aquellos a~nos que sean divisibles por 400 son bisiestos.
#2
#b) Dado un valor num�erico de d�ia, mes y a~no calcular el d�ia juliano teniendo en cuenta la posibilidad
#de que el a~no sea bisiesto.

#Ingreso todas las variables

DD <- as.numeric(readline("Ingrese un dia en fromato numerico 00: "))
mes <- as.character(readline("Ingrese el nombre de un mes (Primera letra matuscula): "))
Y <- as.numeric(readline("Ingrese un a�o en formato 0000: "))


#Estan pidiendo algo que calcule  c el dia, mes y a�o correspondiente al dia siguiente.
#Osea que si es 01 de enero, me duvuelva DD+1 = 02 de Enero
# Y si es 31 de Enero, el dia siguien es del otro mes. Osea 01 de Febrero

if(mes== "Enero"){
  if (DD==31){
    print(paste("dia 01 de febrero de",Y))
  }else {print(paste("dia",DD+1, "de", mes ,"de",Y))
  }
} else if (mes=="Febrero"){
  if (DD==28) {
    print("dia 01 de marzo de",Y)
  }else {print(paste("dia",DD+1, "de", mes ,"de",Y))
  }
} else if (mes=="Marzo"){
  if (DD==31) {
    print("dia 01 de abril de",Y)
  }else {print(paste("dia",DD+1, "de", mes ,"de",Y))
  }
}else if (mes=="Abril"){
  if (DD==30) {
    print(paste("dia 01 de mayo de",Y))
  }else {print(paste("dia",DD+1, "de", mes ,"de",Y))
  }
} else if (mes=="Junio"){
  if (DD==31) {
    print(paste("dia 01 de julio de",Y))
  }else {print(paste("dia",DD+1, "de", mes ,"de",Y))
  }
}   else if (mes=="Julio"){
  if (DD==30) {
    print(paste("dia 01 de agosto de",Y))
  }else {print(paste("dia",DD+1, "de", mes ,"de",Y))
  }
}  else if (mes=="agosto"){
  if (DD==31) {
    print(paste("dia 01 de septiembre de",Y))
  }else {print(paste("dia",DD+1, "de", mes ,"de",Y))
  }
}   else if (mes=="Septiembre"){
  if (DD==30) {
    print(paste("dia 01 de octubre de",Y))
  }else {print(paste("dia",DD+1, "de", mes ,"de",Y))
  }
}   else if (mes=="Octubre"){
  if (DD==31) {
    print(paste("dia 01 de noiembre  de",Y))
  }else {print(paste("dia",DD+1, "de", mes ,"de",Y))
  }
}   else if (mes=="Noviembre"){
  if (DD==30) {
    print(paste("dia 01 de diciembre de",Y))
  }else {print(paste("dia",DD+1, "de", mes ,"de",Y))
  }
}   else if (mes=="Diciembre"){
  if (DD==31) {
    print(paste("dia 01 de Enero de",Y))
  }else {print(paste("dia",DD+1, "de", mes ,"de",Y))
  }
} 


#Teniendo en cuenta los a�os bisiestos 
#Tener en cuenta
#que los a~nos bisiestos son aquellos que son divisibles por 4 con la excepci�on de los que son
#divisibles por 100. No obstante aquellos a~nos que sean divisibles por 400 son bisiestos.

#Osea si es divisible por 4 hay 29 de feb y si es divisible por 100 no


#Si el resto de la division entre 4 da 0 y entre 100 NO da 0, es bisiesto. O si al dividir por 400 el resto es 0.

if((Y%%4==0 & Y%%100!=0) | Y%%400==0){           
  b <- as.numeric(29) #A�o bisiesto con 29 dias en feb
}else{
  b <-as.numeric(28) #A�o NO bisiesto con 28 dias en feb
} 
if(mes== "Enero"){
  if (DD==31){
    print(paste("dia 01 de febrero de",Y))
  }else {print(paste("dia",DD+1, "de", mes ,"de",Y))
  }
} else if (mes=="Febrero"){
  if (DD==b) {                                              #Ahora DD puede ser 28 o 29 entonces le ponemos b y que decia el programa jaja
    print("dia 01 de marzo de",Y)
  }else {print(paste("dia",DD+1, "de", mes ,"de",Y))
  }
} else if (mes=="Marzo"){
  if (DD==31) {
    print("dia 01 de abril de",Y)
  }else {print(paste("dia",DD+1, "de", mes ,"de",Y))
  }
}else if (mes=="Abril"){
  if (DD==30) {
    print(paste("dia 01 de mayo de",Y))
  }else {print(paste("dia",DD+1, "de", mes ,"de",Y))
  }
} else if (mes=="Junio"){
  if (DD==31) {
    print(paste("dia 01 de julio de",Y))
  }else {print(paste("dia",DD+1, "de", mes ,"de",Y))
  }
}   else if (mes=="Julio"){
  if (DD==30) {
    print(paste("dia 01 de agosto de",Y))
  }else {print(paste("dia",DD+1, "de", mes ,"de",Y))
  }
}  else if (mes=="agosto"){
  if (DD==31) {
    print(paste("dia 01 de septiembre de",Y))
  }else {print(paste("dia",DD+1, "de", mes ,"de",Y))
  }
}   else if (mes=="Septiembre"){
  if (DD==30) {
    print(paste("dia 01 de octubre de",Y))
  }else {print(paste("dia",DD+1, "de", mes ,"de",Y))
  }
}   else if (mes=="Octubre"){
  if (DD==31) {
    print(paste("dia 01 de noiembre  de",Y))
  }else {print(paste("dia",DD+1, "de", mes ,"de",Y))
  }
}   else if (mes=="Noviembre"){
  if (DD==30) {
    print(paste("dia 01 de diciembre de",Y))
  }else {print(paste("dia",DD+1, "de", mes ,"de",Y))
  }
}   else if (mes=="Diciembre"){
  if (DD==31) {
    print(paste("dia 01 de Enero de",Y))
  }else {print(paste("dia",DD+1, "de", mes ,"de",Y))
  }
} 



#---------------------------------------ej8-------------------------------------------------------------
#  a) Calcular el cuadrado de los primeros 10 enteros positivos.
#b) �Idem a) pero para los primeros 1000 enteros pares.

for (i in 1:10) {
  i<-(i)**2
  print(i)
}

#
#Asigno una sequencia que vaya del 0 a 1000, de 2 en dos
b<-seq(0,1000,by=2)
b
#Lo meto en el ciclo for. for(objeto in seq)
for (i in b){
  i<-i**2
  print(i)
}

#---------------------------------------ej9-------------------------------------------------------------

#  De acuerdo con el m�etodo de Newton, la siguiente sucesi�on converge a la ra�iz cuadrada del n�umero a:
#Xn+1 = Xn ???(Xn^2 ??? a)/2Xn

# a) Dise~nar un algoritmo tal que utilizando este m�etodo permita calcular la ra�iz cuadrada de un
#n�umero a realizando 1000 iteraciones de la ecuaci�on.
#b) Modificar el algoritmo anterior de forma tal que la iteraci�on se detenga s�olo cuando la diferencia
#entre Xn y Xn+1 sea menor que 10???4
#.
#c) Realizar otra modificaci�on al algoritmo que impida que se superen las 10000 iteraciones. En
#caso de llegar a ese valor el programa deber�a escribir un mensaje por pantalla indicando que el
#m�etodo no converge

#Pido el ingreso del valor
a<-as.numeric(readline("Ingrese un numero: "))

#Armo el ciclo for con las iteraciones que pide

#Voy a necesitar definir una variuable    
xn<-a  

for (i in 1:1000) {         #Le pedimos al ciclo for que haga las 1000 iteraciones
  xm<-xn-((xn**2)-a)/(2*xn)
}
print(xm)                 #Le pedimos que imprima el valor de la operacion xm seria equivalente a Xn+1

#b) Modificar el algoritmo anterior de forma tal que la iteraci�on se detenga s�olo cuando la diferencia
#entre Xn y Xn+1 sea menor que 10???4 =1e-4

#Propongo el mismo ciclo solo que  ahora necesito que corte cuando Xn y Xn+1 tenga ina dif menor a 1e-4
#O uso un ciclo while o uso break y repeat

a<-as.numeric(readline("Ingrese un numero: "))  
xn<-a 

repeat{                       #Le pedimos al ciclo que repita las iteraciones y las corte cuando bla bla
  xn<-xm 
  xm<-xn-((xn**2)-a)/(2*xn)
  if (abs(xm-xn)<1e-4){           #Impongo la restriccion para que corte el ciclo
    break
  } 
}
print(xm) 



#c) Realizar otra modificaci�on al algoritmo que impida que se superen las 10000 iteraciones. En
#caso de llegar a ese valor el programa deber�a escribir un mensaje por pantalla indicando que el
#m�etodo no converge

#Es lo mismo, hay que agregarle una variable que identifique las iteraciones. Agregar dicha restriccion e ir sumandole
#1 por cada repeat

#Pido el ingreso del valor
a<-as.numeric(readline("Ingrese un numero: "))

#Armo el ciclo for con las iteraciones que pide

#Voy a necesitar definir una variuable    
xn<-a  

#CONSULTAR ESTO NO SE SI FUNCIONA

repeat{                       #Le pedimos al ciclo que repita las iteraciones y las corte cuando bla bla
  xn<-xm 
  xm<-xn-((xn**2)-a)/(2*xn)
  i<-i+1
  if (abs(xm-xn)<1e-4 | i==10000){           #Impongo la restriccion para que corte el ciclo
    break
    print("La serie no converge")
  }
}
print(xm) 







#---------------------------------------ej10-------------------------------------------------------------
#Segun el teorema de Taylor, la funcion sen(x) puede ser escrita como una serie
#de potencias de la siguiente forma:

#sen(x)=[sumatoria N de 0 ](???1)^N/((2N + 1)!)*X^(2N+1)

#Como no podemos calcular num�ericamente una suma infinita, el calculo se hace
#hasta un determinado valor de N. El error que cometemos en ese caso esta
#acotado por la siguiente expresion:

#error <= X^(2N+3)/(2N + 3)!

#Disenar y programar un algoritmo que pida ingresar un valor de X en el 
#intervalo (-pi a pi) y una precision deseada, y que el programa calcule el sen(X)
#con una precision al menos tan buena como la precision ingresada.
#Verificar los resultados utilizando la funcion intrinseca sen.
#Extender el algoritmo para calcular el valor del sen(X) para X entre (-Inf a Inf).
#(Ayuda: Usar la periodicidad de la funcion seno)



#Disenar y programar un algoritmo que pida ingresar un valor de X en el 
#intervalo (-pi a pi) y una precision deseada, y que el programa calcule el sen(X)
#con una precision al menos tan buena como la precision ingresada.

#Osea que me estan pidiendo que al ingresar un valor de X use
#sen(x)=[sumatoria N de 0 ](???1)^N/((2N + 1)!)*X^(2N+1) y que pare cuando eso sea menor a
#  #error <= X^(2N+3)/(2N + 3)!

#Pedimos ingresar un valor de x y de presicion

x<-as.numeric(readline("Ingresar un valor entre -pi y pi :"))
Presicion<-as.numeric(readline("Ingresar un valor de presicion deseado:"))    


n<-0                         #Asignamos un valor inicial a la variable n dela ecuacion
error<-1                     #Queremos que el ciclo se haga mientras que el error sea mayor a la presicion
sumatoria<-0                 #definimos esas dos variables mas adelante para poder compararlas
while (error>Presicion) {    #Como depeenden de n, debemos ir aumentando el valor de n... n+1
  sumatoria=sumatoria+((((-1)**n)*x**(2*n+1))/factorial(2*n+1))
  error<-abs(valor**(2*n+3))/factorial(2*n+3)
  n=n+1
}
#Verificar los resultados utilizando la funcion intrinseca sen.
print(sumatoria)
y<-sin(x)
print(y)

#Extender el algoritmo para calcular el valor del sen(X) para X entre (-Inf a Inf).
#NO SE QUE HACER SKIPPPPPPPP

x<-as.numeric(readline("Ingresar un valor entre -inf y inf :"))
P<-as.numeric(readline("Ingresar un valor de presicion deseado:"))    

#---------------------------------------ej11-------------------------------------------------------------

#Se leen por pantalla 5 valores de X y 5 valores de Y. Para cada uno de los 
#valores ingresados determinar si los puntos estan comprendidos dentro del
#area sombreada de la figura.


#El area sombreada abarca desde el [0;1]x[0;x]

x<-as.numeric(readline("Ingresar un valor :"))
y<-as.numeric(readline("Ingresar un valor :"))

#La condicion logica es esta
if(x<1 & x>0 & y>0 & y<=x){
  print(paste("El punto",x,y, "pertenece al area sombreada"))
}else {print(paste("El punto", x,y ,"no pertenece al area sombreada"))}

#Creo que es un ciclo for, al cual le tengo que pedir que ingrese 5 valores de x e y

for(i in 1:5){
  x<-as.numeric(readline("Ingrese un valor de x: "))
  y<-as.numeric(readline("Ingrese un valor de y: "))
  if (x>=0 & x<=1 & y>=0 & y<=x){
    print(paste("El punto ",x,",", y," esta comprendido en el area sombreada" ))
  } else { 
    print(paste("El punto ",x,",", y," no esta comprendido en el area sombreada"))
  }
}

#---------------------------------------ej12-------------------------------------------------------------
#Se quiere calcular el logaritmo decimal de todos los numeros comprendidos
#entre un numero maximo (nmax) y un numero m???nimo (nmin) (de mayor a menor) 
#y con un intervalo (int), e ir mostrandolos por pantalla a medida que se los 
#calcula. Permitir que el usuario ingrese por pantalla nmax, nmin e int. Detener
#el calculo si el argumento del logaritmo es negativo, antes que eso resulte en 
#un error y mostrar por pantalla una unica vez un mensaje que avise al usuario 
#que el calculo se interrumpio. Diseniar el 
#algoritmo y probarlo utilizando la sentencia while y la sentencia for.



#Ingresamos variables

nmax<-as.numeric(readline("Ingrese un numero maximo: "))
nmin<-as.numeric(readline("Ingrese un numero minimo: "))
a<-as.numeric(readline("Ingrese el ancho del intervalo: "))


#For
# osea me piden qie el ciclo se de entre i 1:int
#int sera una variable que deopende del ancho del intervalo y de los valores max y min
##La condicion logica es esta
if(i<=0){
  print(paste("El argumento del log no puede ser 0"))
  break}
print(paste("El resultado del log en base 10 es", log))


#El ciclo for seria
{ 
  nmax<-as.numeric(readline("Ingrese un numero maximo: "))
  nmin<-as.numeric(readline("Ingrese un numero minimo: "))
  a<-as.numeric(readline("Ingrese el ancho del intervalo: ")) #no tengo idea de como usar esto. Tipo como hago que ingrese el intervalo
} 

int<- seq(nmin,nmax)
print(int)

for (i in int) {
  if(i<=0){
    print(paste("El argumento del log no puede ser 0"))
    break
  }
  log<-log10(i)
  print(paste0("El log10 de ",int[i]," es igual a : ",log10(int[i])))
}

#Con ciclo while. No necesitramos la variable int. ojo con la condicio nde corte

nmax<-as.numeric(readline("Ingrese un numero maximo: "))
nmin<-as.numeric(readline("Ingrese un numero minimo: "))
a<-as.numeric(readline("Ingrese el ancho del intervalo: ")) #no tengo idea de como usar esto. Tipo como hago que ingrese el intervalo

i<-nmax
while (i>nmin) { #Es el extremo inf, asi que me gutsa como condicion del while
  if(i<=0){
    print(paste("El argumento del log no puede ser 0"))
    break
  }
  log<-log10(i)
  print(paste0("El log10 de ",i," es igual a : ",log10(i)))
  i<-(i-a)
}

#---------------------------------------ej13-------------------------------------------------------------

#La densidad de una poblacion de monos varıa de acuerdo con la siguiente ecuacion:
#Xn+1 = 3.75 * Xn � * (1 - Xn)
#donde cada paso representa la variacion en un mes. El valor inicial de
#0.8 (monos por hectarea). Calcular la evolucion de la densidad de monos para 
#esta poblacion durante un plazo de 20 anios, pero mostrando los valores
#calculados cada 3 meses (es decir, no imprimir todos los valores por pantalla).
#Generar dos simulaciones simultaneas, una con condicion inicial 0.8 y otra
#con condicion inicial 0.8001. ¿Cual es el comportamiento observado?


#Variables inciales

monos1<-0.8
monos2<-0.8001

#Nos piden que calculemos la poblacio nde monos por hecateras cada 3 meses en 20 a�os.
#osea la poblacion en 20*12=240 meses = m
#Como condicion del while podemos usar ese 240 e inccializarlo con 1
m<-1

#Debemos hacer que nos de el resultado cada 3 meses.
#Osea que si n es divisible por 3, nos de el resultado
#El contador seria n+1 (seria para que n alcance el valor de 240,y ademas, para que cuente mes por mes)
#Planteo el ciclo while

while (m<=240) {
  monos1<-3.75 *monos1 *(1 - monos1)
  m<-m+1
  if(m%%3==0){
    print(paste("Luego de",m,"meses hay", monos1, "por hectarea", sep = " "))
  }
}

#ahora probamos lo mismo pero con monos2
monos2<-0.8001
m<-1

while (m<=240) {
  monos2<-3.75 *monos2 *(1 - monos2)
  m<-m+1
  if(m%%3==0){
    print(paste("Luego de",m,"meses hay", monos2, "por hectarea", sep = " "))
  }
}


#La moraleja es, que hay grandes cambios aunque hayamos variado muy poco el numero de monos inciales...

#---------------------------------------ej14------------------------------------------------------------

#Realizar un programa en el cual se ingresen N valores (N se ingresa por pantalla al iniciarse el
#programa) y calcular su media y su desviaci�on est�andar.

#Para ingresar N valores usamos... BUSQUE EN GOOGLE PORQUE SINO,NI IDEA xd
#n <- scan() nos sirve para ingresar datos y acomodarlos en vectores
#Segun vi, mean me hace el promedio y sd hace el desvio estandar


print("Ingrese valores numericos: "); n <- scan() #Doble enter para dejar de subir numeros
mean(n)
sd(n)


#El promedio es la sumatoria de todos los valores dividido la cantidad total de datos


Cantidad_Valores<-as.numeric(readline("Ingresar la cantidad de valores que deseamos cargar:"))
i<-0
sumatoria<-0
{
  while (i<Cantidad_Valores) {  #i<-0 #Mientras se cumpla la condicion nos deberia pedir que ingresemos datos de pp
    Dato<-as.numeric(readline("Ingresar valores : "))
    sumatoria<-sumatoria+ Dato#Para que almacene lo que queremos, que es la suma de las notas
    i<-i+1 #Condicon para que corte
  }
  promedio<- (sumatoria/Cantidad_Valores)
  print(paste("La cantidad de datos ingresados es",Cantidad_Valores,"la sumatoria de dichos valores es", sumatoria, "su promedio es",promedio))
} 






#---------------------------------------ej15------------------------------------------------------------

#Hacer un programa que pida el ingreso del nombre y apellido de un estudiante 
#y la cantidad de materias que aprobo. Luego debe pedir el ingreso del 
#nombre de cada materia y la nota que obtuvo en cada caso. 
#Finalmente, el programa debe imprimir el siguiente mensaje:

#El estudiante NOMBRE y APELLIDO aprobo X materias y su promedio es mayor/menor/
#igual al promedio

#segun el promedio historico (8.41) o el siguiente mensaje:

#El estudiante NOMBRE y APELLIDO no aprobo materias

#El programa debe verificar en cada instancia que la cantidad de materias y
#la nota obtenida en cada caso sean numeros y en caso contrario debe pedir 
#su reingreso. 

#Aclaración: Para resolver este ejercicio no deben usarse nociones de vectores


#Pedimos que ingrese variables

Nombre<-readline("Ingresar Nombre : ")
Apellido<-readline("Ingresar Apellido : ")
Materias_Aprobadas<-as.numeric(readline("Ingresar Cantidad de materias aprobadas : "))

#Penemso en el ciclo...

i<-0
suma<-0

if(Materias_Aprobadas==0){
  print(paste("El estudiante",Nombre, Apellido,"no aprobo materias"))
}else{
  while (i<Materias_Aprobadas) {  #i<-0 #Mientras se cumpla la condicion nos deberia pedir que ingresemos el nombre de las materias y las notas 
    Nombre_Materia<-readline("Ingresar el nombre de la materia : ")
    Nota_Materia<-as.numeric(readline("Ingresar la nota de la materia : "))
    suma<-suma+Nota_Materia       #Para que almacene lo que queremos, que es la suma de las notas
    i<-i+1 #Condicon para que corte
  }
  
}



#Entonces ahroa viene la aprte de primtear cosas y else if y bla bla

#Si el promedio historico es 8.41...
Promedio_Historico<-8.41
#Definimos nuestro propio promedio, suma/materias
Promedio_Estudiante<-suma/Materias_Aprobadas
Promedio_Estudiante

if(is.na(Materias_Aprobadas)){  
  print("No es valido la cantidad materias aprobadas. Reingresar cantidad")
  Materias_Aprobadas<-as.numeric(readline("Ingrese la cantidad de materias aprobadas: "))
}else{
if (Promedio_Estudiante > Promedio_Historico){
  print(paste("El estudiante",Nombre, Apellido,"aprobo",
              Materias_Aprobadas,"materias y su promedio es mayor al promedio histrorico"))
}else if (Promedio_Estudiante == Promedio_Historico){
  print(paste("El estudiante",Nombre, Apellido,"aprobo",
              Materias_Aprobadas,"materias y su promedio es igual al promedio histrorico"))
}else{
  print(paste("El estudiante",Nombre, Apellido,"aprobo",
              Materias_Aprobadas,"materias y su promedio es menor al promedio histrorico"))
}}


#NO TENOG IDEA DE COMO HACER ESTO:
#El programa debe verificar en cada instancia que la cantidad de materias y
#la nota obtenida en cada caso sean numeros y en caso contrario debe pedir 
#su reingreso. 

#ALGO  ASI?SIII  y funciona, listo

if(is.na(Materias_Aprobadas)){  
  print("No es valido la cantidad materias aprobadas. Reingresar cantidad")
  Materias_Aprobadas<-as.numeric(readline("Ingrese la cantidad de materias aprobadas: "))
}else{print("holis")} #... #Sigue con el ciclo normalmente



#---------------------------------------ej16------------------------------------------------------------
#Dise~nar el algoritmo y realizar un programa que convierta n�umeros ar�abigos en n�umeros romanos para
#todos los n�umeros enteros entre 1 y 1000. Ayuda: La siguiente tabla muestra la conversi�on entre las
#unidades, decenas y centenas.


#Necesitaremos
#Definir millar,centena,decena y unidad
#Pedir que se ingrese un numero n
#Ciclos if y else para que el programa recorra las definiciones de centena.unidad......

#No se entendio nada pero yo me entiendo

x<-as.numeric(readline("Ingresar un numero decimal entero : "))

#Defimos las variables a usar.
#Despues de varios intentos...Quedo
#lo que hice fue definir las variables como "separada en terminos" osea
#1521--->1000+500+20+1
#antes de presentar las variables todas lindas y creo que bien, muestro un par de cuentas previas

x<-3001
trunc(x1000) #Devuelve la diviison redondeada. OSEA LO QUE QUIERO "LA UNIDAD DE MIL"
2005%%10      #Nos da el resto de la division

trunc(n/100)%%10 #Primero probe sin esto y medi cuenta que faltaba agregarle %%10


{
  x<-as.numeric(readline("Ingresar un numero decimal entero : "))
  mil<-trunc(x/1000)%%10
  mil
  centena<-trunc(x/100)%%10
  centena
  decena<-trunc(x/10)%%10
  decena
  unidades<-trunc(x/1)%%10
  unidades
}

if (x>3000){
  print("No se puede representar el numero indicado")
  x<-as.numeric(readline("Ingresar un numero decimal entero menor a 3000 : "))
} else if (mil==3) {
  mil1<-"MMM"
  print("MMM")
}else if (mil==2){
  mil1<-"MM"
  print("MM")
} else if (mil==1){
  mil1<-"M"
  print("M")
}


if (centena==9){
  centena1<-"CM"
  print("CM")
}else if (centena==8){
  centena1<-"DCCC"
  print("DCCC")
}else if (centena==7){
  centena1<-"DCC"
  print("DCC")
}else if (centena==6){
  centena1<-"DC"
  print("DC")
}else if (centena==5){
  centena1<-"D"
  print("D")
}else if (centena==4){
  centena1<-"CD"
  print("CD")
}else if (centena==3){
  centena1<-"CCC"
  print("CCC")
}else if (centena==2){
  centena1<-"CC"
  print("CC")
}else if (centena==1){
  centena1<-"C"
  print("C")
}

if (decena==9){
  decena1<-"XC"
  print("XC")
}else if (decena==8){
  decena1<"LXXX"
  print("LXXX")
}else if (decena==7){
  decena1<-"LXX"
  print("LXX")
}else if (decena==6){
  decena1<-"LX"
  print("LX")
}else if (decena==5){
  decena1<-"L"
  print("L")
}else if (decena==4){
  decena1<-"XL"
  print("XL")
}else if (decena==3){
  decena1<-"XXX"
  print("XXX")
}else if (decena==2){
  decena1<-"XX"
  print("XX")
}else if (decena==1){
  decena1<-"X"
  print("X") 
}


if (unidades==9){
  unidades1<-"XI"
  print("XI")
}else if (unidades==8){
  unidades1<-"VIII"
  print("VIII")
}else if (unidades==7){
  unidades1<-"VVI"
  print("VII")
}else if (unidades==6){
  unidades1<-"VI"
  print("VI")
}else if (unidades==5){
  unidades1<-"V"
  print("V")
}else if (unidades==4){
  unidades1<-"IV"
  print("IV")
}else if (unidades==3){
  unidades1<-"III"
  print("III")
}else if (unidades==2){
  unidades1<-"II"
  print("II")
}else if (unidades==1){
  unidades1<-"I"
  print("I")
}

print(paste(mil1,centena1,decena1,unidades1))
