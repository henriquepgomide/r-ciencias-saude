---
title       : R - Computando variáveis para dados
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

Abra seu banco de dados ou este aqui do Docs:

```r
library(RCurl)  # Carregando pacote RCurl
meuCsv <- getURL("https://docs.google.com/spreadsheet/pub?key=0Atv-ntf9TI4edFpMalBzelZxa1dxZFByR29FVUFjM3c&single=true&gid=1&output=csv")  #salvando o link para a planilha do Google
ncol <- max(count.fields(textConnection(meuCsv), sep = ","))  # Estimando o número de colunas da tabela
dados <- read.csv(textConnection(meuCsv), header = TRUE, fill = TRUE, col.names = paste0("v", 
    seq_len(ncol)), na.strings = c("NA", ""))
```

Obs: É preciso ter o pacote RCurl instalado e uma conexão com internet.

---

## Resumo
* Métodos para modificar valores das variáveis
* Computar valores de escalas

---

## Codificando

Codificar a variável para um número apenas
```dados$ex1 <- 5```

Trocas os dados por um valor character
```dados$ex1 <- "cinco"```

Trocas os valores por missing NA
```dados$ex1 <- NA```

---


## Codificando

```
# Trocar os dados segundo um valor
dados$ex1[dados$ex1==5] <- "Cinco"

# Ou trocar os dados baseados em valores maiores ou iguais
dados$ex1[dados$ex1<=5] <- "Uso de risco ou pesado"

# Ou trocar por texto
dados$ex1[dados$ex1=="Five"] <- "Uso pesado"

# Ou trocar por missing
dados$ex1[is.na(dados$ex1)] <- "Dado Faltoso"
```

---

## Codificando usando regras de mais de uma variável

```
# Se maior que 20 anos E "SIM" na variável seis
dados$ex1[dados$v2>20 & dados$v6 == "SIM"] <- "Cinco"

# Se maior que 20 anos OU "sim" na variável seis
dados$ex1[dados$v2>20 | dados$v6 == "SIM"] <- "Cinco"

```

---

## Recodificando usando a Função Recode
* Possibilita maior número de categorizações para uma linha de código
* Depende do pacote "car". Para instalar lembre-se `install.packages("car")`


```r
dados$v6r <- Recode(dados$v6, "'NAO'=0; 'SIM'=3", as.factor.result = FALSE)
```

```
## Error: não foi possível encontrar a função "Recode"
```


---

## Comparação Recode
Modo anterior

```r
dados$v6r[dados$v6 == "NAO"] <- 0
dados$v6r[dados$v6 == "SIM"] <- 3
```


Com Recode

```r
require(car)  #carregando pacote car
```

```
## Loading required package: car
```

```
## Loading required package: MASS
```

```
## Loading required package: nnet
```

```r
dados$v6r <- Recode(dados$v6, "'NAO'=0; 'SIM'=3", as.factor.result = FALSE)
# as.factor.result para trocar a variável de factor para numeric
```


---

## Exemplo Recode e primeira parte do ASSIST


```r
dados$v6r <- Recode(dados$v6, "'NAO'=0; 'SIM'=3", as.factor.result = FALSE)
dados$v7r <- Recode(dados$v7, "'NAO'=0; 'SIM'=3", as.factor.result = FALSE)
dados$v8r <- Recode(dados$v8, "'NAO'=0; 'SIM'=3", as.factor.result = FALSE)
dados$v9r <- Recode(dados$v9, "'NAO'=0; 'SIM'=3", as.factor.result = FALSE)
dados$v10r <- Recode(dados$v10, "'NAO'=0; 'SIM'=3", as.factor.result = FALSE)
dados$v11r <- Recode(dados$v11, "'NAO'=0; 'SIM'=3", as.factor.result = FALSE)
dados$v12r <- Recode(dados$v12, "'NAO'=0; 'SIM'=3", as.factor.result = FALSE)
dados$v13r <- Recode(dados$v13, "'NAO'=0; 'SIM'=3", as.factor.result = FALSE)
dados$v14r <- Recode(dados$v14, "'NAO'=0; 'SIM'=3", as.factor.result = FALSE)
dados$v15r <- Recode(dados$v15, "'NAO'=0; 'SIM'=3", as.factor.result = FALSE)
```


---

## Dica importante

* Como o R é sensível a pequenos erros (vírgulas, diferença entre maiúsculas), você pode usar a função levels para saber quais valores colocar na recodificação.
* Sempre confira o resultado de uma recodificação. Dedos eróticos ficam famosos nesta hora.

---

## Computando os resultados da primeira parte


```r
dados$escala1 <- dados$v6r + dados$v7r + dados$v8r + dados$v9r + dados$v10r + 
    dados$v11r + dados$v12r + dados$v13r + dados$v14r + dados$v15r
```


Você pode sinais de multiplicação, exponenciação, subtração, etc...

---

## Vendo se está tudo certo


```r
head(dados$escala1)
```

```
## [1] 18  3  3  6  3 NA
```

```r
summary(dados$escala1)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
##    0.00    3.00    3.00    5.65    7.50   24.00       4
```


---

## Obrigado!


----
