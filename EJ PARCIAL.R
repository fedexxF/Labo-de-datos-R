a=array(NA,dim=c(120,4))

a[,1]=rep(2001:2010,each=12)
a[,2]=rep(1:12)
a[,3]=rnorm(120,15,3)
a[,4]=rnorm(120,40,50)

cond=which(a[,2]==9 | a[,2]==10 | a[,2]==11)

a_son=a[cond,]

tmp_son=a_son[,3]

Primavera=array(tmp_son,c(3,10))

temp_promedio<-apply(Primavera,c(2),mean)

pp=a_son[,4]
pp

Primavera1=array(pp,c(3,10))
Primavera1
pp_acumulado<-apply(Primavera1, c(2), sum)


u<-array(NA, c(10,2))
rownames(u)<-c(2001:2010)
u[,1]<-temp_promedio
u[,2]<-pp_acumulado
u

