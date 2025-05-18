#Investigacion Operativa - Simulacion

#1)
#Genero semilla
set.seed(2021)

#Creo la funcion
ventas<-function(h){
  J <- sample(
    c(10,20,30,40,50),
    size=h,
    replace=T,
    prob=c(0.20,0.25,0.25,0.20,0.10))
    sum (J) }

ventas(30)

#Cantidad de simulaciones
N<-5000

Y<-replicate(N, ventas(30))
#El vector Y contiene la simulacion de ventas totales
#para 30 dias(1 mes)
Y[1:30]
tabla<-table(Y)/N

#Hago histograma
hist(Y, main = paste("Histograma de Ventas mensuales"))

#2)
ventas_mes <-replicate(N, ventas(30))
sum(ventas_mes > 900)/5000
