---
title       : Importando dados para o R
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

1. Dados em *.csv ou *.txt
2. Dados do Google Docs
3. Dados do $P$$ e outros programas

---

## Dados em *.txt
Função - read.table()

```r
str(read.table)
```

```
## function (file, header = FALSE, sep = "", quote = "\"'", dec = ".", 
##     row.names, col.names, as.is = !stringsAsFactors, na.strings = "NA", 
##     colClasses = NA, nrows = -1, skip = 0, check.names = TRUE, fill = !blank.lines.skip, 
##     strip.white = FALSE, blank.lines.skip = TRUE, comment.char = "#", 
##     allowEscapes = FALSE, flush = FALSE, stringsAsFactors = default.stringsAsFactors(), 
##     fileEncoding = "", encoding = "unknown", text)
```


Exemplo - `dados  <- read.table("arquivo", ...)`

---

## Dados em *. (cont.)

* file - o arquivo do banco
* header - o dado contém cabeçalho? TRUE or FALSE
* sep - qual o separador dos dados? vírgula ou ponto.
* fill - preencher dados em branco
* na.strings - qual é o nome dado aos dados omissos? "NA". Para incluir brancos, use o vetor c("NA","")

---

## Dados em *.csv
Funçao - read.csv()

```r
str(read.csv)
```

```
## function (file, header = TRUE, sep = ",", quote = "\"", dec = ".", 
##     fill = TRUE, comment.char = "", ...)
```


Exemplo - `dados  <- read.csv("arquivo", ...)`

---

## Dados do Google Docs - na planilha

1. Abra sua planilha no Google Drive.
2. Clique no botão compartilhar na barra superior e escolha a opção "todos com o link" na opção de visibilidade


---

## Dados do Google Docs - na planilha (cont.)

1. Com sua planilha aberta vá em "Arquivo" -> "Publicar na web..."
2. Escolha a planilha desejada e clique em "Publicar"
3. Nas opções "Estabelecer link para dados publicados", escolha "CSV" e troque de "todas as páginas" para planilha com os dados.
4. Copie o link que aparecer com "Control + C"

Se você mudar algum dado, é possível que você precise republicar a planilha, executanto estas três instruções novamente.

----

## Dados do Google Docs - no R (cont)

Pacote para fazer a mágica

```r
library(RCurl)  # Carregando pacote RCurl
```

```
## Loading required package: bitops
```

Para instalar use `install.packages("RCurl")`

---

## Dados do Google Docs - no R (cont)

Seu link aqui

```r
meuCsv <- getURL("https://docs.google.com/spreadsheet/pub?key=0Atv-ntf9TI4edFpMalBzelZxa1dxZFByR29FVUFjM3c&single=true&gid=1&output=csv")  #salvando o link para a planilha do Google
ncol <- max(count.fields(textConnection(meuCsv), sep = ","))  # Estimando o número de colunas da tabela
```


---

## Dados do Google Docs - no R (cont)


```r
dados <- read.csv(textConnection(meuCsv), header = TRUE, fill = TRUE, col.names = paste0("v", 
    seq_len(ncol)), na.strings = c("NA", ""))
```


* header = TRUE, significa que a planilha possui a primeira linha de cabeçalho; 
* col.names, recodifica as variáveis para v+número da coluna; 
* na.strings identifica os valores missing, neste caso NA e "" (espaço em branco).

---

## Testando


```r
dim(dados)
```

```
## [1] 55 76
```

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

## Dados do SPSS

* Salve o arquivo do SPSS em formato portable *.por
* Pacote foreign

```r
str(read.spss)
```

```
## Error: objeto 'read.spss' não encontrado
```


---

## Dados de outros programas

[Link para quick-stats](http://www.statmethods.net/input/importingdata.html)

---
