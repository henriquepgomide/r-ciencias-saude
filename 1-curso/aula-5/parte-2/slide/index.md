---
title       : Testes de hipóteses 
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
```

---

## Resumão
* Testes de hipóteses
* Exemplo de teste - teste t
* Alfa, p, beta
* Tamanhos de efeito

---

## Testes de hipóteses
* Formular hipóteses
* Medir as variáveis envolvidas e examinar o relacionamento
* calcular a probabilidade de obter tal relacionamento ao acaso
* Se a probabilidade de resultado ao acaso for pequena, sugere-se que o padrão tem grandes chances de ser genuíno na população.

---

## Testes de hipóteses - Metáfora
* Imagine num tribunal onde a pessoa é presumidamente inocente
* O trabalho dos procuradores é convencer os jurados na hipótese alternativa, ou seja, o réu não é inocente.
* Como o procurador, o pesquisador deve mostrar que alguma coisa aconteceu

---

## Exemplo - teste t - diferença entre autoestima entre homens e mulheres

* h1 - existe uma diferença entre as médias dos escores de auto-estima entre os sexos
* h0 - não existe uma diferença entre as médias dos escores e auto-estima entre os sexos

---

## Possibilidades


Decisão da pesquisa      | Verdade sobre             | a população
-----------------------  | ------------------------- | -----------------
                         | Ho é verdadeiro           | Ho é falso
Falha em rejeitar Ho     | Decisão Correta (1-alfa)  | Erro tipo II (beta)
Rejeitar Ho              | Erro tipo I  (alfa)       | Decisão Correta (1-beta)


---

## Exemplo - teste t

```r
t.test(somaescala ~ v6, data = dados, var.equal = FALSE)
```

```
## 
## 	Welch Two Sample t-test
## 
## data:  somaescala by v6
## t = 0.2762, df = 14.1, p-value = 0.7864
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -2.223  2.880
## sample estimates:
##  mean in group Feminino mean in group Masculino 
##                   26.18                   25.85
```


---

## Diferentes testes, diferentes Ho

Atenção!

Testes estatísticos podem adotar como Ho:
* Existência de diferença ou relação
* Ausência de diferença ou relação

---

## Meu querido p < 0,05 (alfa)

* O valor p do teste significa a probabilidade de rejeitar Ho quando ela é de fato verdadeira.
* É o valor geralmente adotado pelas publicações, embora por si só não queira dizer muita coisa.

---

## Alfa, Beta, Poder

* Alfa é a probabilidade de falhar em rejeitar Ho quando ele é de fato verdadeiro
* Beta é a probabiildade de falhar em rejeitar Ho quando ele é de fato falso
* Poder é 1-beta
* Estes paramêtros são importantes em determinar o tamanho de sua amostra e o tamanho da diferença que o teste estatístico pode detectar.

---


## Referências

* Wright, D. B. (2003). Making friends with your data: Improving how statistics are conducted and  reported. British Journal of Educational Psychology, 73(1), 123.
* Goodwin, C. J. (2010). Research in psychology: methods and design. Hoboken, NJ: Wiley.
* Cohen, J. (1992). A power primer. Psychological bulletin, 112(1), 155.
* Stephane Champely (2012). pwr: Basic functions for power analysis. R package version 1.1.1. http://CRAN.R-project.org/package=pwr

---

## Obrigado

---
