# Script AUDIT

#--- Carregando pacotes ----
require(psych) # uso da função describe
require(car) # uso da função recode

#---- Importando Banco de autoEstima ----
  
# 1.  Para importar o banco de autoEstima, vá na planilha dos arquivos, escolha Arquivo -> Download -> arquivo csv.

# 2.  Digite o número de colunas do seu questionário
ncol  <-  19

# 3. Escolha o arquivo baixado
autoEstima  <- read.csv(file.choose(), header=TRUE, fill = TRUE, col.names = paste0("v", seq_len(ncol)), na.strings = c("NA",""), encoding = "UTF8")

#---- Recodificação das variáveis ----

autoEstima$v10r  <- Recode(autoEstima$v10, "'Concordo Plenamente'=4; 'Concordo'=3; 'Discordo'=2; 'Discordo Plenamente'=1" , as.factor.result=FALSE)
autoEstima$v11r  <- Recode(autoEstima$v11, "'Concordo Plenamente'=4; 'Concordo'=3; 'Discordo'=2; 'Discordo Plenamente'=1" , as.factor.result=FALSE)
autoEstima$v12r  <- Recode(autoEstima$v12, "'Concordo Plenamente'=4; 'Concordo'=3; 'Discordo'=2; 'Discordo Plenamente'=1" , as.factor.result=FALSE)
autoEstima$v13r  <- Recode(autoEstima$v13, "'Concordo Plenamente'=4; 'Concordo'=3; 'Discordo'=2; 'Discordo Plenamente'=1" , as.factor.result=FALSE)
autoEstima$v14r  <- Recode(autoEstima$v14, "'Concordo Plenamente'=4; 'Concordo'=3; 'Discordo'=2; 'Discordo Plenamente'=1" , as.factor.result=FALSE)
autoEstima$v15r  <- Recode(autoEstima$v15, "'Concordo Plenamente'=4; 'Concordo'=3; 'Discordo'=2; 'Discordo Plenamente'=1" , as.factor.result=FALSE)
autoEstima$v16r  <- Recode(autoEstima$v16, "'Concordo Plenamente'=4; 'Concordo'=3; 'Discordo'=2; 'Discordo Plenamente'=1" , as.factor.result=FALSE)
autoEstima$v17r  <- Recode(autoEstima$v17, "'Concordo Plenamente'=4; 'Concordo'=3; 'Discordo'=2; 'Discordo Plenamente'=1" , as.factor.result=FALSE)
autoEstima$v18r  <- Recode(autoEstima$v18, "'Concordo Plenamente'=4; 'Concordo'=3; 'Discordo'=2; 'Discordo Plenamente'=1" , as.factor.result=FALSE)
autoEstima$v19r  <- Recode(autoEstima$v19, "'Concordo Plenamente'=4; 'Concordo'=3; 'Discordo'=2; 'Discordo Plenamente'=1" , as.factor.result=FALSE)

#---- Soma auto-estima ----
autoEstima$somaescala  <- autoEstima$v10r + autoEstima$v11r + autoEstima$v12r + autoEstima$v13r + autoEstima$v14r + autoEstima$v15r + autoEstima$v16r + autoEstima$v17r + autoEstima$v18r + autoEstima$v19r

#---- Questões para serem respondidas como trabalho final ----

# Em word, salvo em pdf
# 0 - Faça um guia das variáveis do banco com os valores possíveis segundo este exemplo - https://www.dropbox.com/s/2lccmbyqyscdn30/descricao-banco-auto-estima.pdf

# Script do R - Descritiva
# 1 - Quantas pessoas preencheram todos as questões do questionário de auto-estima?
# 2 - Qual a medida de tendência central para reportar o escore da escala de auto-estima?
# 3 - Qual gráfico você utilizaria para comparar o escore da escala de auto-estima por sexo?
# 4 - As pessoas que praticam alguma religião possuem valores da escala maiores ou menores?
# 5 - Qual a média e desvio-padrão para os escores da escala de auto-estima para mulheres que praticam religião?













