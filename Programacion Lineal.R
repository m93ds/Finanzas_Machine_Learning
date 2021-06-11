#Investigacion Operativa - Programacion Lineal
#Matias A. Salgado Mancilla
library(lpSolve) # Cargamos el paquete

# Matriz de la función objetivo
objetivo <- c(10,11,19,15)

# Matriz de las restricciones 
restricciones <- matrix(c(1,2.5,1.5,1.8,
                          1,2.5,1.5,1.8,
                          1,0,0,0,
                          0,0,1.5,0), nrow=4, byrow=TRUE)

# Lado derecho de las restricciones 
derecho <- c(5.9, 0, 0.75, 2.75)

# Dirección de las restricciones
direccion <- c("<=",">",">",">=")

# Solución óptima 
optimo <- lp(direction = "max", 
             objective.in = objetivo,
             const.mat = restricciones,
             const.dir = direccion,
             const.rhs = derecho,
             all.int = T)
optimo

mejor_sol <- optimo$solution
names(mejor_sol) <- c("Cert.dep", "Bonos.corp", "Bonos.tesor","Prest.contruc")
mejor_sol #Solucion



