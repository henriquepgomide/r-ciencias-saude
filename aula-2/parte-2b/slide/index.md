---
title       : R - Funcionalidades básicas
subtitle    : Curso Ninja de Estatística Aplicada com R para Ciências da Saúde
author      : Henrique Gomide
job         : CREPEIA, PET - Psicologia
logo        : ninja.png
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
---


## Objetivos

Apresentar a estrutura básica do RStudio

* Instalação de pacotes
* Carregar pacotes
* Definição do Working Directory
* Operações básicas
  * Matemática simples
  * Objetos
  * Funções
  * Comentários
* Importar banco de dados


--- 
  
## Introdução a interface do RStudio

1. Workspace
2. Tela de Script
3. Console
4. Gráficos
5. Arquivos
6. Pacotes

---

## Instalar pacotes

Função
```
install.packages("nome do pacote")
```

Exercício
* Instale o pacote "psych"

---

## Carregar pacotes
Ao reiniciar o R, carregue os pacotes com a função:
```
library("nome do pacote")
```

Exercício
* Carregue o pacote "psych"

---

## Definição do Working Directory

* O Working Directory é a pasta onde o R vai salvar e manipular seus arquivos.
* Pode ser consultado através da função

```r
getwd()
```

```
## [1] "/home/hpgomide/Dropbox/cursos/r-psicologia/aula-2/parte-2b/slide"
```

* Pode ser alterado graficamente ou através da função:

```r
setwd("~/Dropbox/cursos/r-psicologia/aula-2/parte-2a")
```


---

## Operações matemáticas

* O R é uma calculadora:

```r
1 + 4^4
```

```
## [1] 257
```


---

## Você pode atribuir objetos
Atribua objetos com o sinal "<-"

```r
a <- 4
b <- 5
c <- a + b
c
```

```
## [1] 9
```


---

## Parabéns, você fez seu primeiro programa
<center>
![Prostituta](assets/img/prostitute.jpg)
</center>

---

## Comentários
Você pode comentar o código do R com os símbolos #

```r
a <- 4  # Número de dedos na mão esquerda do Lula
b <- 5  # Número de dedos na mãe direita do Lula
c <- a + b  # Número de dedos nas duas mãos
c
```

```
## [1] 9
```


---

## Funções
O que faz o R valer a pena! Assume a forma de:

```nomedafuncao(parametro1, parametro2, opcoes, ...)```


```r
sim <- rnorm(n = 300, mean = 100, sd = 20)  # Simulando uma distribuição normal
summary(sim)  # Estatísticas descritivas da distribuição
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##    52.2    86.1    98.6    99.1   113.0   153.0
```


---

## Funções (cont.)


```r
hist(sim, probability = TRUE)  # Histograma de distribuição da variável simulada
```

![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7.png) 


---

## Funções (você pode escrever as suas!)

```r
descritivas <- function(varA) {
    
    hist(varA, xlab = paste("Variável varA simulada de média", round(mean(varA), 
        2), "e desvio padrão", round(sd(varA), 2), sep = " "), ylab = "Frequência", 
        main = "Distribuição de Frequência da Variável varA")
    
}
```


---

## Funções (você pode escrever as suas!)


```r
descritivas(sim)
```

![plot of chunk unnamed-chunk-9](figure/unnamed-chunk-9.png) 


---

## Importar banco de dados

Pode ser feito graficamente ou através da função
```
banco  <- read.table(file.choose())
```

---

## Obrigado!


---
