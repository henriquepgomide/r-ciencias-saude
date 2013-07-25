#--- Script R para ASSIST ----

#--- Importando banco de dados ----

install.packages("RCurl") # Instalando o pacote RCurl
library(RCurl)# Carregando pacote RCurl

meuCsv  <- getURL("https://docs.google.com/spreadsheet/pub?key=0Atv-ntf9TI4edFpMalBzelZxa1dxZFByR29FVUFjM3c&single=true&gid=1&output=csv")  #salvando o link para a planilha do Google
ncol  <- max(count.fields(textConnection(meuCsv), sep =",")) # Estimando o número de colunas da tabela

##--- Importando Banco de Dados ---##
# Importando o banco de dados "dados". Os parâmetros header = TRUE, significa que a planilha possui a primeira linha de cabeçalho; col.names, recodifica as variáveis para v+número da coluna; na.strings identifica os valores missing, neste caso NA e "" (espaço em branco).

dados  <- read.csv(textConnection(meuCsv), header=TRUE, fill = TRUE, col.names = paste0("v", seq_len(ncol)), na.strings = c("NA",""))


#--- Recodificando as variáveis ----

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


# Algumas variáveis não tem respondidas todas as alternativas possíveis. Para facilitar seu trabalho na recodificação, procure por uma de seu banco com todas descritas para então usar o recode. A função levels(banco$nomedavariavel) é útil.

# Exemplo. Na segunda parte do ASSIST nem todos os respondentes assinalaram as alternativas possíveis. Se você rodar o código abaixo, perceberá:
levels(dados$v27)
# que só há três alternativas respondidas. No entanto, a dados$v28 possui todas assinaladas. O que facilita o processo de recategorização.
levels(dados$v28)
# Agora fica mais fácil escrever o recode para as variáveis que seguem o mesmo padrão de resposta nesta sessão do questionário. O recode modelo fica assim:
dados$v28r  <- Recode(dados$v28, "'Nunca'=0; '1 ou 2 vezes'=2; 'Mensalmente'=3; 'Semanalmente'=4; 'Diariamente ou quase todos os dias'=6", as.factor.result=FALSE)
# Você pode usá-lo para as variáveis parecidas. Use o control+c, control+v, lembrando-se de substituir o nome da variável =)




