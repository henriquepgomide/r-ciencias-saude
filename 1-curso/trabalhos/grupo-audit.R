# Script AUDIT

#--- Carregando pacotes ----
require(psych) # uso da função describe
require(car) # uso da função recode

#---- Importando Banco de Dados ----
  
# Para importar o banco de dados, vá na planilha dos arquivos, escolha Arquivo -> Download -> arquivo csv.

# Digite o número de colunas do seu questionário
ncol  <-  11 

# Escolha o arquivo baixado
audit  <- read.csv(file.choose(), header=TRUE, fill = TRUE, col.names = paste0("v", seq_len(ncol)), na.strings = c("NA",""), encoding = "UTF8")

#---- Recodificação das variáveis ----

audit$v2r  <- Recode(audit$v2, "'4 ou mais vezes por semana'=4; 'De 2 a 3 vezes por semana'=3; 'De 2 a 4 vezes por mês'=2; 'Mensalmente ou menos'=1; 'Nunca (vá para as questões 9-10)'=0", as.factor.result=FALSE)

audit$v3r  <- Recode(audit$v3, "'10 ou mais'=4; '7, 8 ou 9'=3; '5 ou 6'=2; '3 ou 4'=1; '1 ou 2'=0", as.factor.result=FALSE)

audit$v4r  <- Recode(audit$v4, "'Todos ou quase todos os dias'=4; 'Semanalmente'=3; 'Mensalmente'=2; 'Menos do que uma vez ao mês'=1; 'Nunca'=0", as.factor.result=FALSE)

audit$v5r  <- Recode(audit$v5, "'Todos ou quase todos os dias'=4; 'Semanalmente'=3; 'Mensalmente'=2; 'Menos do que uma vez ao mês'=1; 'Nunca'=0", as.factor.result=FALSE)

audit$v6r  <- Recode(audit$v6, "'Todos ou quase todos os dias'=4; 'Semanalmente'=3; 'Mensalmente'=2; 'Menos do que uma vez ao mês'=1; 'Nunca'=0", as.factor.result=FALSE)

audit$v7r  <- Recode(audit$v7, "'Todos ou quase todos os dias'=4; 'Semanalmente'=3; 'Mensalmente'=2; 'Menos do que uma vez ao mês'=1; 'Nunca'=0", as.factor.result=FALSE)

audit$v8r  <- Recode(audit$v8, "'Todos ou quase todos os dias'=4; 'Semanalmente'=3; 'Mensalmente'=2; 'Menos do que uma vez ao mês'=1; 'Nunca'=0", as.factor.result=FALSE)

audit$v9r  <- Recode(audit$v9, "'Todos ou quase todos os dias'=4; 'Semanalmente'=3; 'Mensalmente'=2; 'Menos do que uma vez ao mês'=1; 'Nunca'=0", as.factor.result=FALSE)

audit$v10r  <- Recode(audit$v10, "'Sim, nos últimos 12 meses'=4; 'Sim, mas não nos últimos 12 meses'=2; 'Não'=0", as.factor.result=FALSE)

audit$v11r  <- Recode(audit$v11, "'Sim, nos últimos 12 meses'=4; 'Sim, mas não nos últimos 12 meses'=2; 'Não'=0", as.factor.result=FALSE)

#---- Soma Audit ----

audit$somaAudit  <- audit$v2r + audit$v3r + audit$v4r + audit$v5r + audit$v6r + audit$v7r + audit$v8r + audit$v9r + audit$v10r + audit$v11r

#---- Recodificação para zonas de risco Audit ----

audit$AuditRec[audit$somaAudit <= 7]  <-  "Educação para álcool"
audit$AuditRec[audit$somaAudit > 7 &  audit$somaAudit <= 15]  <-  "Orientação básica"
audit$AuditRec[audit$somaAudit > 15 &  audit$somaAudit <= 19]  <-  "Orientação básica e aconselhamento breve"
audit$AuditRec[audit$somaAudit > 20]  <-  "Encaminhamento para especialista"
audit$AuditRec  <- as.factor(audit$AuditRec) # A função summary só funciona para fatores. Convertendo a variável AuditRec de character para factor.

#---- Questões para serem respondidas como trabalho final ----

# Em word, salvo em pdf
# 0 - Faça um guia das variáveis do banco com os valores possíveis segundo este exemplo - https://www.dropbox.com/s/2lccmbyqyscdn30/descricao-banco-auto-estima.pdf

# Script do R
# 1 - Quantas pessoas precisam de receber orientação básica segundo o escore do AUDIT?
# 2 - Quantas pessoas não responderam todas as questões do AUDIT?
# 3 - Qual a medida de tendência central para reportar o escore do AUDIT?
# 4 - Qual gráfico você utilizaria para apresentar o escore do AUDIT?












