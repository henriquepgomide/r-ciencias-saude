a  <- c(1,2,3,4,5)
b  <- c(1,2,3,3,4)
data  <- data.frame(a,b)

data.a  <- data.frame(a,b)
data.b  <- data.frame(a,b)

dupla.digitacao  <- function(database.a, database.b) {

for (i in 1:nrow(database$a)) {
  out  <- is.element(data$a[i], data$b[i])
  print(out)
  }

}

sim  <- rnorm(n=300, mean= 100, sd= 20)

descritivas  <-  function(varA) {
  hist(varA, xlab= paste("Variável varA simulada de média", round(mean(varA),2), "e desvio padrão", round(sd(varA),2), sep=" "), ylab="Frequência", main= "Distribuição de Frequência da Variável varA")
}

descritivas(sim)