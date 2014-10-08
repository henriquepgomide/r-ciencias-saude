---
title       : R - Funções vitais para dados
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

## Resumo

* Visualizar e criar variáveis e objetos
* Funções básicas
  * head, tail
  * levels
  * table

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

## Visualizar banco

```
View(dados)
```

---

## Nomes das variáveis


```r
names(dados)
```

```
##  [1] "v1"  "v2"  "v3"  "v4"  "v5"  "v6"  "v7"  "v8"  "v9"  "v10" "v11"
## [12] "v12" "v13" "v14" "v15" "v16" "v17" "v18" "v19" "v20" "v21" "v22"
## [23] "v23" "v24" "v25" "v26" "v27" "v28" "v29" "v30" "v31" "v32" "v33"
## [34] "v34" "v35" "v36" "v37" "v38" "v39" "v40" "v41" "v42" "v43" "v44"
## [45] "v45" "v46" "v47" "v48" "v49" "v50" "v51" "v52" "v53" "v54" "v55"
## [56] "v56" "v57" "v58" "v59" "v60" "v61" "v62" "v63" "v64" "v65" "v66"
## [67] "v67" "v68" "v69" "v70" "v71" "v72" "v73" "v74" "v75" "v76"
```


---

## Número de colunas e linhas


```r
dim(dados)
```

```
## [1] 55 76
```


---

## Ver dados dos primeiros casos

Use as funções head ou tail

```r
head(dados)
```

```
##                   v1 v2        v3                         v4 v5  v6  v7
## 1 7/23/2013 17:00:54 25  Feminino Ensino superior incompleto NA SIM SIM
## 2 7/23/2013 20:39:44 23  Feminino Ensino superior incompleto NA NAO SIM
## 3 7/23/2013 20:40:51 26  Feminino   Ensino superior completo NA NAO SIM
## 4 7/23/2013 20:51:58 21 Masculino Ensino superior incompleto NA NAO SIM
## 5 7/23/2013 21:08:41 NA Masculino Ensino superior incompleto NA NAO SIM
## 6 7/23/2013 21:26:18 29 Masculino Ensino superior incompleto NA SIM SIM
##    v8   v9 v10 v11 v12 v13 v14 v15        v16        v17        v18
## 1 SIM  SIM NAO NAO SIM SIM NAO NAO Nao, nunca Nao, nunca Nao, nunca
## 2 NAO  NAO NAO NAO NAO NAO NAO NAO Nao, nunca Nao, nunca Nao, nunca
## 3 NAO  NAO NAO NAO NAO NAO NAO NAO Nao, nunca Nao, nunca Nao, nunca
## 4 SIM  NAO NAO NAO NAO NAO NAO NAO Nao, nunca Nao, nunca Nao, nunca
## 5 NAO  NAO NAO NAO NAO NAO NAO NAO Nao, nunca Nao, nunca Nao, nunca
## 6 NAO <NA> NAO NAO NAO NAO NAO NAO Nao, nunca Nao, nunca Nao, nunca
##          v19        v20        v21        v22        v23        v24
## 1 Nao, nunca Nao, nunca Nao, nunca Nao, nunca Nao, nunca Nao, nunca
## 2 Nao, nunca Nao, nunca Nao, nunca Nao, nunca Nao, nunca Nao, nunca
## 3 Nao, nunca Nao, nunca Nao, nunca Nao, nunca Nao, nunca Nao, nunca
## 4 Nao, nunca Nao, nunca Nao, nunca Nao, nunca Nao, nunca Nao, nunca
## 5 Nao, nunca Nao, nunca Nao, nunca Nao, nunca Nao, nunca Nao, nunca
## 6 Nao, nunca Nao, nunca Nao, nunca Nao, nunca Nao, nunca Nao, nunca
##          v25        v26   v27          v28   v29   v30   v31   v32   v33
## 1 Nao, nunca Nao, nunca Nunca        Nunca Nunca Nunca Nunca Nunca Nunca
## 2 Nao, nunca Nao, nunca Nunca        Nunca Nunca Nunca Nunca Nunca Nunca
## 3 Nao, nunca Nao, nunca Nunca 1 ou 2 vezes Nunca Nunca Nunca Nunca Nunca
## 4 Nao, nunca Nao, nunca Nunca  Mensalmente Nunca Nunca Nunca Nunca Nunca
## 5 Nao, nunca Nao, nunca Nunca 1 ou 2 vezes Nunca Nunca Nunca Nunca Nunca
## 6 Nao, nunca Nao, nunca Nunca        Nunca Nunca Nunca Nunca Nunca Nunca
##     v34   v35   v36   v37   v38   v39   v40   v41   v42   v43   v44   v45
## 1 Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca
## 2 Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca
## 3 Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca
## 4 Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca
## 5 Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca
## 6 Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca
##     v46   v47   v48   v49   v50   v51   v52   v53   v54   v55   v56
## 1 Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca
## 2 Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca
## 3 Nunca  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>  <NA>
## 4 Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca
## 5 Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca
## 6 Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca
##            v57          v58   v59   v60   v61   v62   v63   v64   v65
## 1 1 ou 2 vezes Semanalmente Nunca Nunca Nunca Nunca Nunca Nunca Nunca
## 2        Nunca        Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca
## 3        Nunca        Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca
## 4        Nunca        Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca
## 5        Nunca        Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca
## 6        Nunca        Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca
##     v66        v67        v68        v69        v70        v71        v72
## 1 Nunca NAO, Nunca NAO, Nunca NAO, Nunca NAO, Nunca NAO, Nunca NAO, Nunca
## 2 Nunca NAO, Nunca NAO, Nunca NAO, Nunca NAO, Nunca NAO, Nunca NAO, Nunca
## 3 Nunca NAO, Nunca NAO, Nunca NAO, Nunca NAO, Nunca NAO, Nunca NAO, Nunca
## 4 Nunca NAO, Nunca NAO, Nunca NAO, Nunca NAO, Nunca NAO, Nunca NAO, Nunca
## 5 Nunca NAO, Nunca NAO, Nunca NAO, Nunca NAO, Nunca NAO, Nunca NAO, Nunca
## 6 Nunca NAO, Nunca NAO, Nunca NAO, Nunca NAO, Nunca NAO, Nunca NAO, Nunca
##          v73        v74        v75        v76
## 1 NAO, Nunca NAO, Nunca NAO, Nunca NAO, Nunca
## 2 NAO, Nunca NAO, Nunca NAO, Nunca NAO, Nunca
## 3 NAO, Nunca NAO, Nunca NAO, Nunca NAO, Nunca
## 4 NAO, Nunca NAO, Nunca NAO, Nunca NAO, Nunca
## 5 NAO, Nunca NAO, Nunca NAO, Nunca NAO, Nunca
## 6 NAO, Nunca NAO, Nunca NAO, Nunca NAO, Nunca
```


