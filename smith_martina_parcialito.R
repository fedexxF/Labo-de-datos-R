#Parcialito

# 1°: limpio mi environment y seteo el WorkDirectory.
rm(list=ls())
setwd("~/R")

# 2°: defino las variables que voy a utilizar y le solicito al usuario que ingrese la cantidad de votos.
# Para ello utilizo un readline.
cantidad_votos <- as.numeric(readline('Ingresar cantidad de votos:'))
# Defino las variables de suma como 0 para que luego se vayan acumulando.
suma_alicia <- 0
suma_bernardo <- 0
suma_cecilia <- 0
suma_enblanco <- 0

# 3°: establezco un ciclo.
# Para ello utilizo un for, teniendo en cuenta que necesito que dure segun la respuesta del usuario.
for (i in 1:cantidad_votos){
  # Le pido al usuario que ingrese su voto
  voto <- readline('Ingrese su voto: [A]licia, [B]ernardo, [C]ecilia o [O] (para voto en blanco): ')
  #uso if, else if y else para establecer las condiciones segun el voto y luego acumulo la suma de votos
  if (voto == 'A' | voto == 'a'){
    suma_alicia <- suma_alicia + 1 
  } else if (voto == 'B' | voto == 'b'){
    suma_bernardo <- suma_bernardo + 1 
  } else if (voto == 'C' | voto == 'c'){
    suma_cecilia <- suma_cecilia + 1
  } else {
    suma_enblanco <- suma_enblanco + 1
  }
}

# 4°: recuento de votos, imprimo resultados con print. Pego los textos y resultados con paste.
# Utilizo quote = FALSE para deshacerme de las comillas.
print('RESULTADOS ELECCIONES A REPRESENTANTE', quote = FALSE)
print(paste('Candidata Alicia:', suma_alicia ,'votos'), quote = FALSE)
print(paste('Candidato Bernardo:', suma_bernardo ,'votos'), quote = FALSE)
print(paste('Candidata Cecilia:', suma_cecilia ,'votos'), quote = FALSE)
print(paste('Votos en blanco/nulos:', suma_enblanco ,'votos'), quote = FALSE)
print('=============================')

# Pongo las condiciones para que defina el ganador/empate utilizando nuevamente if y else if. 
# Imprimo el resultado final.
if (suma_alicia > suma_bernardo & suma_alicia > suma_cecilia){
  print('GANADOR = Alicia', quote = FALSE)
} else if (suma_bernardo > suma_alicia & suma_bernardo > suma_cecilia){
  print('GANADOR = Bernardo', quote = FALSE)
} else if (suma_cecilia > suma_alicia & suma_cecilia > suma_bernardo){
  print('GANADOR = Cecilia', quote = FALSE)
} else if (suma_alicia == suma_bernardo & suma_alicia == suma_cecilia){
  print('Empate', quote = FALSE)
} else if (suma_alicia == suma_bernardo & suma_alicia > suma_cecilia){
  print('Empate', quote = FALSE)
} else if (suma_cecilia == suma_bernardo & suma_cecilia > suma_alicia){
  print('Empate', quote = FALSE)
} else if (suma_cecilia == suma_alicia & suma_cecilia > suma_bernardo){
  print('Empate', quote = FALSE)
}  



  
  

 