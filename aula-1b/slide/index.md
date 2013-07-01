---
title       : Por que diabos eu deveria estudar estatística?
subtitle    : Curso Ninja de Estatística em R para Ciências da Saúde
author      : Henrique Pinto Gomide
job         : Mestrando em Psicologia - UFJF / Pesquisador CREPEIA
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
---

## Por que diabos você deveria estudar estatística?
* Para parecer um doido perante seus colegas
* Como clínico, auxiliar seus pacientes a tomarem decisão sobre tratamentos
* Ler criticamente trabalhos científicos
* Desenvolver e testar novas técnicas e tratamentos

---

## Parecendo um doido perante seus colegas

```r
require("mvtnorm")
# ----Simulação de diferentes coeficientes de regressão#### cor(a) = 0,30;
# cor(b) = 0.60; cor(c) = 0.99
set.seed(1)
a <- rmvnorm(n = 100, mean = c(20, 40), sigma = matrix(c(5, 0.3 * sqrt(50), 
    0.3 * sqrt(50), 10), 2, 2))
set.seed(1)
b <- rmvnorm(n = 100, mean = c(20, 40), sigma = matrix(c(5, 0.6 * sqrt(50), 
    0.6 * sqrt(50), 10), 2, 2))
set.seed(1)
c <- rmvnorm(n = 100, mean = c(20, 40), sigma = matrix(c(5, 0.99 * sqrt(50), 
    0.99 * sqrt(50), 10), 2, 2))
```


---

## Parecendo um doido
<center>
![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 

</center>

---

## Alerta! Problemas na literatura científica 
Fanelli (2010)
* 2434 artigos de diversas áreas da ciência foram analisados com o objetivo de verificar se as hipóteses levantadas pelos autores eram confirmadas pelos resultados de pesquisa.
* A autora dividiu sua análise em quatro grupos a partir de duas dimensões: ciências soft vs. hard, aplicada vs. pura. Quando comparados os artigos da ciência pura e hard, os artigos da pura e aplicada apresenta, 60% de chances de terem suas hipóteses confirmadas, enquanto os da soft e pura 76% e soft aplicada 69%. Quando comparados os domínios "Ciências físicas", "Ciências biológicas" e "Ciências sociais", as chances de confirmação da hipótese do estudo foram de 80%, 84% e 88% respectivamente. 
* As disciplinas de Psicologia e Psiquiatria apresentaram 5 vezes mais chances de apresentarem resultados positivos que Ciências Espaciais.

---

## Alerta! Problemas na literatura científica (cont.)
* Um estudo em 1959 mostrou que 286 de 294 artigos em psicologia apresentavam resultados positivos (Sterling, 1959).
* Em 2011, através de uma meta-análise descobriu-se que estudos de neuroimagiem apresentam maior proporção de resultados positivos, indicando viés de publicação ou manipulação dos dados (Ioannidis, 2011).

---

## O viés de publicação
Vieses originados da publicação de artigos. Estes vieses podem ter origem porque resultados positivos: 
1. tem maior probabilidade de serem publicados
2. são publicados mais rapidamente 
3. são mais publicados em língua inglesa, 
4. tem maior probabilidade de serem publicados mais de uma vez, 
5. possuem maior probabilidade de serem citados

---

## Pesquisadores e suas bolas de cristal
* Sterling (1959) - De 294 estudos, 97,28% rejeitaram a hipótese nula de seus estudos.
* Sterling (1995) - De 597 estudos, 95,30% rejeitaram a hipótese nula do estudo

---

## Replicações não são bem vindas
* Revistas costumam dar preferências para trabalhos originais
* Replicações de estudos não são sempre bem vindas, mesmo quando há resultados claramente contrários.

---

## Exemplo - Efeito "psi"
(Bem, 2011) Numa série de nove experimentos, buscou-se avaliar a capacidade dos participantes de anteciparem imagens que gerassem uma reação afetiva comparados. Os tamanhos de efeito encontrados sugeriram que os participantes conseguiram prever as imagens num nível maior que o acaso com significância estatística.

O autor recomendou a outros pesquisadores a replicação de estudos.
* Ritchie (2012) realizou uma replicação, nenhum resultado foi encontrado.
* British Journal of Psychology, Psychological Science, Science e o períodico que publicou o artigo "original" recusaram por falta de originalidade.

---

## O que você pode fazer para melhorar a situação
* Estudar estatística para evitar embarcar em canoa furada
* Divulgar eticamente seu banco de dados publicamente 
* Divulgar todas as análises que você fez (com o R)
* Divulgar resultados negativos e contraditórios

--