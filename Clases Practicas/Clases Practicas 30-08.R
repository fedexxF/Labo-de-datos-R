#Ejercicio 1:
# Crear un diagrama de flujo, y escribir el pseudocodigo asociado, que permita leer
#2 números diferentes y nos diga cuál es el mayor de los 2 números.
#Ejercicio 2:
#  Crear un diagrama de flujo para un algoritmo que permita leer tres valores y
#almacenarlos en las variables A, B, y C, respectivamente, y determinar cuál es el
#mayor y el menor.

#Ingresamos valores de las variables a,b,c
x1<-as.numeric(readline("Ingresar un valor numerico :"))
x2<-as.numeric(readline("Ingresar un valor numerico :"))

if (x1>x2){print("x1 es mayor a x2")
} else if (x1==x2) {print("x1 es igual a x2")
    } else {print("x2 es mas mayor a x1")}

#-------------------------------------------------------
x1<-as.numeric(readline("Ingresar un valor numerico :"))
x2<-as.numeric(readline("Ingresar un valor numerico :"))
x3<-as.numeric(readline("Ingresar un valor numerico :"))

#IF DENTRO DE OTRO IF 

if (x1>x2 & x1>x3 ){print("x1 es mayor a x2 y a x3")
if (x2>x3) {print("x3 es menor x1 y a x2")
} else {print("x2 es menor x3 y a x2")
  }} 



#Se que esto tiene que funcionar.... 
if (x2>x3) {print("x3 es menor x1 y a x2")
  }else {print("x2 es menor x3 y a x2")}

#Voy a acomodar todo otra vez... es lo mismo 

if (x1==x2 & x1==x3) {print("x1 es igual a x2 y a x3, se necesitan usar valores numericos distintos. Reingrese los valores de x1,x2,x3")
  x1<-as.numeric(readline("Ingresar un valor numerico :"))
  x2<-as.numeric(readline("Ingresar un valor numerico :"))
  x3<-as.numeric(readline("Ingresar un valor numerico :"))
  
} else if (x1>x2 & x1>x3 ){print("x1 es mayor a x2 y a x3")
} else if (x2>x3) {print("x3 es menor x1 y a x2")
} else {print("x2 es menor que x1 y a x3")
 }
    
    
    
    
if (x1==x2 & x1==x3) {print("x1 es igual a x2 y a x3, se necesitan usar valores numericos distintos. Reingrese los valores de x1,x2,x3")
} else if (x2>x1 & x2>x3 ){print("x2 es mayor a x1 y a x3")
} else if (x1>x3) {print("x1 es menor x3 y a x2")
} else {print("x1 es menor que x2 y a x3")


    
    
#--------------------------------------------------------------------------------------------------
#crear un programa que le pida a un usuario el ingreso por consola de:
# La temperatura máxima registrada (en °C)
#La temperatura mínima registrada (en °C)
#Si la temperatura máxima ingresada es menor a la temperatura mínima,
#el código debe imprimir el mensaje : “La temperatura máxima
#ingresada es menor a la temperatura mínima, por favor verificar los
#datos”.
#Si en cambio, la temperatura máxima es mayor a la temperatura
#mínima, el código debe calcular la amplitud térmica diaria (la
#                                                            amplitud es la resta entre la temperatura máxima y mínima) y luego
#imprimir un cartel: “La amplitud diaria fue de VALOR AMPLITUD °C".
#Si las temperaturas ingresadas tuvieron el mismo valor, el programa
#debe imprimir el mensaje: “Las temperaturas ingresadas tienen el
#mismo valor, verificar si los datos ingresados son correctos”


#Ingresamos valores de las variables Tmax y Tmin
Tmax<-as.numeric(readline("Ingresar el valor maximo de Temperatura en grados °C :"))
Tmin<-as.numeric(readline("Ingresar el valor minimo de Temperatura en grados °C :"))

#Le pedimos al codigo que si Tmax>Tmin me imprima un msj pero sino se cumple, le decimos que si Tmax=Tmin nos de otro msj 
#y si no se cumple ninguna de estas condiciones, nos dice que verifiquemos los datos (Porque toma como Tmin>Tmax)
if (Tmax>Tmin) {
  Amplitud<-Tmax-Tmin 
  print(paste("La amplitud diaria fue de",Amplitud ,"°C"))
} else if (Tmax==Tmin) {print("Las temperaturas ingresadas tienen el mismo valor, verificar si los datos ingresados son correctos")
  
} else {print("La temperatura máxima ingresada es menor a la temperatura mínima, por favor verificar los datos")
  }





