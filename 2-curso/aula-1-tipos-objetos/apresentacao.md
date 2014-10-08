R - Tipos de Objetos
========================================================
author: Henrique Pinto Gomide
output: slidy_presentation


Objetivo da aula
========================================================

Ao final desta aula, você deverá saber:
- Tipos de vetores mais usados,
- Reconhecer os diferentes tipos de objetos mais comuns do R.

Vetores
========================================================


```r
a <- c(1,2,5.3,6,-2,4) # Numeric
b <- c("one","two","three") # Character 
c <- c(TRUE,TRUE,TRUE,FALSE,TRUE,FALSE) # Logical
```

Matrizes
========================================================


```r
y<-matrix(1:20, nrow=5,ncol=4)
print(y)
```

```
     [,1] [,2] [,3] [,4]
[1,]    1    6   11   16
[2,]    2    7   12   17
[3,]    3    8   13   18
[4,]    4    9   14   19
[5,]    5   10   15   20
```


Matrizes
========================================================


```r
y<-matrix(1:20, nrow=5,ncol=4)
print(y)
```

```
     [,1] [,2] [,3] [,4]
[1,]    1    6   11   16
[2,]    2    7   12   17
[3,]    3    8   13   18
[4,]    4    9   14   19
[5,]    5   10   15   20
```


Data Frames
========================================================

- O data frame lembra uma matriz. 
- É o tipo de vetor *mais* usado para os bancos de dados.


```r
d <- c(1,2,3,4)
e <- c("red", "white", "red", NA)
f <- c(TRUE,TRUE,TRUE,FALSE)
mydata <- data.frame(d,e,f)
names(mydata) <- c("ID","Color","Passed") # variable names 
```


Data Frames 
========================================================

Ver o data Frame


```r
print(mydata)
```

```
  ID Color Passed
1  1   red   TRUE
2  2 white   TRUE
3  3   red   TRUE
4  4  <NA>  FALSE
```


Fatores
========================================================

Diz ao R que a variável é **nominal**.


```r
# variable gender with 20 "male" entries and
# 30 "female" entries
gender <- c(rep("male",20), rep("female", 30))
gender <- factor(gender)
# stores gender as 20 1s and 30 2s and associates
# 1=female, 2=male internally (alphabetically)
# R now treats gender as a nominal variable
summary(gender) 
```

```
female   male 
    30     20 
```

Fatores - Cont.
========================================================

Também pode dizer que o fator é **ordinal**.


```r
rating <- c("large", "medium", "medium", "small", "large")
# variable rating coded as "large", "medium", "small'
rating <- ordered(rating, c("small","medium", "large"))
# recodes rating to 1,2,3 and associates
# 1=large, 2=medium, 3=small internally
# R now treats rating as ordinal 
rating
```

```
[1] large  medium medium small  large 
Levels: small < medium < large
```

Listas
========================================================

Uma coleção de diferentes tipos de vetores/objetos.


```r
# example of a list with 4 components -
# a string, a numeric vector, a matrix, and a scaler
w <- list(name="Fred", mynumbers=a, mymatrix=y, age=5.3)
```
