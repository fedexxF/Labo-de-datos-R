# Escribir un programa que pida el ingreso al usuario de sus datos personales: 
#   
# Nombre, Apellido, nro de DNI (sin puntos) y fecha de nacimiento (con formato DDMMAAAA). 
# 
# El programa deberá imprimir por pantalla un resumen de la información para que el usuario verifique si es correcta y agregar 
# la edad del usuario, obtenida a través de su fecha de nacimiento y asumiendo que ya cumplió años.
# 
# El mensaje debe decir: 
#   
# A continuación verifique que la información cargada es correcta:
# Su nombre y apellido son: XXX XXX 
# Su DNI termina en: XXX 
# Ud. nació el DD/MM/AA y entonces su edad es: XX años


#Pedimos al usuario que ingrese la informacion usando la terminal

Nombre<-readline("Ingresar su nombre : ")
Apellido<-readline("Ingresar su apellido : ")
DNI<-readline("Ingresar su DNI sin puntos : ")
Nacimiento<-readline("Ingrese fecha de nacimiento en formato DDMMAAAA : ")

#Detalle que necesitaremos mas adelante para imprimir en pantalla lo pedido
substr(Nacimiento,1,2) #Variable DD
substr(Nacimiento,3,4) #vARIABLE MM
substr(Nacimiento,7,8) #vARIABLE AA (nos devuelve los ultimo dos digitos del año de nacimiento)
substr(Nacimiento,5,8) #Esto lo voy a usar apra determinar la edad, es AAAA de nacimiento. Osea el año de nacimiento.
#Algo extra
#Sys.Date() nos devuelve la fecha actual... el formnato es AAAA-MM-DD
Sys.Date()
substr(Sys.Date(),1,4) #Me interesa solo el año, asi que le saco la parte que me importa. Osea AAAA actual


#imprimimos la info cargada por el usuario + un msj

print(paste("Su nombre y apellido es", Nombre, Apellido))
print(paste("Su DNI termina en",substr(DNI,nchar(DNI)-2,nchar(DNI))))   #Usamos Nchar porque nos dice cuanto mide el DNI
print(paste("Usted nacio el", substr(Nacimiento,1,2), "/",substr(Nacimiento,3,4),"/", substr(Nacimiento,7,8), "entonces su edad es",as.numeric(substr(Sys.Date(),1,4))-as.numeric(substr(Nacimiento,5,8)) ,"años"))


#Por si no tenemos ganas de poner cada espacio y barras jajaja
print(paste("Usted nacio el", substr(Nacimiento,1,2),substr(Nacimiento,3,4), substr(Nacimiento,7,8),sep="/")) 
print(paste("entonces su edad es",as.numeric(substr(Sys.Date(),1,4))-as.numeric(substr(Nacimiento,5,8)) ,"años"))




