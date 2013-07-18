---
title       : R - Tipos de objetos
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


## Alerta ao pequeno ninja

1. Esta aula é opcional. Trabalharemos noções básicas da linguagem R. 

---


## Tipos de objetos no R utéis para o curso

* Vetores (numeric, logical, integer, character)
* Bancos de dados (data frame)
* fatores (factors)

---

## Vetores
Podem conter números (reais, caracteres, lógicos, inteiros, ...)

* numeric

```r
1 + 1 + 5
```

```
## [1] 7
```

* logic

```r
1 < 0
```

```
## [1] FALSE
```



---

## Vetores (cont.)
* character

```r
"meu nome é Henrique"
```

```
## [1] "meu nome é Henrique"
```


* integer

```r
1:10
```

```
##  [1]  1  2  3  4  5  6  7  8  9 10
```


---

## Vetores (cont.)


```r
reais <- c(1, 5, 3, 4, 5)
caracteres <- c("padre", "menino", "jegue", "pneu de caminhão")
logicos <- c(TRUE, FALSE, TRUE, FALSE)
inteiro <- 1:10
```


---

## Banco de dados (data frames)
Vamos trabalhar com estes durante o curso

```r
varA <- c(10, 5, 3, 4, 1)  # Variável A
varB <- c(1, 2, 2, 1, 1)  # Variável B
df <- data.frame(varA, varB)  # Transformando em banco de dados
```


---

## Fatores

Contém os "rótulos" dos dados

```r
a <- c("masc", "fem", "masc", "fem", "fem")  # Vetor em character
sex <- factor(a)  # Transformando em fatores
levels(sex)  # Fatores
```

```
## [1] "fem"  "masc"
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
##    52.6    84.3    98.4    98.2   111.0   153.0
```


---

## Funções (cont.)


```r
hist(sim, probability = TRUE)  # Histograma de distribuição da variável simulada
```

![plot of chunk unnamed-chunk-9](figure/unnamed-chunk-9.png) 


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

![plot of chunk unnamed-chunk-11](figure/unnamed-chunk-11.png) 

---

## Referências

[Site para iniciantes em R](http://www.statmethods.net/input/datatypes.html)
[Ridiculas](http://ridiculas.wordpress.com/)

---
