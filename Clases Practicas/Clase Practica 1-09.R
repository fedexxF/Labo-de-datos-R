#Calcular usando for el cudrado de los primeros cinco enteros positivos y mostrar los resultados en pantalla

# Este sirve
for (i in 1:5) {
  x<-(i)^2
  print(x)
}


2**10
2^10


for (x in 1:5) {
  x<-(x)^2
  print(x)
}

contador<-1

while (contador<=10) {
  print(contador)
  contador<- contador +2  #Sin esto, el ciclo sigue infinitamente
  
}

n<-1
cuadrado<- 0

while (contador<=4000) {
  contador<- n*2          #ES un loop infinito porque n no se modifica entonces contador va a seguir siendo menor a 4000 y sigue infinitamente todo
  
}

#Calcular la suma de elementos enteros positivos siempre y cuando el resultado de la suma sea menor o igual a 20. 
#El programa deberá imprimir por pantalla el resultado de la suma (en cada paso)

suma_enteros<- 0
 while (suma_enteros<=19) {     #"Mientras" se cumpla que "suma_enteros" <= 19, va a seguir haciendo suma_enteros+1 como le indicamos al ciclo
   suma_enteros<-suma_enteros+1 #Impongo una condicion para que la variable "suma_entero" aumente su valor y cumpla la restriccion del ciclo while
   print(suma_enteros)          #Cada vez que me se realiza el ciclo, me imprime el valor
 }                              #Nos suma hasta 20 porque cuando suma_enteros llega a 19, se sigue cumpliendo que suma_enteros<=a 19 entonces lo ahce una vez masy nos da 20. Recien ahi corta el ciclo


x<-0
suma_enteros<- 0              
while (suma_enteros<=20) {    #"Mientras" se cumpla que "suma_enteros" <= 19, va a seguir haciendo suma_enteros+1 como le indicamos al ciclo
  suma_enteros<-suma_enteros+x #Impongo una condicion para que la variable "suma_entero" aumente su valor y cumpla la restriccion del ciclo while. DEfinimos una cariable x
  print(suma_enteros)         #Cada vez que me se realiza el ciclo, me imprime el valor
  x<-x+1                      #La variable x sera x+1 asi se suma a suma_enteros y se puede finalizar el ciclo while
}       #Nos suma hasta 21 porque cuando suma_enteros llega a 15, se sigue cumpliendo que suma_enteros<=a 19 entonces lo ahce una vez masy nos da 21. Recien ahi corta el ciclo


for (i in 1:5) {
  if(i==2){
    break
  }
  print(i)
}


contador<-19
while (contador>4) {
  if (contador == 14){
    break
  } #Cierra if
  print(contador)
  contador<-contador-1 #Asi cumple la restriccion del while
}

for (i in 1:5) {
  if(i==2){
    next #Si llega a 2, salteatelo
  }
  print(i)
}


val<-6
i<-11
while (i>val) {
  if (i == 8){
    next #Saltealo cuando contador de i=8 y segui operando hasta que el ciclo while te diga
  } #Cierra if
  print(i)
  i<-i-1 #Asi cumple la restriccion del while
}


repeat {
  operaciones
  if (){}
}

x<-1
repeat{
  print(x)
  x<-x-1
  if {
    
  }
}


#Pedir por pantalla
#La cantidad total de valores de precipitacion que va a ingresar #cada valor de pp registrada en mm
#Crear un ciclo que calcule el valor acumulado (suma de valores) de pp.
#al finalizar el ciclo,el programa debe mostrar por pantalla el valor acumulada de precipitacion
#DEtalle este ejercicio nop se realiza con vectores


pp_registrado<-readline("Ingresar valores de precipitacion en mm:")
pp_registrado1<-readline("Ingresar valores de precipitacion en mm:")
pp_registrado2<-readline("Ingresar valores de precipitacion en mm:")
...

while (pp_registrado) {     
  pp_registrado<-pp_registrado+
  print(pp_registrado)          
} 

for (i in 1: ) {
  print(pp_acumulada)
}





