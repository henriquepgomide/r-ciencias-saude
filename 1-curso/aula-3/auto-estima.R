#--- Script R de Exemplos ----
# Este script tem como base o instrumento Escala de autoestima de Roserberg. O download do banco de dados é feito rodando o script na sessão Importantdo banco de dados. Para rodar o código, lembre-se de clicar na linha e apertar as teclas control+enter ou o botão "Run".

#--- Importando banco de dados ----

install.packages("RCurl") # Instalando o pacote RCurl
library(RCurl)# Carregando pacote RCurl

meuCsv  <- getURL("https://docs.google.com/spreadsheet/pub?key=0AoPQFK9g2JridFlIYXZabWNRWXN0Um9mLVFOVzNKbXc&single=true&gid=0&output=csv", ssl.verifypeer = FALSE)  #salvando o link para a planilha do Google
ncol  <- max(count.fields(textConnection(meuCsv), sep =",")) # Estimando o número de colunas da tabela

##--- Importando Banco de Dados ---##
# Baixe o arquivo no Google Drive - Arquivo - baixar como CSV
# Rode o código abaixo selecionando o arquivo baixado

dados  <- read.csv(file.choose(),  header=TRUE, sep=",", col.names = paste0("v", seq_len(ncol)), na.strings = c("NA",""), strip.white = TRUE)

#--- Funções básicas do R banco de dados ----

# Ver os 6 primeiros casos ou seis últimos do banco de dados
# head(nomedobanco), tail(nomedobanco)
head(dados)
tail(dados)

# Ver o nome das variáveis do banco
# names(nomedobanco)
names(dados)

# Ver número de linhas (casos) e colunas (variáveis) do banco
#dim(nomedobanco)
dim(dados)

# Ver casos específicos nomedobanco[linhas,colunas]
dados[1:3,] # casos de um a três
dados[,1:3] # ver três primeiras variáveis de todos os casos
dados[1:10, 1:3] # ver trẽs primeiras variáveis dos 10 primeiros casos
dados[1:10, c("v2", "v6", "v7")] # ver variáveis v2, v6, v7 dos 10 primeiros casos

# Ver estrutura de uma variável
#str(nomedobanco$nomevariavel)
str(dados$v3) # estrutura da variável v2 que é idade.

# Ver estatísticas básicas da variável
#summary(nomedobanco$nomevariavel)
summary(dados$v3) # Estatística para variável númerica, idade
summary(dados$v6) # Estatística para dados categóricos.
#dados categóricos
#pode utilizar a função table(nomebanco$nomevariavel)
table(dados$v6)

# ver os factors (níveis) de uma variável categórica
# levels(nomebanco$nomevariavel)
levels(dados$v3)


#--- Recodificando as variáveis ----

##- Forma básica -##

# Criar variáveis com base
## dados$nomedavariavel  <- valor
dados$teste  <- 5 # Variável teste terá valor 5 para todos os casos
dados$teste1  <- "cinco" # Variável teste1 terá valor "cinco"
dados$teste2  <- dados$v2 # Variável teste2 terá valor igual a v2

# Recodificando

# Criar variável ex1  com base no valor da variável v2 (idade) existente.
dados$ex1[dados$v3<=20] <- "Menor ou igual a Vinte" 
dados$ex1[dados$v3>20] <- "Maior que Vinte" 
# Ver o resultado da recodificação
table(dados$ex1)

# Criar variável ex2 com base em valores categóricos
dados$ex2[dados$v6 == "Feminino"]  <- "Mulher"
dados$ex2[dados$v6 == "Masculino"]  <- "Homem"
# Ver o resultado da recodificação
table(dados$ex2)

# Criar variável com base em mais de uma variável
# Ex. Codificar Mulheres com mais de 21 anos
dados$ex3[dados$v6 == "Feminino" & dados$v2 < 21]  <- "Mulher com menos de 21 anos"
dados$ex3[dados$v6 == "Feminino" & dados$v2 >= 21]  <- "Mulher com 21 ou mais anos"
# Ver o resultado da recodificação
table(dados$ex3)

