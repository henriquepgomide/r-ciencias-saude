---
title       : Testes t e seu amigo anormal w
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

## Antes de começar
Downloads
* [Banco de dados](https://www.dropbox.com/s/yg5ah2au41zoeun/autoestima.csv) - https://www.dropbox.com/s/yg5ah2au41zoeun/autoestima.csv
* [Descrição do banco](https://www.dropbox.com/s/2lccmbyqyscdn30/descricao-banco-auto-estima.pdf) - https://www.dropbox.com/s/2lccmbyqyscdn30/descricao-banco-auto-estima.pdf

---

## Carregando o banco da aula e pacotes




```
dados  <- read.csv(file.choose(), header=TRUE, sep=",")
require(car)
```

---

## Como responder este problema?

* Pessoas que praticam religião tem maior auto-estima?
* Traduzindo: os escores médios para escala de auto-estima variam entre aqueles que praticam ou não uma religião?
* Ou os escores médios da escala de auto-estima variam após um treinamento para auto-estima?

---

## Os tipos de teste t

* Amostras independentes
* Amostras dependentes (ou pareadas)

---

## Teste de postos de Wilcoxon

* Para uma amostra
* Para duas amostras (também conhecido como Mann-Whitney)

---

## Características dos testes

As médias de duas amostras são calculadas*
  * H0: não há diferença entre os grupos
  * H1: existe uma diferença entre as médias

---

## Pressupostos do teste t

1. A distribuição da amostra é distribuída normalmente
2. Os dados são mensurados em nível intervalar
3. Para amostras independentes
* Os grupos são diferentes
* Existe homogeneidade de variâncias


---


## Como analisar

1. Faça análises descritivas dos seus dados
2. Procure por normalidade
3. Verifique a homogeneidade de variâncias
4. Tudo ok, rode o teste
5. Calcule o tamanho do efeito


---


## Faça análises descritivas

* Ver aula sobre análise descritiva

---

## Procure por normalidade

* Ver aula "mamãe eu sou normal"

---

## Homogeneidade de variâncias

Teste de Levene

```
leveneTest(y, group, ...)
```
onde:
* y - variável de interesse
* group - variável do grupo

---

## Homogeneidade de variâncias

Exemplo


```r
leveneTest(somaescala ~ v9, data = dados)
```

```
## Levene's Test for Homogeneity of Variance (center = median)
##       Df F value Pr(>F)
## group  1    1.22   0.27
##       51
```


Se p > .05, variâncias homogêneas.

---

## O Teste t

```
t.test(x, y, data, alternative, paired)
```
Onde
x - variável 1
y - variável 2
data - banco de dados
alternative - "two.sided", "less" e "greater"
paired - TRUE or FALSE
var.equal - TRUE or FALSE

---

## Tudo ok, rode o teste


```r
testeT <- t.test(somaescala ~ v9, data = dados)
testeT
```

```
## 
## 	Welch Two Sample t-test
## 
## data:  somaescala by v9
## t = 0.3678, df = 34.31, p-value = 0.7153
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -1.177  1.697
## sample estimates:
## mean in group Não mean in group Sim 
##             26.29             26.03
```


---

## Cálculo do efeito


```r
t <- testeT$statistic[[1]]
df <- testeT$parameter[[1]]
r <- sqrt(t^2/(t^2 + df))
round(r, 3)
```

```
## [1] 0.063
```


---

## O correpondente não paramétrico

```
wilcox.test(x, y = NULL,
            alternative = c("two.sided", "less", "greater"),
            mu = 0, paired = FALSE, exact = NULL, correct = TRUE,
            conf.int = FALSE, conf.level = 0.95, ...)
```

----

## Cálculo do efeito para Wilcoxon

$W/sqrt(N)

---

## Obrigado

---

## Para saber mais

Field, A. P., & Miles, J. (2012). Discovering statistics using R. Los Angeles; London: SAGE.

---