---

## Ver caso específico

dados[número da linha, número da coluna]

```r
dados[1, ]  # ver dados da primeira linha
```

```
##                   v1 v2       v3                         v4 v5  v6  v7  v8
## 1 7/23/2013 17:00:54 25 Feminino Ensino superior incompleto NA SIM SIM SIM
##    v9 v10 v11 v12 v13 v14 v15        v16        v17        v18        v19
## 1 SIM NAO NAO SIM SIM NAO NAO Nao, nunca Nao, nunca Nao, nunca Nao, nunca
##          v20        v21        v22        v23        v24        v25
## 1 Nao, nunca Nao, nunca Nao, nunca Nao, nunca Nao, nunca Nao, nunca
##          v26   v27   v28   v29   v30   v31   v32   v33   v34   v35   v36
## 1 Nao, nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca
##     v37   v38   v39   v40   v41   v42   v43   v44   v45   v46   v47   v48
## 1 Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca
##     v49   v50   v51   v52   v53   v54   v55   v56          v57
## 1 Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca 1 ou 2 vezes
##            v58   v59   v60   v61   v62   v63   v64   v65   v66        v67
## 1 Semanalmente Nunca Nunca Nunca Nunca Nunca Nunca Nunca Nunca NAO, Nunca
##          v68        v69        v70        v71        v72        v73
## 1 NAO, Nunca NAO, Nunca NAO, Nunca NAO, Nunca NAO, Nunca NAO, Nunca
##          v74        v75        v76
## 1 NAO, Nunca NAO, Nunca NAO, Nunca
```


---


## Ver caso específico (cont)

dados[número da linha, número da coluna]

```r
dados[1:2, 1:3]  # ver dados das duas primeiras linhas e das três primeiras colunas
```

```
##                   v1 v2       v3
## 1 7/23/2013 17:00:54 25 Feminino
## 2 7/23/2013 20:39:44 23 Feminino
```


---

## Ver caso específico (cont)

dados[número da linha, número da coluna]

```r
dados[1:2, c("v2", "v76")]  # ver dados das duas primeiras linhas e das variáveis v2 e v76
```

```
##   v2        v76
## 1 25 NAO, Nunca
## 2 23 NAO, Nunca
```


---

## Variáveis

Ver variável

```r
dados$v6  # ver variável v2 do banco
```

```
##  [1] SIM NAO NAO NAO NAO SIM SIM SIM NAO NAO NAO NAO NAO NAO NAO SIM NAO
## [18] SIM NAO SIM NAO SIM NAO NAO NAO NAO SIM NAO NAO NAO SIM NAO NAO NAO
## [35] SIM NAO NAO SIM NAO NAO NAO NAO NAO NAO NAO NAO NAO SIM SIM NAO NAO
## [52] SIM NAO SIM NAO
## Levels: NAO SIM
```


---

## Variáveis (cont.)

```r
str(dados$v6)  # ver estrutura da variável
```

```
##  Factor w/ 2 levels "NAO","SIM": 2 1 1 1 1 2 2 2 1 1 ...
```


---

## Criar variável


```r
dados$teste <- dados$v6  # Criar variável teste no banco com os valores da variável v6
```


---

## Levels

Ver níveis de uma variável

```r
levels(dados$v6)
```

```
## [1] "NAO" "SIM"
```

Os levels são atribuídos automaticamente quando importados. O R codifica a variável como um fator (ex. 0 = "Não"). A lista começa do 1 e o label é atribuído em ordem alfabética ("Não"" antes do "Sim").

---

## Table


```r
table(dados$v6)  #básico
```

```
## 
## NAO SIM 
##  39  16
```


```r
round(cbind(table(dados$v6, useNA = "always")/nrow(dados)), 2)  #aprimorado
```

```
##      [,1]
## NAO  0.71
## SIM  0.29
## <NA> 0.00
```


---

## Obrigado!

---