# Usando a função Recode do pacote "car"
install.packages("car")
library("car")


#Recodificando questões

dados$v10r  <- Recode(dados$v10, "'Concordo Plenamente'=4; 'Concordo'=3; 'Discordo'=2; 'Discordo Plenamente'=1" , as.factor.result=FALSE)
dados$v11r  <- Recode(dados$v11, "'Concordo Plenamente'=4; 'Concordo'=3; 'Discordo'=2; 'Discordo Plenamente'=1" , as.factor.result=FALSE)
dados$v12r  <- Recode(dados$v12, "'Concordo Plenamente'=4; 'Concordo'=3; 'Discordo'=2; 'Discordo Plenamente'=1" , as.factor.result=FALSE)
dados$v13r  <- Recode(dados$v13, "'Concordo Plenamente'=4; 'Concordo'=3; 'Discordo'=2; 'Discordo Plenamente'=1" , as.factor.result=FALSE)
dados$v14r  <- Recode(dados$v14, "'Concordo Plenamente'=4; 'Concordo'=3; 'Discordo'=2; 'Discordo Plenamente'=1" , as.factor.result=FALSE)
dados$v15r  <- Recode(dados$v15, "'Concordo Plenamente'=4; 'Concordo'=3; 'Discordo'=2; 'Discordo Plenamente'=1" , as.factor.result=FALSE)
dados$v16r  <- Recode(dados$v16, "'Concordo Plenamente'=4; 'Concordo'=3; 'Discordo'=2; 'Discordo Plenamente'=1" , as.factor.result=FALSE)
dados$v17r  <- Recode(dados$v17, "'Concordo Plenamente'=4; 'Concordo'=3; 'Discordo'=2; 'Discordo Plenamente'=1" , as.factor.result=FALSE)
dados$v18r  <- Recode(dados$v18, "'Concordo Plenamente'=4; 'Concordo'=3; 'Discordo'=2; 'Discordo Plenamente'=1" , as.factor.result=FALSE)
dados$v19r  <- Recode(dados$v19, "'Concordo Plenamente'=4; 'Concordo'=3; 'Discordo'=2; 'Discordo Plenamente'=1" , as.factor.result=FALSE)


# Computar valores da primeira escala segundo manual da escala de auto-estima de Rosenberg
dados$somaescala  <- dados$v10r + dados$v11r + dados$v12r + dados$v13r + dados$v14r + dados$v15r + dados$v16r + dados$v17r + dados$v18r + dados$v19r

# Dividindo grupos para comparação
# Usando a função subset
# objeto  <- subset(banco, critérios)
homens  <- subset(dados, dados$v6 == "Masculino" & dados$v3 < 25)


#--- Aula 4 ----

# Histograma - Variável númerica - ver se é normal
hist(dados$somaescala)

# qqplot - Variável númerica contra normal perfeita
qqnorm(dados$somaescala) # plota a distribuição
qqline(dados$somaescala) # plota a normal

# Boxplot - Variável númerica por categórica - Soma escala divido por gênero
boxplot(dados$somaescala ~ dados$v6)

# Scatter plot - Variavéi númericas - Soma escala por idade
plot(dados$somaescala, dados$v3)

# Gráfico de barras
barplot(table(dados$v6))


# Descrever dados
describe(dados$somaescala) # requer pacote psych carregado
summary(dados$somaescala)
mean(dados$somaescala, na.rm = TRUE)
sd(dados$somaescala, na.rm = TRUE)

#tabela de frequencias
f.table  <- function(var) {
  round(cbind(sort(table(var)/sum(table(dados$v6)), decreasing=TRUE)), 2)
}

f.table(dados$v6)


# Teste T
t.test(dados$somaescala ~ dados$v6, paired=FALSE)

# Correlação bivariada
cor.test(dados$somaescala, dados$v3)

# Regressão
model1  <- lm(dados$somaescala ~ dados$v3)
summary(model1)
plot(model1) # ver diagnósticos

# Alpha de Cronbach
alpha(dados[,20:29]) #requer pacote psych carregado

