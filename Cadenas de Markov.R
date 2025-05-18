#Investigacion Operativa - Cadenas de Markov

#Cargo paquetes
library(markovchain)
devtools::install_github('spedygiorgio/markovchain')
library(diagram)

#Creo Matriz de transicion mensual
Categorias <- c("A","B","C","D")
MatrizTrans<- matrix(c(0.30, 0.40, 0.30, 0,
                       0.30, 0.50, 0.05, 0.15,
                       0, 0, 1, 0,
                       0, 0, 0, 1),byrow=TRUE, ncol=4)

colnames(MatrizTrans) <- Categorias
rownames(MatrizTrans) <- Categorias
MatrizTrans

#Creo objeto de Markov chain
AB <- new("markovchain",transitionMatrix = MatrizTrans)

# Creo diagrama de transición
plotmat(t(AB@transitionMatrix),
        relsize = 0.90,
        box.type = 'diamond', shadow.size = 0, txt.col = "blue",txt.font = 4,
        box.lwd = 1.55,box.size = 0.08,box.col = 'light yellow',box.cex = 0.75,
        arr.col = 'red',arr.width = 0.2, arr.length = 0.25, 
        arr.type = 'triangle',arr.lwd = 1.2, arr.lcol = 'red',
        cex.txt = 0.8, curve=0.05,
        self.cex = 0.8, 
        self.shiftx = c(0.10,0.10),
        self.shifty = c(+0.00,+0.00),
        self.arrpos = c(1.5*pi,1.5*pi,0.5*pi),
        main="Categorias Deudores", cex = 1.2)

#Clasificacion de estados
summary(AB)

#Largo Plazo
steadyStates(AB)
AB^2 #2 meses
AB^6 #6 meses
AB^12 #1 año

