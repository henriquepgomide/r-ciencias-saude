# Script AUDIT

#--- Carregando pacotes ----
require(psych) # uso da fun��o describe
require(car) # uso da fun��o recode

#---- Importando Banco de Dados ----
  
# Para importar o banco de dados, v� na planilha dos arquivos, escolha Arquivo -> Download -> arquivo csv.

# Digite o n�mero de colunas do seu question�rio
ncol  <-  11 

# Escolha o arquivo baixado
audit  <- read.csv(file.choose(), header=TRUE, fill = TRUE, col.names = paste0("v", seq_len(ncol)), na.strings = c("NA",""), encoding = "UTF8")

#---- Recodifica��o das vari�veis ----

audit$v2r  <- Recode(audit$v2, "'4 ou mais vezes por semana'=4; 'De 2 a 3 vezes por semana'=3; 'De 2 a 4 vezes por m�s'=2; 'Mensalmente ou menos'=1; 'Nunca (v� para as quest�es 9-10)'=0", as.factor.result=FALSE)

audit$v3r  <- Recode(audit$v3, "'10 ou mais'=4; '7, 8 ou 9'=3; '5 ou 6'=2; '3 ou 4'=1; '1 ou 2'=0", as.factor.result=FALSE)

audit$v4r  <- Recode(audit$v4, "'Todos ou quase todos os dias'=4; 'Semanalmente'=3; 'Mensalmente'=2; 'Menos do que uma vez ao m�s'=1; 'Nunca'=0", as.factor.result=FALSE)

audit$v5r  <- Recode(audit$v5, "'Todos ou quase todos os dias'=4; 'Semanalmente'=3; 'Mensalmente'=2; 'Menos do que uma vez ao m�s'=1; 'Nunca'=0", as.factor.result=FALSE)

audit$v6r  <- Recode(audit$v6, "'Todos ou quase todos os dias'=4; 'Semanalmente'=3; 'Mensalmente'=2; 'Menos do que uma vez ao m�s'=1; 'Nunca'=0", as.factor.result=FALSE)

audit$v7r  <- Recode(audit$v7, "'Todos ou quase todos os dias'=4; 'Semanalmente'=3; 'Mensalmente'=2; 'Menos do que uma vez ao m�s'=1; 'Nunca'=0", as.factor.result=FALSE)

audit$v8r  <- Recode(audit$v8, "'Todos ou quase todos os dias'=4; 'Semanalmente'=3; 'Mensalmente'=2; 'Menos do que uma vez ao m�s'=1; 'Nunca'=0", as.factor.result=FALSE)

audit$v9r  <- Recode(audit$v9, "'Todos ou quase todos os dias'=4; 'Semanalmente'=3; 'Mensalmente'=2; 'Menos do que uma vez ao m�s'=1; 'Nunca'=0", as.factor.result=FALSE)

audit$v10r  <- Recode(audit$v10, "'Sim, nos �ltimos 12 meses'=4; 'Sim, mas n�o nos �ltimos 12 meses'=2; 'N�o'=0", as.factor.result=FALSE)

audit$v11r  <- Recode(audit$v11, "'Sim, nos �ltimos 12 meses'=4; 'Sim, mas n�o nos �ltimos 12 meses'=2; 'N�o'=0", as.factor.result=FALSE)

#---- Soma Audit ----

audit$somaAudit  <- audit$v2r + audit$v3r + audit$v4r + audit$v5r + audit$v6r + audit$v7r + audit$v8r + audit$v9r + audit$v10r + audit$v11r

#---- Recodifica��o para zonas de risco Audit ----

audit$AuditRec[audit$somaAudit <= 7]  <-  "Educa��o para �lcool"
audit$AuditRec[audit$somaAudit > 7 &  audit$somaAudit <= 15]  <-  "Orienta��o b�sica"
audit$AuditRec[audit$somaAudit > 15 &  audit$somaAudit <= 19]  <-  "Orienta��o b�sica e aconselhamento breve"
audit$AuditRec[audit$somaAudit > 20]  <-  "Encaminhamento para especialista"
audit$AuditRec  <- as.factor(audit$AuditRec) # A fun��o summary s� funciona para fatores. Convertendo a vari�vel AuditRec de character para factor.

#---- Quest�es para serem respondidas como trabalho final ----

# Em word, salvo em pdf
# 0 - Fa�a um guia das vari�veis do banco com os valores poss�veis segundo este exemplo - https://www.dropbox.com/s/2lccmbyqyscdn30/descricao-banco-auto-estima.pdf

# Script do R
# 1 - Quantas pessoas precisam de receber orienta��o b�sica segundo o escore do AUDIT?
# 2 - Quantas pessoas n�o responderam todas as quest�es do AUDIT?
# 3 - Qual a medida de tend�ncia central para reportar o escore do AUDIT?
# 4 - Qual gr�fico voc� utilizaria para apresentar o escore do AUDIT?












