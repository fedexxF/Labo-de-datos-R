

#Genero dos vectores aleatorios

x<-runif(exp(1)^6)
y<-runif(exp(1)^6)

#Me piden calcualr el coeficiente de correlacion de Pearson entre x e y

#r<- (suma(xi-mean(x))(yi-mean(y)))/(sqrt(sum(xi-mean(x))^2*sum(yi-mean(y))^2) 


#Me piden sin usar funciones intrinsecas, la media, std,cov,cor y usando loops

funcion1<-function(x,y){
  
sumatoria<-0
{
  for(i in 1:length(x)) {  #Itera de 1 hasta la longitud de x
    sumatoria<-sumatoria+ x[i]#Para que almacene lo que queremos, que es la suma de las notas
  }
  promediox<- (sumatoria/length(x))
  print(paste("La cantidad de datos ingresados es",length(x),"la sumatoria de dichos valores es", sumatoria, "su promedio es",promediox))
} 

sumatoria<-0
{
  for(i in 1:length(y)) {  #Itera de 1 hasta la longitud de x
    sumatoria<-sumatoria+ y[i]#Para que almacene lo que queremos, que es la suma de las notas
  }
  promedioy<- (sumatoria/length(y))
  print(paste("La cantidad de datos ingresados es",length(y),"la sumatoria de dichos valores es", sumatoria, "su promedio es",promedioy))
} 
i<-0
for (i in 1:length(x)) {
  r<-((sum((x[i]-promediox)*(y[i]-promedioy)))/(sqrt(sum((x[i]-promediox)^2)*sum((y[i]-promedioy)^2))))
}
print(paste("El coeficiente de correlacion entre x e y es igual a : ",r))
}

funcion1(x,y)

#Usando mean y dot

mean(x)
mean(y)

funcion2<function(x,y){
for (i in 1:length(x)) {
  r<-((sum((x[i]-mean(x))*(y[i]-mean(y))))/(sqrt(sum((x[i]-mean(x))^2)*sum((y[i]-mean(y))^2))))
}
}

funcion2<-function(x,y){
  xm<-mean(x)
  ym<-mean(y)
cov = matrix(x-xm, row=length(x),ncol = 1)%*%matrix(y-ym,nrow = 1,ncol = length(y))
cov = sum((x-xm)-(y-ym))
stdx = sqrt(sum((x-xm)^2)/(length(x)))
stdy = sqrt(sum((y-ym)^2)/(length(y)))
}


#Generar una version compilada de la funcion a y b




#Usar system.time comparar los tiempos empleados por las funciones desarrolladas en a b c y d con el desempeño de la funcionm intrinseca cor.






cs_for_4 = function(x){
  xc = integer( length(x) )
  for(i in 1:length(x)){
    if(i == 1){
      xc[i] = 1
    } else {
      xc[i] = xc[i-1] + x[i]
    }
  }
  xc
}

cs_for_4(x)















