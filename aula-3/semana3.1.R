#--- Script R de Exemplos ----
# Este script tem como base o instrumento ASSIST. O download do banco de dados é feito rodando o script na sessão Importantdo banco de dados. Para rodar o código, lembre-se de clicar na linha e apertar as teclas control+enter ou o botão "Run".

#--- Importando banco de dados ----

install.packages("RCurl") # Instalando o pacote RCurl
library(RCurl)# Carregando pacote RCurl

meuCsv  <- getURL("https://docs.google.com/spreadsheet/pub?key=0Atv-ntf9TI4edFpMalBzelZxa1dxZFByR29FVUFjM3c&single=true&gid=1&output=csv", ssl.verifypeer = FALSE)  #salvando o link para a planilha do Google
ncol  <- max(count.fields(textConnection(meuCsv), sep =",")) # Estimando o número de colunas da tabela

##--- Importando Banco de Dados ---##
# Importando o banco de dados "dados". Os parâmetros header = TRUE, significa que a planilha possui a primeira linha de cabeçalho; col.names, recodifica as variáveis para v+número da coluna; na.strings identifica os valores missing, neste caso NA e "" (espaço em branco).

dados  <- read.csv(textConnection(meuCsv), header=TRUE, fill = TRUE, col.names = paste0("v", seq_len(ncol)), na.strings = c("NA",""))


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
dados[1:10, c("v1", "v40", "v42")] # ver variáveis v1, v40, v42 dos 10 primeiros casos

# Ver estrutura de uma variável
#str(nomedobanco$nomevariavel)
str(dados$v2) # estrutura da variável v2 que é idade.

# Ver estatísticas básicas da variável
#summary(nomedobanco$nomevariavel)
summary(dados$v2) # Estatística para variável númerica, idade
summary(dados$v3) # Estatística para dados categóricos.
#dados categóricos
#pode utilizar a função table(nomebanco$nomevariavel)
table(dados$v3)

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
dados$ex1[dados$v2<=20] <- "Menor ou igual a Vinte" 
dados$ex1[dados$v2>20] <- "Maior que Vinte" 
# Ver o resultado da recodificação
table(dados$ex1)

# Criar variável ex2 com base em valores categóricos
dados$ex2[dados$v3 == "Feminino"]  <- "Mulher"
dados$ex2[dados$v3 == "Masculino"]  <- "Homem"
# Ver o resultado da recodificação
table(dados$ex2)

# Criar variável com base em mais de uma variável
# Ex. Codificar Mulheres com mais de 21 anos
dados$ex3[dados$v3 == "Feminino" & dados$v2 < 21]  <- "Mulher com menos de 21 anos"
dados$ex3[dados$v3 == "Feminino" & dados$v2 >= 21]  <- "Mulher com 21 ou mais anos"
# Ver o resultado da recodificação
table(dados$ex3)

# Usando a função Recode do pacote "car"
install.packages("car")
library("car")

#Parte 1 do questionário

dados$v6r  <- Recode(dados$v6, "'NAO'=0; 'SIM'=3", as.factor.result=FALSE)
dados$v7r  <- Recode(dados$v7, "'NAO'=0; 'SIM'=3", as.factor.result=FALSE)
dados$v8r  <- Recode(dados$v8, "'NAO'=0; 'SIM'=3", as.factor.result=FALSE)
dados$v9r  <- Recode(dados$v9, "'NAO'=0; 'SIM'=3", as.factor.result=FALSE)
dados$v10r  <- Recode(dados$v10, "'NAO'=0; 'SIM'=3", as.factor.result=FALSE)
dados$v11r  <- Recode(dados$v11, "'NAO'=0; 'SIM'=3", as.factor.result=FALSE)
dados$v12r  <- Recode(dados$v12, "'NAO'=0; 'SIM'=3", as.factor.result=FALSE)
dados$v13r  <- Recode(dados$v13, "'NAO'=0; 'SIM'=3", as.factor.result=FALSE)
dados$v14r  <- Recode(dados$v14, "'NAO'=0; 'SIM'=3", as.factor.result=FALSE)
dados$v15r  <- Recode(dados$v15, "'NAO'=0; 'SIM'=3", as.factor.result=FALSE)

# Computar valores da primeira escala segundo manual do ASSIST
dados$escala1  <- dados$v6r + dados$v7r + dados$v8r + dados$v9r + dados$v10r + dados$v11r + dados$v12r + dados$v13r + dados$v14r + dados$v15r


# Algumas variáveis não tem respondidas todas as alternativas possíveis. Para facilitar seu trabalho na recodificação, procure por uma de seu banco com todas descritas para então usar o Recode. A função levels(banco$nomedavariavel) é útil.

# Exemplo. Na segunda parte do ASSIST nem todos os respondentes assinalaram as alternativas possíveis. Se você rodar o código abaixo, perceberá:
levels(dados$v27)
# que só há três alternativas respondidas. No entanto, a dados$v28 possui todas assinaladas. O que facilita o processo de recategorização.
levels(dados$v28)
# Agora fica mais fácil escrever o recode para as variáveis que seguem o mesmo padrão de resposta nesta sessão do questionário. O recode modelo fica assim:
dados$v28r  <- Recode(dados$v28, "'Nunca'=0; '1 ou 2 vezes'=2; 'Mensalmente'=3; 'Semanalmente'=4; 'Diariamente ou quase todos os dias'=6", as.factor.result=FALSE)
# Você pode usá-lo para as variáveis parecidas. Use o control+c, control+v, lembrando-se de substituir o nome da variável =)




